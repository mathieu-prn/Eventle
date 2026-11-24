const db = require('./db');
const express = require('express');

const round2 = (req, res) => {
    const {eventId, guessLat, guessLng, gameDate} = req.body;
    const userId = req.userId;

    if (!eventId || guessLat === undefined || guessLng === undefined || !gameDate) {
        return res.status(400).json({ message: "Event, coordinates and game date are required" });
    }

    function haversineDistance(lat1, lng1, lat2, lng2) {
        const R = 6371; 
        const toRad = (deg) => deg * Math.PI / 180;

        const dLat = toRad(lat2 - lat1);
        const dLng = toRad(lng2 - lng1);

        const a = Math.sin(dLat / 2) ** 2 +
                    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                    Math.sin(dLng / 2) ** 2;
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return R * c;
}

    db.query("SELECT location_type, country, coordinate_lat, coordinate_lng FROM events WHERE id=?", [eventId], async (err, ans) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Could not grade round two" });
        }
        if (!ans.length) {
            return res.status(404).json({ message: "Event not found" });
        }

        const solution = ans[0];

        let points, distance;
        let guessCountry ="";
        
        if (solution.location_type == "country") {

            const fetchCountry = await fetch(`http://api.geonames.org/countryCodeJSON?formatted=true&username=eventle&lat=${guessLat}&lng=${guessLng}`);
            

            if (!fetchCountry.ok) {
                console.log("An error occured");
            }

            const countryData = await fetchCountry.json();
            guessCountry = countryData.countryName;

        }   

        if (guessCountry == solution.country){
                distance = 0;         

        } else {
            distance = haversineDistance(guessLat, guessLng, solution.coordinate_lat, solution.coordinate_lng);
        }

        const k = 1000; // at a k km distance, the player gets half of points
        points = Math.round(500 * Math.exp(-distance / k));

        if (userId) {
            db.query(
                `INSERT INTO game_completions
                    (user_id, game_date, points_round2, guess_coord_lat, guess_coord_lng, current_round)
                 VALUES (?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE
                    points_round2 = VALUES(points_round2),
                    guess_coord_lat = VALUES(guess_coord_lat),
                    guess_coord_lng = VALUES(guess_coord_lng),
                    current_round = GREATEST(current_round, VALUES(current_round))`,
                [userId, gameDate, points, guessLat, guessLng, 3],
                (err) => {
                    if (err) {
                        console.error(err);
                        return res.status(500).json({ message: "Could not save round two" });
                    }
                    return res.status(200).json({
                        points: points,
                        distance: Math.round(distance),
                        gradingType: solution.location_type,
                        correctLat: solution.coordinate_lat,
                        correctLng: solution.coordinate_lng,
                        correctCountry: solution.country
                    });
                }
            );
        } else {
            res.status(200).json({
                points: points,
                distance: Math.round(distance),
                gradingType: solution.location_type,
                correctLat: solution.coordinate_lat,
                correctLng: solution.coordinate_lng,
                correctCountry: solution.country
            });
        }
    })
}

module.exports = round2