const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/idProduct/:id', productController.product);

router.get('/add', productController.add);
router.post('/add', productController.productAddStore);
router.post('/delete', productController.delete);

router.get('/edit/:id', productController.edit)
router.post('/edit', productController.editStore)

router.post('/comentario', productController.comentario)

module.exports = router;