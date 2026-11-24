const db = require('./db');
const express = require('express');

const round1 = (req, res) => {
    const {eventId, yearGuess, gameDate} = req.body;
    const userId = req.userId;

    if (!eventId || yearGuess === undefined || !gameDate) {
        return res.status(400).json({ message: "Event, guess and game date are required" });
    }

    db.query("SELECT year FROM events WHERE id=?", [eventId], (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not grade round one" });
        }
        if (!ans.length) {
            return res.status(404).json({ message: "Event not found" });
        }

        const correctYear = ans[0].year;
        let range = 0;
        if (correctYear < -2000) {
            const range = 2026 + 10000;
        } else if (correctYear < - 1000){
            range = 2026 + 2000;
        } else {
            range = 2026 + 1000;
        }

        const points = Math.round(Math.max((range - Math.abs(correctYear - yearGuess) * 2) / range * 500, 0));

        if (userId) {
            db.query("INSERT IGNORE INTO game_completions (user_id, game_date, points_round1, guess_year, current_round) VALUES (?, ?, ?, ?, ?)", [userId, gameDate, points, yearGuess, 2], (err) => {
                if (err) console.error(err);
            });
        }

        res.status(200).json({
            points: points,
            correctAns: correctYear
        })
    })
}

module.exports = round1