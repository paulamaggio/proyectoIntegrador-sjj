// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;
const Comentario = db.Comentario;
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
                if(data.comentarios != null){
                    for(i=0; i<data.comentarios.length; i++){
                        let idComentario = data.comentarios[i].id
                        console.log(idComentario)
                        Comentario.destroy({
                            where: {id : idComentario}})

                    }}
                    Producto.destroy({
                        where: {id : data.id}
                    })
                    .then(function(data){
                        res.redirect('/')
                    })
                    .catch(function(err){
                        console.log(err);
                     })
                

                }     
            else {
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
        let errors = {}
        let id = req.body.id
        Producto.findByPk(id, {include:[{association:'comentarios', include: {association: 'usuarios'}}, {association: 'usuarios'}]})
        .then(function(data){
            if(req.session.user != null){
                comment = req.body.comment
                Comentario.create({
                    idPost: data.id,
                    idUsuario: req.session.idUser,
                    comentario: comment,
                    })
                .then(function(info){
                    res.redirect('/product/idProduct/' + id);  
                })
                .catch(function(err){
                    console.log(err);
                }) 
            }
            else{
                res.redirect('/users/login')
            }
        })
        .catch(function(err){
            console.log(err);
        }) 
    }
}


module.exports = productController;
