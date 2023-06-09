const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/idProduct/:id', productController.product);

router.get('/add', productController.add);

router.post('/add', productController.productAddStore);

module.exports = router;