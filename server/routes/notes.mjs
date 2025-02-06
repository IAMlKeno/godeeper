import express from "express";
import GenericService from "../interfaces/generic-service.mjs";

const router = express.Router();
const table = 'users';
const service = new GenericService(table);

// Notes
router.get('/getMyNotes', (req, res) => res.send('Hello my notes!'))
router.get('/notes', (req, res) => res.send('Hello notes!'))
router.get('/note', (req, res) => res.send('Hello note!'))
router.post('/note', (req, res) => res.send('Hello world!'))
router.put('/note', (req, res) => res.send('Hello world!'))
router.delete('/note', (req, res) => res.send('Hello world!'))

export default router;