const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();

// creating post api

authRouter.post("api/signup", async (req,res)=>{
    // getting data from client
    const {name,email,password} = req.body;
    // post the data to database 

   const existingUser = await User.findOne({email});

   if(existingUser){
   return res.status(400).json({msg:"user with same email already exists"});
   }

});
module.exports = authRouter;
