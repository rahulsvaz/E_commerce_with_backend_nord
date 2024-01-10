const PORT = 3000;
const express = require("express");
const authRouter = require("./routes/auth");
const app = express();
const mongoose = require("mongoose");

// middle ware
app.use(authRouter);

//  we need to make connection to the database
const DB =
  "mongodb+srv://mrsvaz:Readytorace799@cluster0.3mh6meu.mongodb.net/?retryWrites=true&w=majority";
mongoose
  .connect(DB) 
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, () => {
  console.log(`connected to ${PORT}`);
});
