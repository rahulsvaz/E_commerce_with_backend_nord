const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

// creating post api

authRouter.post("/api/signup", async (req, res) => {
  try {
    // getting data from client
    const { name, email, password } = req.body;
    // post the data to database

    const existingUser = await User.findOne({ email });
    // status code 400 for client error we are not responsible for when user enters an existing user id so we use status code 400 its for client error
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "user with same email already exists" });
    }

    // hashed password will decrypt our password and add some random letters on mongo db data base // 8 stands for random 8 in anywhere

    const hashedPassword = await bcryptjs.hash(password, 8);

    // let is a variable like var in dart
    // we added the user in a new variable with hashed password
    let user = new User({
      name,
      email,
      password: hashedPassword,
    });

    // here we are saved the user
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });

    if (!user) {
      return res
        .status(400)
        .json({ msg: "User With this email is not exist!!! " });
    }
    // we need to check the hashed password and entering password are the same

    const isMatch = await bcryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password !!!" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });

    //... means object de structuring
    // name: 'rahul,
    // email: like this
    // it will give us specific properties
    //
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = authRouter;
