const productos = require('../db/productos');

const indexController = {
    headerLogueado: function (req,params) {
        return res.render('headerLogueado');
    },
    index: function (req,res) {
        return res.render('index');
    },
    login: function (req,res) {
        return res.render('login');
    },
    register: function (req,params) {
        return res.render('register');
    },
    search: function (req,params) {
        return res.render('search-results');
    },
}

module.exports = indexController;