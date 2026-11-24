const db = require('./db');

const restore = (req, res) => {
    const { gameDate } = req.body;

    if (!gameDate) {
        return res.status(400).json({ message: "Game date is required" });
    }

    const sql = `
        SELECT gc.*, main_event.year AS correct_year,
               main_event.name AS main_event_name,
               main_event.description AS main_event_description,
               main_event.location_type, main_event.country,
               main_event.coordinate_lat AS correct_lat,
               main_event.coordinate_lng AS correct_lng,
               o1.name AS order_name_1, o1.year AS order_year_1,
               o2.name AS order_name_2, o2.year AS order_year_2,
               o3.name AS order_name_3, o3.year AS order_year_3,
               o4.name AS order_name_4, o4.year AS order_year_4
        FROM game_completions gc
        JOIN archive a ON a.game_date = gc.game_date
        JOIN events main_event ON main_event.id = a.event_id
        LEFT JOIN events o1 ON o1.id = gc.guess_order_1
        LEFT JOIN events o2 ON o2.id = gc.guess_order_2
        LEFT JOIN events o3 ON o3.id = gc.guess_order_3
        LEFT JOIN events o4 ON o4.id = gc.guess_order_4
        WHERE gc.user_id = ? AND gc.game_date = ?
        LIMIT 1
    `;

    db.query(sql, [req.userId, gameDate], (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not restore game for this date" });
        }

        if (ans.length === 0) {
            return res.status(200).json([]);
        }

        const completion = ans[0];
        const haversineDistance = (lat1, lng1, lat2, lng2) => {
            const R = 6371;
            const toRad = (deg) => deg * Math.PI / 180;
            const dLat = toRad(lat2 - lat1);
            const dLng = toRad(lng2 - lng1);
            const a = Math.sin(dLat / 2) ** 2 +
                Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                Math.sin(dLng / 2) ** 2;
            return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        };

        const round1 = completion.current_round > 1 ? {
            points: completion.points_round1,
            correctAns: completion.correct_year
        } : null;

        let distance = haversineDistance(
            completion.guess_coord_lat,
            completion.guess_coord_lng,
            completion.correct_lat,
            completion.correct_lng
        );
        const round2 = completion.current_round > 2 ? {
            points: completion.points_round2,
            distance: Math.round(distance),
            gradingType: completion.location_type,
            correctLat: completion.correct_lat,
            correctLng: completion.correct_lng,
            correctCountry: completion.country
        } : null;

        const round3 = completion.current_round > 3 ? {
            points: completion.points_round3,
            name: completion.main_event_name,
            description: completion.main_event_description,
            correctEvents: [
                { id: completion.guess_order_1, name: completion.order_name_1, year: completion.order_year_1 },
                { id: completion.guess_order_2, name: completion.order_name_2, year: completion.order_year_2 },
                { id: completion.guess_order_3, name: completion.order_name_3, year: completion.order_year_3 },
                { id: completion.guess_order_4, name: completion.order_name_4, year: completion.order_year_4 }
            ].sort((a, b) => a.year - b.year)
        } : null;

        res.status(200).json([{
            current_round: completion.current_round,
            guess_year: completion.guess_year,
            guess_coord_lat: completion.guess_coord_lat,
            guess_coord_lng: completion.guess_coord_lng,
            guess_order_1: completion.guess_order_1,
            guess_order_2: completion.guess_order_2,
            guess_order_3: completion.guess_order_3,
            guess_order_4: completion.guess_order_4,
            round1,
            round2,
            round3
        }]);
    });
};

module.exports = restore;