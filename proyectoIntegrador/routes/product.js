const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/product', function (req,res) {});
router.get('/product-add', function (req,res) {});

module.exports = router;