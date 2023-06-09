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

    add: function (req, res) {
        return res.render('product-add')
    },

    productAddStore: function (req,res) {
        if(req.session.user != null){
            Producto.create({
                idUsuario: req.session.idUser,
                nombreProducto: req.body.nombre,
                fotoProducto: req.body.producto,
                descripcion: req.body.descripcion
             }) 
             .then(function(data){
                res.redirect('/')
             })
             .catch(function(err){
                console.log(err);
             })
        }
        else{
            res.redirect('/register') 
        }
     }
}

module.exports = productController;
