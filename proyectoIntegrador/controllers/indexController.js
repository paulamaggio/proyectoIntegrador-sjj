const productos = require('../db/productos');

const indexController = {
    index: function (req,res) {
        res.render('index')
    },
}

module.exports = indexController;