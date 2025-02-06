import express from "express";
import cors from "cors";
import "./loadEnvironment.mjs";
import "express-async-errors";
import notes from "./routes/notes.mjs";
import sermons from "./routes/sermons.mjs";
import tags from "./routes/tags.mjs";
import users from "./routes/users.mjs";

const port = process.env.PORT || 4200
const app = express();

app.use(cors());
app.use(express.json());

app.use('/tags', tags);
app.use('/sermons', sermons);
app.use('/notes', notes);
app.use('/users', users);

// Index page.
app.get('/', (req, res) => res.send('Hello world!'))

// Error handler.
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