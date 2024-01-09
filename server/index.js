const PORT = 3000;
const express = require("express");
const app = express();

app.get("/",(req,res)=>{
    res.json({"name":"Macbook"});
});
app.listen(PORT ,()=>{
    console.log(`connected to ${PORT}`)
})