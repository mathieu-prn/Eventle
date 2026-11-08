const express = require('express');
const db = require('./db');
const bcrypt = require('bcrypt');
const saltRounds = 10;

const register = (req, res) => {
    const { username, email, password, confirmPassword } = req.body;

    if (!username || !email || !password || !confirmPassword) {
        return res.status(400).json({ message: 'All fields are required.' });
    }

    if (password !== confirmPassword) {
        return res.status(400).json({ message: 'Passwords do not match.' });
    }

    db.query('SELECT * FROM users WHERE username = ? OR email = ?', [username, email], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            return res.status(400).json({ message: 'Username or email already exists.' });
        }

        bcrypt.hash(password, saltRounds)
            .then((hashedPassword) => {
                db.query('INSERT INTO users (username, email, password) VALUES (?, ?, ?)', [username, email, hashedPassword], (err, results) => {
                    if (err) throw err;
                    res.status(201).json({
                        success: true,
                        message: 'User registered successfully.'
                    });
                });
            })
            .catch((err) => {
                console.error(err);
                res.status(500).json({ message: 'Error hashing password.' });
            });
    });
};

module.exports = register;