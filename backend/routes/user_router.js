const router = require('express').Router();
const userController = require('../controller/user_controller');

router.get('/', (req,res)=>{
    res.send("Hello");
});
router.post('/registration',userController.register);
router.get('/login', userController.login);

module.exports =router;