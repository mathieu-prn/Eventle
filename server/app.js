const express = require('express');
const app = express();
const port = 3000;

const mysql = require("mysql2");

const db = mysql.createConnection({
    host: "localhost",
    user: "express",
    password: "abc123",
    database: "eventle"  
});

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

app.get("/play", (req, res) => {
    db.query("SELECT MAX(game_date) = UTC_DATE() AS is_today FROM archive", (err, ans) => {
        if (err) throw err;
        if (ans[0].is_today === 1) {
            res.send("Game already started today !");
        } else {
            event_id = Math.floor(Math.random() * 249 + 1);
            comparison1 = Math.floor(Math.random() * 249 + 1);
            while (comparison1 === event_id) {
                comparison1 = Math.floor(Math.random() * 249 + 1);
            }
            comparison2 = Math.floor(Math.random() * 249 + 1);
            while (comparison2 === event_id || comparison2 === comparison1) {
                comparison2 = Math.floor(Math.random() * 249 + 1);
            }
            comparison3 = Math.floor(Math.random() * 249 + 1);
            while (comparison3 === event_id || comparison3 === comparison1 || comparison3 === comparison2) {
                comparison3 = Math.floor(Math.random() * 249 + 1);
            }
            db.query(`INSERT INTO archive (game_date, event_id, comparison1, comparison2, comparison3) VALUES (UTC_DATE(), ${event_id}, ${comparison1}, ${comparison2}, ${comparison3})`, (err, ans) => {
                if (err) throw err;
                res.send("New game started !");
            });
        }
    });
});   

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});