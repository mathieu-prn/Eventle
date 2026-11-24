const express = require('express');
const app = express();
const port = 3000;

const cors = require("cors");
const db = require("./db");

app.use(cors());
app.use(express.json());

db.connect((err) => {
    if (err) throw err;
    console.log("Succesfully connected to the database !")
});

const { game_generation, sendGame } = require("./game_generation");
const { getUsers, deleteUser } = require("./admindashboard");

app.get("/play", game_generation);
app.get("/playarchive", (req, res) => sendGame(req.query.date, res));

app.post("/register", require("./register"));
app.post("/login", require("./login"));
const auth = require("./auth");

app.get("/auth", auth.requireAuth, auth.authenticate);
app.post("/updatedetails", auth.requireAuth, require("./updatedetails"));
app.get("/archive", auth.requireAuth, require("./archive"));
app.post("/restore", auth.requireAuth, require("./restore"));
app.get("/users", auth.requireAdminAuth, getUsers);
app.delete("/deleteuser", auth.requireAdminAuth, deleteUser);

app.post("/round1", auth.optionalAuth, require("./round1"));
app.post("/round2", auth.optionalAuth, require("./round2"));
app.post("/round3", auth.optionalAuth, require("./round3"));
app.post("/finalanswer", require("./finalanswer"));

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});