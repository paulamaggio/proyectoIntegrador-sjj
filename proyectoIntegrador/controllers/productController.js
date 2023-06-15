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
     },

    delete: function(req, res){
        let errors = {};
        Producto.findByPk(req.body.id, {
            include: [{association:'usuarios'}, {association:'comentarios', include:[{association:'usuarios'}]}]})
        .then(function (data) {
            if(req.session.idUser == data.idUsuario){
                Producto.destroy({
                    where: {id : data.id}
                })
                .then(function(data){
                    res.redirect('/')
                })
                .catch(function(err){
                    console.log(err);
                 })
            } else {
                errors.message = 'Este producto no le pertenece, no puede eliminarlo'; //cargamos el mensaje
                res.locals.errors = errors; //Usamos locals para pasarlo a la vista
                res.render('product', {data:data}); //Renderizamos la vista 
            }
        })
        .catch(function(err){
            console.log(err);
        })
    },

    edit:function (req,res) {
        let errors = {};
        let id = req.params.id
        console.log(id);
        Producto.findByPk(id, {
            include: [{association:'usuarios'}, {association:'comentarios', include:[{association:'usuarios'}]}]})
        .then(function(data){
            if(req.session.idUser != data.idUsuario){
                errors.message = 'Este producto no le pertenece, no puede editarlo'; //cargamos el mensaje
                res.locals.errors = errors; //Usamos locals para pasarlo a la vista
                res.render('product', {data:data}); //Renderizamos la vista
            } else {
                return res.render('product-edit', {data:data})
            }
        })
        .catch(function(err){
            console.log(err);
        })
    },

    editStore: function (req,res) {

        Producto.findByPk(req.body.id, {
            include: [{association:'usuarios'}, {association:'comentarios', include:[{association:'usuarios'}]}]})
        .then(function(data){
            Producto.update(
                {nombreProducto: req.body.nombre,
                fotoProducto: req.body.producto,
                descripcion: req.body.descripcion},
                {where: {id : data.id}}
            )
            res.redirect('/')
        })
        .catch(function(err){
            console.log(err);
        })  
    },

    comentario: function(req, res){

    }
}


module.exports = productController;
