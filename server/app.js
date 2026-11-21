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

app.get('/', (req, res) => {
    res.send('Backend !');
});

app.get("/event", (req, res) => {
    db.query("SELECT * FROM events WHERE id=1", (err, ans) => {
        if (err) throw err;
        res.json(ans);
    });
})

const { game_generation, sendGame } = require("./game_generation");

app.get("/play", game_generation);
app.get("/playarchive", (req, res) => sendGame(req.query.date, res));

app.post("/register", require("./register"));
app.post("/login", require("./login"));
const auth = require("./auth");

app.get("/auth", auth.requireAuth, auth.authenticate);
app.post("/updatedetails", auth.requireAuth, require("./updatedetails"));
app.get("/archive", auth.requireAuth, require("./archive"));

app.post("/round1", require("./round1"));
app.post("/round2", require("./round2"));
app.post("/round3", require("./round3"));

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});