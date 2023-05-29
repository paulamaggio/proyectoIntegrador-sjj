const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;

const productController = {

    prueba: function(req, res) {
        // return res.send('hola')
        // let id = req.params.id;
        // console.log(id);
        Producto.findAll().then(function(result){
            return res.send(result);
        }).catch(function(err){console.log(err)})
        // let relaciones={
        //   include:[
        //     {association:'productoUsuario'},
        //   ]
        // }
        // Products.findByPk(id, relaciones)
        // .then(function(result){
        //     return res.send(result);
        // }).catch(function(err){console.log(err)})
    },

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
