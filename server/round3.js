const db = require('./db');
const express = require('express');

const round3 = (req, res) => {
    const {orderGuess, userId} = req.body;

    db.query("SELECT id, name, year FROM events WHERE id IN (?) ORDER BY FIELD(id, ?)", [orderGuess, orderGuess], (err, ans) => {
        if (err) throw err;

        let score = 0;

        for (i=0; i<3; i++) {
            if (ans[i].year < ans[i+1].year) score += 166.67;
        }

        score = Math.round(score);

        res.status(200).json({
            points: Math.round(score),
            correctEvents: ans
        })
    })
}

module.exports = round3;