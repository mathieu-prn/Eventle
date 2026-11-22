const db = require('./db');
const express = require('express');

const round3 = (req, res) => {
    const {orderGuess, userId, gameDate} = req.body;

    db.query("SELECT id, name, year FROM events WHERE id IN (?) ORDER BY FIELD(id, ?)", [orderGuess, orderGuess], (err, ans) => {
        if (err) throw err;

        let score = 0;

        for (i=0; i<3; i++) {
            if (ans[i].year < ans[i+1].year) score += 166.67;
        }

        score = Math.round(score);

        db.query("UPDATE game_completions SET points_round3=?, guess_order_1=?, guess_order_2=?, guess_order_3=?, guess_order_4=?, current_round=? WHERE user_id=? AND game_date=?", [score, orderGuess[0], orderGuess[1], orderGuess[2], orderGuess[3], 4, userId, gameDate], (err, ans) =>{ if (err) throw err;});

        res.status(200).json({
            points: Math.round(score),
            correctEvents: ans
        })
    })
}

module.exports = round3;