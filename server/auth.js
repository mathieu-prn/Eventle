const jwt = require('jsonwebtoken');
const db = require('./db');

const secretKey = '3c318be00c45457c8a9fba06d8170e03dc88f3c3790578d2f885298d048ecb31';

function verifyToken(token) {
    try {
        return jwt.verify(token, secretKey);
    } catch (err) {
        return null;
    }
}

const authenticate = (req, res) => {
    const decoded = verifyToken(req.body.token);

    if (!decoded || !decoded.sub) {
        return res.status(401).json({ message: 'Invalid or expired token.' });
    }

    db.query(
        'SELECT id, username, isadmin FROM users WHERE id = ?',
        [decoded.sub],
        (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Could not verify user.' });
            }

            if (results.length === 0) {
                return res.status(401).json({ message: 'User no longer exists.' });
            }

            res.json({
                user: {
                    id: results[0].id,
                    username: results[0].username,
                    isAdmin: Boolean(results[0].isadmin)
                }
            });
        }
    );
};

module.exports = { authenticate, secretKey };
