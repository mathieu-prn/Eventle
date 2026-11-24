const db = require('./db');

const finalanswer = (req, res) => {
    const {eventId} = req.body;
    if (!eventId) {
        return res.status(400).json({ message: "Event is required" });
    }
    db.query("SELECT name, description FROM events WHERE id = ?", [eventId], (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not load the final answer" });
        }
        if (!ans.length) {
            return res.status(404).json({ message: "Event not found" });
        }

        res.status(200).json({
            event_name: ans[0].name,
            description: ans[0].description
        })
    })
}

module.exports = finalanswer