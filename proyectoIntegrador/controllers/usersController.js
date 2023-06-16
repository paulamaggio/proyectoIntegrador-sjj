// const data = require('../data/data');

const db = require('../database/models');
const Usuario = db.Usuario;
const Comentario = db.Comentario;
const Producto = db.Producto;
const op = db.Sequelize.Op;


const bcrypt = require('bcryptjs');

const usersController = {

    profile: function (req,res) {
        Usuario.findByPk(req.params.id, { 
            include: [{association:'comentarios'}, {association:'productos', include:[{association:'comentarios'}]}],
            order: [[{model:Producto, as: 'productos'},'createdAt', 'DESC']]
        })
        .then(function(data){
            return res.render('profile', {data: data})
        })
        .catch(function(err){
            console.log(err);
        })
    },
    
    profileEdit: function (req,res) {
        let errors = {};
        let id = req.params.id

        Usuario.findByPk(id, {
            include:[{association: 'productos', include: [{association: 'comentarios'}]}, {association: 'comentarios'}]})
        .then(function(data){
            if(req.session.idUser != data.id){
                errors.message = 'Este usuario no le pertenece, no puede editarlo'; //cargamos el mensaje
                res.locals.errors = errors; //Usamos locals para pasarlo a la vista
                res.render('profile', {data:data}); //Renderizamos la vista
            } else {
                return res.render('profile-edit', {data:data})
            } 
        })
        .catch(function(err){
            console.log(err)
        })
       
    },

    profileEditStore: function (req,res) {
        Usuario.findByPk(req.body.id, {
            include:[{association: 'productos', include: [{association: 'comentarios'}]}, {association: 'comentarios'}]})
        .then(function(data){
            if(req.body.contrasena){
                Usuario.update(
                    {nombreUsuario: req.body.usuario,
                    contrasena: bcrypt.hashSync(req.body.contrasena, 10), 
                    fecha: req.body.nacimiento,
                    dni: req.body.dni,
                    fotoPerfil: req.body.avatar},
                    {where: {id : data.id}}
                )
            } else {                
                Usuario.update(
                {nombreUsuario: req.body.usuario,
                fecha: req.body.nacimiento,
                dni: req.body.dni,
                fotoPerfil: req.body.avatar},
                {where: {id : data.id}}
            )}
            res.redirect('/')
        })
        .catch(function(err){
            console.log(err);
        }) 
   },

    login: function (req,res) {
        return res.render('login');
    },

    loginStore: function (req,res) {
        let errors = {};
        Usuario.findOne({
            where: [{email: req.body.email}]
        })
        .then(function (data) {
            if(data == null){
                errors.message = 'El usuario no existe';
                res.locals.errors = errors; /* guardar el error en locals */
                return res.render('login');
            } 
            else {
                if (bcrypt.compareSync(req.body.contrasena, data.contrasena)){
                    req.session.user = data.nombreUsuario;
                    req.session.idUser = data.id;
                    if (req.body.recordame){
                        res.cookie('idUsuario', data.id, {maxAge: 1000 * 60 * 5})
                    }
                    return res.redirect('/');
                }
                else {
                    errors.message = 'La contraseña es incorrecta';
                    res.locals.errors = errors;
                    return res.render('login');
                }
            }
        }).catch(function(error) {
            console.log(error);
        })
    },

    logout: function (req,res){
        req.session.destroy(),
        res.clearCookie('idUsuario'),
        res.redirect('/');
    },

    register: function (req,res) { 
        return res.render('register');
    },
    
    registerStore: function (req,res) {
        let errors = {};
        // las validaciones del email estan especificadas en la base de datos
        if(req.body.nombreUsuario == ""){
            errors.message = 'El nombre de usuario no puede estar vacío.'; //cargamos el mensaje
            res.locals.errors = errors; //Usamos locals para pasarlo a la vista
            return res.render('register'); //Renderizamos la vista 
        } else if (req.body.contrasena.length < 3) {
            errors.message = 'La contraseña debe tener al menos 3 caracteres'; 
            res.locals.errors = errors;
            return res.render('register');
        } else {
            Usuario.findOne({
                where: [{email: req.body.email}]
            })
            .then(function (data) {
                if (data != null){
                    errors.message = 'El email ya está registrado';
                    res.locals.errors = errors; 
                    return res.render('register');  
                } else { // si no esta registrado el email entonces crea la cuenta nueva con la info que trajo el formulario
                    Usuario.create ({
                        nombreUsuario: req.body.nombreUsuario,
                        email: req.body.email,
                        contrasena: bcrypt.hashSync(req.body.contrasena, 10),
                        fotoPerfil: req.body.fotoPerfil, // se pone un link de una foto de internet o de la careta de public                        
                        fecha: req.body.nacimiento,
                        dni: req.body.dni,
                    });
                    return res.redirect('/users/login'); // devuleve al login para que ingrese a la cuenta 
                }
            })
            .catch(function(error) {
                console.log(error);
            })
        }
    },

    userSearch: function (req,res) {
        let busqueda = req.query.search;
        Usuario.findAll({
            order: [['createdAt', 'DESC']],
            include: [{association:'comentarios'}, {association:'productos', include:[{association:'comentarios'}]}],
            where: {
                [op.or]:[
                {nombreUsuario: {[op.like]:"%"+busqueda+"%"}},
                {email: {[op.like]:"%"+busqueda+"%"}}]
            }
        })
        .then(function(data){
            return res.render('user-search-results', {data: data});
        })
        .catch(function(err){
            console.log(err);
        })
    }
    
}

module.exports = usersController;