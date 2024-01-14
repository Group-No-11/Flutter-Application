const app = require("./app");
const db = require("./config/db");
const userModel = require("./model/user_model");

const port = 3006;

app.get("/", (req, res) => {
  res.send("Hello World...@@@!");
});

app.listen(port, () => {
  console.log("Connected on Port http://localhost:3006");
});
