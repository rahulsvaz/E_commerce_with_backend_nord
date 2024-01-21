const PORT = 3000;
const express = require("express");
const authRouter = require("./routes/auth");
const app = express();
const mongoose = require("mongoose");


// middle ware
app.use(express.json());
app.use(authRouter);
mongoose.set('strictQuery', true);

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



app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected to ${PORT}`);
});
