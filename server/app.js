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

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});