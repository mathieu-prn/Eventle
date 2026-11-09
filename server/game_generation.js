const db = require("./db");

const game_generation = (req, res) => {
	let eventId = 0;
	db.query(
		"SELECT * FROM archive WHERE game_date = UTC_DATE();",
		(err, ans) => {
			if (err) throw err;
			if (ans.length > 0) {
				eventId = ans[0].event_id;
				console.log("Game already started today !");
			} else {
				eventId = Math.floor(Math.random() * 249 + 1);
				let comparison1 = Math.floor(Math.random() * 249 + 1);
				while (comparison1 === eventId) {
					comparison1 = Math.floor(Math.random() * 249 + 1);
				}
				let comparison2 = Math.floor(Math.random() * 249 + 1);
				while (comparison2 === eventId || comparison2 === comparison1) {
					comparison2 = Math.floor(Math.random() * 249 + 1);
				}
				let comparison3 = Math.floor(Math.random() * 249 + 1);
				while (
					comparison3 === eventId ||
					comparison3 === comparison1 ||
					comparison3 === comparison2
				) {
					comparison3 = Math.floor(Math.random() * 249 + 1);
				}
				db.query(
					`INSERT INTO archive (game_date, event_id, comparison1, comparison2, comparison3) VALUES (UTC_DATE(), ${eventId}, ${comparison1}, ${comparison2}, ${comparison3})`,
					(err, ans) => {
						if (err) throw err;
						console.log("New game started !");
					},
				);
			}
			db.query(
				"SELECT alternative_name FROM events WHERE id=?",
				[eventId],
				(err, ans) => {
					if (err) throw err;
					res.json({
						event_id: eventId,
						event_clue: ans[0].alternative_name,
					});
				},
			);
		},
	);
};

module.exports = game_generation;
