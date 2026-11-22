const db = require('./db');

const getUsers = (req, res) => {
    db.query('SELECT id, username, email, isadmin FROM users', (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Database error.' });
        }
        res.json(results);
    });
};

const deleteUser = (req, res) => {
    db.query('DELETE FROM users WHERE id = ?', [req.body.userId], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Database error.' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ message: 'User not found.' });
        }
        res.json("User ? deleted successfully.", [req.body.userId]);
    });
};

module.exports= { getUsers, deleteUser };