const db = require("./db");

const game_generation = (req, res) => {
	db.query(
		"SELECT * FROM archive WHERE game_date = UTC_DATE();",
		(err, todayRows) => {
			if (err) {
				return res.status(500).json({ message: "Could not check today's game." });
			}

			if (todayRows.length > 0) {
				console.log("Game already started today !");
				sendGame(undefined, res);
			} else {
				generate_missing_games(() => sendGame(undefined, res));
			}
		},
	);
};

const generate_game = (gameDate, callback = () => {}) => {
	const eventId = Math.floor(Math.random() * 249 + 1);
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
		`INSERT IGNORE INTO archive (game_date, event_id, comparison1, comparison2, comparison3) VALUES (?, ?, ?, ?, ?)`, [gameDate, eventId, comparison1, comparison2, comparison3], (err) => {
			if (err) throw err;
			console.log("Created new game for", gameDate);
			callback();
		},
	);
};

const generate_missing_games = (callback = () => {}) => {
	db.query(`SELECT DATE_FORMAT(MAX(game_date), '%Y-%m-%d') AS last_date FROM archive WHERE game_date < UTC_DATE()`, (err, rows) => {
		if (err) throw err;

		db.query(
			"SELECT DATE_FORMAT(UTC_DATE(), '%Y-%m-%d') AS today",
			(err, todayRows) => {
				if (err) throw err;

				const today = todayRows[0].today;
				if (!rows[0].last_date) {
					generate_game(today, callback);
					return;
				}

				const dates = [];
				let date = new Date(`${rows[0].last_date}T00:00:00Z`);
				while (date.toISOString().slice(0, 10) < today) {
					date = new Date(date.getTime() + 86400000);
					dates.push(date.toISOString().slice(0, 10));
				}

				const generateNext = (index) => {
					if (index >= dates.length) {
						callback();
						return;
					}
					generate_game(dates[index], () => generateNext(index + 1));
				};

				generateNext(0);
			},
		);
	},);
};

const sendGame = (date,res) => {
	console.log("Sending game for date:", date || "today");
	const sql = `SELECT archive.event_id, events.alternative_name, archive.comparison1, archive.comparison2, archive.comparison3
		FROM archive
		JOIN events ON events.id = archive.event_id
		WHERE archive.game_date = ${date ? "?" : "UTC_DATE()"}`;
	const params = date ? [date] : [];

	db.query(sql, params,
		(err, rows) => {
			if (err) {
				return res.status(500).json({ message: "Could not load game." });
			}
			if (rows.length === 0) {
				return res.status(404).json({ message: "Game not found." });
			}

			db.query("SELECT id, name from events WHERE id in (?, ?, ?) ORDER BY RAND()", [rows[0].comparison1, rows[0].comparison2, rows[0].comparison3], (err2, rows2) => {
				if (err2) {
					return res.status(500).json({ message: "Could not load game." });
				}
				if (rows2.length === 0) {
					return res.status(404).json({ message: "Game not found." });
				}
				
				return res.json({
					event_id: rows[0].event_id,
					event_clue: rows[0].alternative_name,
					compare_events: [{id: rows[0].event_id, name: rows[0].alternative_name}, rows2[0], rows2[1], rows2[2]] 
				});
			})
		},
	);
};

module.exports = { game_generation, sendGame };
