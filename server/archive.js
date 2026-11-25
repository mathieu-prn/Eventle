const db = require('./db');

const archive = (req, res) => {
    const query = "SELECT DATE_FORMAT(game_date, '%Y-%m-%d') AS game_date, points_round1, points_round2, points_round3, current_round FROM game_completions WHERE user_id = ? ORDER BY game_date ASC";
    const userId = req.userId;

    db.query(query, [userId], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not retrieve archived events for specified user." });
        }
        res.json(results);
    })
}



module.exports = archive;