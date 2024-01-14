const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

const db = require("../config/db");

const { Schema } = mongoose;

const userSchema = new Schema({
  name: {
    type: String,
    required: true,
    lowercase: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  cpassword: {
    type: String,
    required: true,
  },
  role: {
    type: String,
    required: true,
  },
  reg: {
    type: String,
    required: true,
    unique: true,
  },
});

userSchema.pre("save", async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashpass = await bcrypt.hash(user.password, salt);
    user.password = hashpass;
  } catch (error) {
    throw error;
  }
});

userSchema.pre("save", async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashpass = await bcrypt.hash(user.cpassword, salt);
    user.cpassword = hashpass;
  } catch (error) {
    throw error;
  }
});

userSchema.methods.comparepassword = async function (candidatePassword) {
  try {
    return await bcrypt.compare(candidatePassword, this.password);
  } catch (error) {
    throw error;
  }
};

const userModel = db.model("user", userSchema);

module.exports = userModel;
