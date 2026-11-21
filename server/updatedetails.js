const bcrypt = require('bcrypt');
const db = require('./db');

const updateDetails = (req,res) => {
    const {new_username,new_email,new_password,old_password} = req.body;
    const userId = req.userId;

    const updates = [
        new_username !== undefined && ['username', new_username],
        new_email !== undefined && ['email', new_email],
        new_password !== undefined && ['password', new_password]
    ].filter(Boolean);

    if (updates.length !== 1) {
        return res.status(400).json({ message: 'Please provide exactly one field to update.' });
    }

    const [fieldToChange, valueToChange] = updates[0];

    db.query('SELECT password FROM users WHERE id = ?', [userId], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Database error.' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'User not found.' });
        }

        if (fieldToChange === 'password') {
            if (!old_password) {
                return res.status(400).json({ message: 'Old password is required to change password.' });
            }
            const hashedPassword = results[0].password;

            bcrypt.compare(old_password, hashedPassword)
                .then(isMatch => {
                    if (!isMatch) {
                        return res.status(401).json({ message: 'Old password is incorrect.' });
                    }

                    bcrypt.hash(valueToChange, 10)
                        .then(newHashedPassword => {
                            updateDatabase(fieldToChange, newHashedPassword,userId,res);
                        })
                        .catch(() => {
                            return res.status(500).json({ message: 'Error hashing new password.' });
                        });
                })
                .catch(() => {
                    return res.status(500).json({ message: 'Error comparing passwords.' });
                });
        } else {
            updateDatabase(fieldToChange, valueToChange,userId,res);
        }
    });
};

const updateDatabase = (field, value, userId,res) => {
    const allowedFields = {
        username: 'username',
        email: 'email',
        password: 'password'
    };

    if (!allowedFields[field]) {
        return res.status(400).json({ message: 'Invalid field to update.' });
    }

    if (allowedFields[field] === 'username' || allowedFields[field] === 'email') {
        db.query(`SELECT id FROM users WHERE ${allowedFields[field]} = ? AND id <> ?`, [value, userId], (err, results) => {
            if (err) {
                return res.status(500).json({ message: 'Database error.' });
            }
            if (results.length > 0) {
                return res.status(400).json({ message: `${field} is already in use.` });
            }

            updateUser();
        });
    } else {
        updateUser();
    }

    function updateUser() {
        const sql = `UPDATE users SET ${allowedFields[field]} = ? WHERE id = ?`;

        db.query(sql, [value,userId], (err) => {
            if (err) {
                console.error(err);
                return res.status(400).json({ message: 'Error updating user details.' });
            }
            return res.json({
                success: true,
                message: `${field} updated successfully.`
            });
        })
    }
};

module.exports = updateDetails;