const data = require('../data/data');

const db = require('../database/models');
const Usuario = db.Usuario;
const Comentario = db.Comentario;

const bcrypt = require('bcryptjs');

const usersController = {

    profile: function (req,res) {
        Usuario.findByPk(req.params.id, { 
            include: [{association:'comentarios'}, {association:'productos', include:[{association:'comentarios'}]}],
            order: [['createdAt', 'DESC']]
        })
        .then(function(data){
            return res.render('profile', {data: data})
        })
        .catch(function(err){
            console.log(err);
        })
    },
    
    profileEdit: function (req,res) {
         return res.render('profile-edit', {data: data})
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
                        fotoPerfil: req.body.fotoPerfil, // ver que se haria en este caso para poder poner una foto                        
                        fecha: req.body.nacimiento,
                        dni: req.body.dni,
                    });
                    return res.redirect('/users/login'); // devuleve al login para que ingrese a la cuenta 
                }
            }).catch(function(error) {
                console.log(error);
            })
        }
    }
}

module.exports = usersController;