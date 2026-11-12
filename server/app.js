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

app.get("/play", require("./game_generation"));

app.post("/register", require("./register"));
app.post("/login", require("./login"));
app.post("/auth", require("./auth").authenticate);

app.post("/round1", require("./round1"));

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});