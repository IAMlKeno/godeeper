import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'users';
const service = new GenericService(table);

// Users
router.get('/:id', async (req, res) => {
  let results = await service.getOne(req.params.id);

  res.send(results).status(200);
});

router.put('/:id', async (req, res) => {
  let json = req.body;
  const body = {
    $set: {
      username: json.username,
      annoymous: json.annoymous,
    }
  };
  let result = await service.update(req.params.id, body);
  res.send(result).status(204);
});

router.post('/', async (req, res) => {
  let result = await service.create(req.body);
  res.send(result).status(204);
});

router.delete('/:id', async (req, res) => {
  let results = await service.delete(req.params.id);
  res.send(results).status(204);
});

router.get('/name/available', async (req, res) => {
  let name = req.params.username;
  const queryAndFilters = {
    username: name
  };
  const results = (await service.getAll(queryAndFilters)).length;

  // Return false if a match is found
  res.send(!results > 0).status(200);
});

router.get('/name/annoymous', (req, res) => res.send(generateAnAnomaly()));

function generateAnAnomaly() {
  const prefixes = [
    'flying',
    'soaring',
    'gracious',
  ];
  const nouns = [
    'monkey',
    'gazelle',
    'hippo',
  ];
  const suffixes = [
    'invader',
    'crusader',
    'conqueror',
  ];
  let nPrefix = prefixes[generateANumber()];
  let nNoun = nouns[generateANumber()];
  let nSuffix = suffixes[generateANumber()];

  return nPrefix + nNoun + nSuffix + generateANumber(200);
}

function generateANumber(max = 3) {
  return Math.floor(Math.random() * max);
}


export default router;