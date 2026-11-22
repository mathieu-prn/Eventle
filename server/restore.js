const db = require('./db');

const restore = (req, res) => {
    const {gameDate, userId} = req.body;

    db.query("SELECT * FROM game_completions WHERE user_id=? AND game_date=?", [userId, gameDate], (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not restore game for this date" });
        }

        res.status(200).json(ans);


    })
}

module.exports = restore;