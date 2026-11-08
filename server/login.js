const express = require('express');
const db = require('./db');
const bcrypt = require('bcrypt');
const saltRounds = 10;

const login = (req, res) => {
    const { username, password } = req.body;

    // Check if the username and password are provided
    if (!username || !password) {
        return res.status(400).json({ message: 'Username and password are required.' });
    }
};


module.exports = login;