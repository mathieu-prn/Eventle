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
        const min_tol = 500;

        const error = Math.abs(correctYear - yearGuess); 
        const tolerance = Math.max((2026 - correctYear) - min_tol, min_tol);

        const points = Math.round(Math.max(500 * (1 - error/tolerance), 0));

        if (userId) {
            db.query(
                `INSERT INTO game_completions
                    (user_id, game_date, points_round1, guess_year, current_round)
                 VALUES (?, ?, ?, ?, ?)
                    ON DUPLICATE KEY UPDATE
                    points_round1 = VALUES(points_round1),
                    guess_year = VALUES(guess_year),
                    current_round = GREATEST(current_round, VALUES(current_round))`,
                [userId, gameDate, points, yearGuess, 2],
                (err) => {
                    if (err) {
                        console.error(err);
                        return res.status(500).json({ message: "Could not save round one" });
                    }
                    return res.status(200).json({
                        points: points,
                        correctAns: correctYear
                    });
                }
            );
        } else {
            res.status(200).json({
                points: points,
                correctAns: correctYear
            });
        }
    })
}

module.exports = round1