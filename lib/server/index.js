const PORT =3000;
const express =require("express");
const app = express();
app.get("/",(req,res)=>{
res.json({"name":"rahul", "age":29,"alive":true})
});

app.listen(PORT,()=>{
console.log(`connected at port ${PORT}`)
});
// creating an api 
// get put delete 


