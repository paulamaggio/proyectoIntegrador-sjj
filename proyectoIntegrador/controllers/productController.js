const productos = require('../db/productos');

const productController = {
    product: function (req,res) {
        return res.render('product')
    },
    productAdd: function (req,res) {
        return res.render('product-add')
    },
    products: function (req,res) {
        return res.render('products')
    },
}

module.exports = productController;
