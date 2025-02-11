import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'notes';
const service = new GenericService(table);

// Notes
router.get('/mine', async (req, res) => {
  let userId = req.params.userId;
  const queryAndFilters = {
    userId: userId
  };
  const results = await service.getAll(queryAndFilters);

  res.send(results).status(200);
});

router.get('/others', async (req, res) => {
  let [userId, sermonId] = req.params; // not sure if a record can be spread like this
  const queryAndFilters = {
    $not: { userId: userId },
    sermon: sermonId
  };
  const results = await service.getAll(queryAndFilters);

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
      title: title,
      body: json.body,
      tags: tags,
      sermon: sermon,
    }
  };
  let result = await service.update(req.params.id, body);
  res.send(result).status(204);
});

router.delete('/:id', async (req, res) => {
  let results = await service.delete(req.params.id);
  res.send(results).status(204);
});

export default router;