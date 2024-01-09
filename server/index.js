const PORT = 3000;
const express = require("express");
const authRouter = require("./routes/auth");
const app = express();

app.use(authRouter);
app.listen(PORT ,()=>{
    console.log(`connected to ${PORT}`)
})