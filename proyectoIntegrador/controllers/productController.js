// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;
// const Usuario = db.Usuario;

const productController = {

    product: function (req,res) {

        Producto.findByPk(req.params.id, {
            include: [{association:'usuarios'}, {association:'comentarios', include:[{association:'usuarios'}]}]
        })
        .then(function(data){
            return res.render('product', {data: data})
        })
        .catch(function(err){
            console.log(err);
        })
    },

    productAdd: function (req,res) {
        return res.render('product-add')
    }

    // productAddStore: function (req,res) {
        
    //     Producto.create({
    //         // idUsuario: req.session.Usuario.id,
    //         nombreProducto: req.body.nombre,
    //         fotoProducto: req.body.producto,
    //         descripcion: req.body.descripcion
    //     })
    //     return res.redirect('/')
    // }

}

module.exports = productController;
