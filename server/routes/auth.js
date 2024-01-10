const express = require("express");
const authRouter = express.Router();

// creating post api

authRouter.post("api/signup",(req,res)=>{
    // getting data from client
    const {name,email,password} = req.body;
    // post the data to database 

});
module.exports = authRouter;
