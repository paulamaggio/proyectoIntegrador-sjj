const express = require('express');
const router = express.Router();
const indexController = require('../controllers/indexController');

router.get('/headerLogueado', function (req,res) {});
router.get('/index', indexController.index);
router.get('/login', function (req,res) {});
router.get('/register', function (req,res) {});
// router.get('/search', function (req,res) {});

module.exports = router;