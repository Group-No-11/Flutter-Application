const sign  = require('jsonwebtoken');
const userModel = require('../model/user_model');
const jwt = require('jsonwebtoken');


class userService{
    static async RegisterUser(name,email,password,cpassword,role,reg){
        try{
            const CreateUser = new userModel({name,email,password,cpassword,role,reg});
            return await CreateUser.save();
        }catch(err){
            throw err;
        }
    }
    
    static async CheckUser(email){
        try{
            return await userModel.findOne({email});
        }catch(error){
            throw error;
        }
    }
    /////
    static async generateToken(tokenData,secretKey,jwt_expire){
        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});
    }
    ////
}
module.exports = userService;