import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'sermons';
const service = new GenericService(table);

// Sermons
router.get('/:id', (req, res) => res.send('Hello sermon!'))

router.get('/', async (req, res) => {
  let results = await service.getAll();

  res.send(results).status(200);
});

router.post('/', async (req, res) => {
  let result = await service.create(req.body);

  res.send(result).status(204);
});

router.put('/', (req, res) => res.send('Hello world!'))
router.delete('/:id', (req, res) => res.send('Hello world!'))

export default router;