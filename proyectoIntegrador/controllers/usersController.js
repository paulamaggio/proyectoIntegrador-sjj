const data = require('../data/data');

const db = require('../database/models');
const Usuario = db.Usuario;
const Comentario = db.Comentario;

const usersController = {

    prueba: function(req, res) {
        Usuario.findAll().then(function(result){
            return res.send(result);
        }).catch(function(err){console.log(err)})
      },
    
    pruebacom: function(req, res) {
        Comentario.findAll().then(function(result){
            return res.send(result);
        }).catch(function(err){console.log(err)})
      },

    profile: function (req,res) {
        return res.render('profile', {data: data})
    },
    profileEdit: function (req,res) {
         return res.render('profile-edit', {data: data})
    },
    login: function (req,res) {
        return res.render('login');
    },
    register: function (req,res) {
        return res.render('register');
    },
}

module.exports = usersController;