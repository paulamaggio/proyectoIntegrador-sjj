const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/:id', productController.product);
router.get('/add', productController.productAdd);
// router.post('/add', productController.productAddStore);

module.exports = router;