console.log('hello')
const PORT = 3000;
const express = require('express');
// like import in flutter 
// here we can use express with express keyword; eg : in flutter we can use the final firebase = Firebase.instance;
const app = express();
// create api
app.listen(PORT,"0.0.0.0",()=>{
console.log(`connected at port ${PORT}`)
});