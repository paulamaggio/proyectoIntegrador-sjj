const data = require('../data/data');

const productController = {
    product: function (req,res) {
        return res.render('product', {data: data})
    },
    productAdd: function (req,res) {
        return res.render('product-add', {data: data})
    },
    products: function (req,res) {
        return res.render('products', {data: data.productos})
    },
}

module.exports = productController;
