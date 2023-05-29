const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;

const indexController = {
    headerLogueado: function (req,res) {
        return res.render('headerLogueado', {data: data});
    },
    index: function (req,res) {
        
        let relaciones = {
          include:[
            {association:'productoUsuario'},
            {association:'comentario'}
          ]
        }
        Producto.findAll(relaciones,
        
        {order: [
            ['createdAt', 'DESC']
        ]})
        
        .then(function(data){
            console.log(data)
            return res.render('index', {data: data});
        }).catch(function(err){
            console.log(err);
            res.send({err})}
        )},
    search: function (req,res) {
        return res.render('search-results', {data: data.productos});
    },
}

module.exports = indexController;