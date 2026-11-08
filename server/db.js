const mysql = require("mysql2");

const db = mysql.createConnection({
    host: "localhost",
    user: "express",
    password: "abc123",
    database: "eventle"  
});

module.exports = db;