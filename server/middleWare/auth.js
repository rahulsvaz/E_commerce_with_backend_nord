const jwt = require("jsonwebtoken");

const auth = async (req, res,next)=>{
    try{
        const token = req.header('x-auth-token'); 
        if(!token){
            return res.status(401).json({msg: "No Auth Token, Access Denied"});

            // 401 is un authorized
            
        }

        const verified = jwt.verify(token, "passwordKey");
        if(!verified) return res.status(401).json({msg: "Token Verification Failed , authorization denied"});

        req.user = verified.id;
        req.token = token;
        // if we didn't  specify this next() callback function then will not go to the api routes

         next();

    }catch(e){
        res.status(500).json({error: e.message})
    }
}
module.exports = auth;