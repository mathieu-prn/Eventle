const express = require('express');
const db = require('./db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { secretKey } = require('./auth');

const login = (req, res) => {
    const { username, password } = req.body;

    // Check if the username and password are provided
    if (!username || !password) {
        return res.status(400).json({ message: 'Username and password are required.' });
    }

    db.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
        if (err) throw err;

        if (results.length === 0) {
            return res.status(401).json({message: 'Invalid username or password.'})
        }
        bcrypt.compare(password, results[0].password)
            .then(isMatch => {
                if (!isMatch) {
                    return res.status(401).json({ message: 'Invalid username or password.' });
                }
                const isAdmin = Boolean(results[0].isadmin);
                const token = jwt.sign(
                    { sub: String(results[0].id), isAdmin }, 
                    secretKey,
                    { expiresIn: '1h', algorithm: 'HS256' }
                );

                res.status(200).json({
                    success: true, 
                    token,
                    user: {
                        id: results[0].id,
                        username: results[0].username,
                        isAdmin
                    },
                    message: 'Login successful.' 
                });
            })
            .catch(err => {
                console.error(err);
                res.status(500).json({ message: 'Error comparing passwords.' });
            });
    });
};


module.exports = login;