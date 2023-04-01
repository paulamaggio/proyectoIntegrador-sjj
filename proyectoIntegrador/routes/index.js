const express = require('express');
const router = express.Router();
const indexController = require('../controllers/indexController');

router.get('/headerLogueado', function (req,res) {});
router.get('/', indexController.index);
router.get('/login', indexController.login);
router.get('/register', indexController.register);
// router.get('/search', function (req,res) {});

module.exports = router;