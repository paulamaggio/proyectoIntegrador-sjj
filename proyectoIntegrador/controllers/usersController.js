const productos = require('../db/productos');

const usersController = {
    profile: function (req,res) {
        return res.render('profile')
    },
    profileEdit: function (req,res) {
        return res.render('profile-edit')
    },
    login: function (req,res) {
        return res.render('login');
    },
    register: function (req,res) {
        return res.render('register');
    },
}

module.exports = usersController;