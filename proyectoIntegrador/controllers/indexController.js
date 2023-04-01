const productos = require('../db/productos');

const indexController = {
    index: function (req,res) {
        res.render('index')
    },
    login: function (req,res) {
        res.render('login')
    },
    register: function (req,params) {
        res.render('register')
    },
}

module.exports = indexController;