import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'users';
const service = new GenericService(table);

// Users
router.get('/user', (req, res) => res.send('Hello user!'))
router.put('/user', (req, res) => res.send('Hello world!'))
router.post('/user', (req, res) => res.send('Hello world!'))
router.delete('/user', (req, res) => res.send('Hello world!'))
router.get('/user/name/available', (req, res) => res.send('Hello username!'))
router.get('/user/name/annoymous', (req, res) => res.send('Hello annoymous!'))

export default router;