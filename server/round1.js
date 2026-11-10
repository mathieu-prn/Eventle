const db = require('./db');
const express = require('express');

const round1 = (req, res) => {
    const {eventId, yearGuess, userId} = req.body;

    db.query("SELECT year FROM events WHERE id=?", [eventId], (err, ans) => {
        if (err) throw err;

        const correctYear = ans[0].year;
        let range = 0;
        if (correctYear < -2000) {
            const range = 2026 + 10000;
        } else if (correctYear < - 1000){
            range = 2026 + 2000;
        } else {
            range = 2026 + 1000;
        }

        const points = Math.max((range - Math.abs(correctYear - yearGuess) * 2) / range * 500, 0);

        res.status(200).json({
            points: Math.round(points),
            correctAns: correctYear
        })
    })
}

module.exports = round1