// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;

const productController = {

    prueba: function(req, res) {
        Producto.findAll().then(function(result){
            return res.send(result);
        }).catch(function(err){console.log(err)})
    },

    product: function (req,res) {

        Producto.findByPk(req.params.id, {
            include: [{association:'productoUsuario'}, {association:'comentario'}]
        })
        .then(function(data){
            //return res.send(data)
            return res.render('product', {data: data})
        })
        .catch(function(err){
            console.log(err);
        })
    },

    productAdd: function (req,res) {
        return res.render('product-add', {data: data})
    },

    products: function (req,res) {
        return res.render('products', {data: data.productos})
    },
}

module.exports = productController;
