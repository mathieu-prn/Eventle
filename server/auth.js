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

const requireAuth = (req, res, next) => {
    const authorization = req.get('authorization');

    if (!authorization) {
        return res.status(401).json({ message: 'Authorization header required.' });
    }

    const [scheme, token] = authorization.split(' ');

    if (scheme !== 'Bearer' || !token) {
        return res.status(401).json({ message: 'Invalid authorization header.' });
    }

    const decoded = verifyToken(token);

    if (!decoded || !decoded.sub) {
        return res.status(401).json({ message: 'Invalid or expired token.' });
    }

    req.userId = decoded.sub;
    next();
};

const requireAdminAuth = (req, res, next) => {
    requireAuth(req, res, () => {
        db.query(
            'SELECT isadmin FROM users WHERE id = ?',
            [req.userId],
            (err, results) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ message: 'Could not verify user.' });
                }

                if (results.length === 0) {
                    return res.status(401).json({ message: 'User no longer exists.' });
                }

                if (!results[0].isadmin) {
                    return res.status(403).json({ message: 'Access denied. Admin privileges required.' });
                }

                next();
            }
        );
    });
};

const authenticate = (req, res) => {
    db.query(
        'SELECT id, username, isadmin FROM users WHERE id = ?',
        [req.userId],
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

module.exports = { authenticate, requireAuth, requireAdminAuth, secretKey, verifyToken };
