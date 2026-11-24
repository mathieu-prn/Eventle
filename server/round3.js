const db = require('./db');
const express = require('express');

const round3 = (req, res) => {
    const {orderGuess, gameDate} = req.body;
    const userId = req.userId;

    if (!Array.isArray(orderGuess) || orderGuess.length !== 4 || !gameDate) {
        return res.status(400).json({ message: "An ordered guess and game date are required" });
    }

    db.query("SELECT id, year, name FROM events WHERE id IN (?) ORDER BY FIELD(id, ?)", [orderGuess, orderGuess], (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not grade round three" });
        }

        let score = 0;

        for (let i=0; i<3; i++) {
            if (ans[i].year < ans[i+1].year) score += 166.67;
        }

        score = Math.round(score);

        if (userId) {
            db.query(
                `INSERT INTO game_completions
                    (user_id, game_date, points_round3, guess_order_1, guess_order_2,
                     guess_order_3, guess_order_4, current_round)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE
                    points_round3 = VALUES(points_round3),
                    guess_order_1 = VALUES(guess_order_1),
                    guess_order_2 = VALUES(guess_order_2),
                    guess_order_3 = VALUES(guess_order_3),
                    guess_order_4 = VALUES(guess_order_4),
                    current_round = GREATEST(current_round, VALUES(current_round))`,
                [userId, gameDate, score, orderGuess[0], orderGuess[1], orderGuess[2], orderGuess[3], 4],
                (err) => {
                    if (err) {
                        console.error(err);
                        return res.status(500).json({ message: "Could not save round three" });
                    }
                    return res.status(200).json({
                        points: Math.round(score),
                        correctEvents: ans
                    });
                }
            );
        } else {
            res.status(200).json({
                points: Math.round(score),
                correctEvents: ans
            });
        }
    })
}

module.exports = round3;