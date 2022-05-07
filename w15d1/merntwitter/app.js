const express = require("express");
const app = express();
// const mongoose = require('mongoose');
const port = process.env.PORT || 5000;

app.get("/", (req, res) => res.send("This is awesome!!!"));
app.listen(port, () => console.log(`Server is running on port ${port}`));

const db = require('./config/keys').mongoURI;

// mongoose
//   .connect(db, { useNewUrlParser: true })
//   .then(() => console.log("Connected to MongoDB successfully"))
//   .catch(err => console.log(err));

  const { MongoClient, ServerApiVersion } = require('mongodb');
  const uri = "mongodb+srv://dev:peterkim@merntwitterpeterkim.wscqm.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
  const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });
  client.connect(err => {
    const collection = client.db("test").collection("devices");
    // perform actions on the collection object
    client.close();
  });