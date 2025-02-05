import express from "express";
import cors from "cors";
import "./loadEnvironment.mjs";
import "express-async-errors";
import tags from "./routes/tags.mjs";
// import posts from "./routes/posts.mjs";

// const express = require('express');
// const { default: db } = require('./db/conn.mjs');
const app = express();

app.use(cors());
app.use(express.json());

app.use('/tags', tags);

// app.get('/taggs', async (req, res) => {
//   console.log('STARTING');
//   let collection = await db.collection('tags');
//   console.log('STARTING 1');
//   console.log(collection);
//   let result = await collection.find({}).limit(50).toArray();
//   console.log('STARTING 2');
//   console.log(result);

//   res.send(results).status(200);
// });

app.get('/', (req, res) => res.send('Hello world!'))

// Sermons
app.get('/sermon', (req, res) => res.send('Hello sermon!'))
app.get('/sermons', (req, res) => res.send('Hello sermons!'))
app.put('/sermons', (req, res) => res.send('Hello world!'))
app.post('/sermons', (req, res) => res.send('Hello world!'))
app.delete('/sermons', (req, res) => res.send('Hello world!'))

// Users
app.get('/user', (req, res) => res.send('Hello user!'))
app.put('/user', (req, res) => res.send('Hello world!'))
app.post('/user', (req, res) => res.send('Hello world!'))
app.delete('/user', (req, res) => res.send('Hello world!'))
app.get('/user/name/available', (req, res) => res.send('Hello username!'))
app.get('/user/name/annoymous', (req, res) => res.send('Hello annoymous!'))

// Notes
app.get('/getMyNotes', (req, res) => res.send('Hello my notes!'))
app.get('/notes', (req, res) => res.send('Hello notes!'))
app.get('/note', (req, res) => res.send('Hello note!'))
app.post('/note', (req, res) => res.send('Hello world!'))
app.put('/note', (req, res) => res.send('Hello world!'))
app.delete('/note', (req, res) => res.send('Hello world!'))

const port = process.env.PORT || 4200

app.use((err, _req, res, next) => {
  console.log(err);
  res.status(500).send("Uh oh! An unexpected error occured.")
})

app.listen(port, () => 
  console.log(`Server is listening on port ${port}.`)
)

// module.exports = app;

/*
Notes service
  Get notes
  Get a note (random)
  Get notes by sermon
    Random subset with random sorting
  Get notes by tag
    Random subset 
  Add a note
  Update my note
  Delete my note

User service
  Get an anonymous name
  Ensure username unique
  Ensure anonymous name available
  Relations service
  Create connection
  Ensure a connection does not exist 
  Get another connection
  Cancel existing and generate new
  Authorization service
  ?
Sermon service
  Get sermon
  Add sermon
  Update sermon
  Tag service (admin)
  Get
  Add
  Update
  Delete
Archiving service
  Move notes to user cloud/storage
  Move sermon to cloud


*/