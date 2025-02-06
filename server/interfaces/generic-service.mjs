import db from "../db/conn.mjs";

class GenericService {

  constructor(table) {
    this.table = table;
  }

  async getAll() {
    let collection = db.collection(this.table);
    let results = collection.find({}).toArray();

    return results;
  }

  async create(body) {
    let collection = await db.collection(this.table);
    let newDocument = body;
    let result = await collection.insertOne(newDocument);

    return result;
  }

}

export default GenericService;