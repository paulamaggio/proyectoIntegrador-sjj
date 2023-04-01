const productos = require('../db/productos');

const indexController = {
    index: function (req,res) {
        return res.render('index');
    },
    login: function (req,res) {
        return res.render('login');
    },
    register: function (req,params) {
        return res.render('register');
    },
}

module.exports = indexController;