const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');

router.get('/profile', function (req,res) {});
router.get('/edit-profile', function (req,res) {});

module.exports = router;