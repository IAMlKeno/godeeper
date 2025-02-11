import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'sermons';
const service = new GenericService(table);

// Sermons
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
  // let json = req.body;
  // const body = {
  //   $set: {
  //     name: json.name,
  //   }
  // };
  // let result = await service.update(req.params.id, body);

  res.send('Not available').status(501);
});

router.delete('/:id', (req, res) => res.send('Not available').status(501));

export default router;