import express from "express";
import db from "../db/conn.mjs";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'tags';
const service = new GenericService(table);

// Tags
router.get('/', async (req, res) => {
  console.log('STARTING');
  let results = await service.getAll();
  console.log(results);

  res.send(results).status(200);
});

router.get('/:id', async (req, res) => {
  console.log('STARTING');
  let collection = await db.collection('tags');
  console.log('STARTING 1');
  console.log(collection);
  let results = await collection.find({}).limit(50).toArray();
  console.log('STARTING 2');
  console.log(results);

  res.send(results).status(200);
});


router.post('/', async (req, res) => {
  let result = await service.create(req.body);
  res.send(result).status(204);
});

router.put('/:id', (req, res) => res.send('Hello world!'))
router.delete('/:id', (req, res) => res.send('Hello world!'))
/**
 * Accept an array of ids and return all matching tags
 */
router.post('/set', (req, res) => res.send('Hello world!'))

export default router;