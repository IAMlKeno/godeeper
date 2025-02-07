import express from "express";
import GenericService from "../interfaces/generic-service.mjs";
import { ObjectId } from "mongodb";

const router = express.Router();
const table = 'tags';
const service = new GenericService(table);

// Tags
router.get('/', async (req, res) => {
  let results = await service.getAll();

  res.send(results).status(200);
});

router.get('/:id', async (req, res) => {
  let results = await service.getOne(req.params.id);

  res.send(results).status(200);
});

router.post('/', async (req, res) => {
  let result = await service.create(req.body);
  res.send(result).status(204);
});

router.put('/:id', async (req, res) => {
  let json = req.body;
  const body = {
    $set: {
      name: json.name,
    }
  };
  let result = await service.update(req.params.id, body);
  res.send(result).status(204);
});

router.delete('/:id', async (req, res) => {
  let results = await service.delete(req.params.id);
  res.send(results).status(204);
});

/**
 * Accept an array of ids and return all matching tags
 */
router.post('/set', async (req, res) => {
  let inBody = [];
  let json = req.body; // an array of objects { id: <value> }
  json.forEach((i) => inBody.push(ObjectId.createFromHexString(i.id)));

  const queryAndFilters = {
    _id: {
      $in: inBody
    }
  };
  const results = await service.getAll(queryAndFilters);

  res.send(results).status(200);
});

export default router;