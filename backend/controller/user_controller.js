const userService = require("../services/user_services");

exports.register = async (req, res, next) => {
  try {
    const { name, email, password,cpassword, role, reg } = req.body;

    const successRes = await userService.RegisterUser(
      name,
      email,
      password,
      cpassword,
      role,
      reg
    );

    res.status(200).json({ status: true, success: "User Registered Successfully" });
  } catch (error) {
        throw error;
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const User = await userService.CheckUser(email);

    if (!User) {
      throw new Error("User Dont Exist");
    }

    const isMatch = await User.comparepassword(password);
    if (isMatch === false) {
      throw new Error("Password Invalid");
    }
    
    let tokenData = { _id: User._id, email: User.email };

    const token = await userService.generateToken(tokenData, "secretKey", "1h");

    res.status(200).json({ status: true, token: token })

  } catch(error){
        throw error
        next(error);

    
  }
};
