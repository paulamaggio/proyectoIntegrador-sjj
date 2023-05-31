// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;

const indexController = {
    
    headerLogueado: function (req,res) {
        return res.render('headerLogueado', {data: data});
    },

    index: function (req,res) {

        Producto.findAll({
            order: [['createdAt', 'DESC']],
            include: [{association:'productoUsuario'}, {association:'comentario'}]
        })
        .then(function(data){
            return res.render('index', {data: data});
        })
        .catch(function(err){
            console.log(err);
        })
    },

    search: function (req,res) {
        return res.render('search-results', {data: data.productos});
    },
}

module.exports = indexController;