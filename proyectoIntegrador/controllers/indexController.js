// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;
const op = db.sequelize.Op;


const indexController = {
    
    headerLogueado: function (req,res) {
        return res.render('headerLogueado', {data: data});
    },

    index: function (req,res) {

        Producto.findAll({
            order: [['createdAt', 'DESC']],
            include: [{association:'usuarios'}, {association:'comentarios'}]
        })
        .then(function(data){
            return res.render('index', {data: data});
        })
        .catch(function(err){
            console.log(err);
        })
    },

    search: function (req,res) {
        let busqueda = req.query.busqueda;
        let relaciones = {
            include: [
                {association:'usuarios'}, {association:'comentarios'}
            ]
        };
        let criterio = {
            where:[{nombreProducto:{[op.like]:'%'+busqueda+'%'}}]
        }
        Producto.findAll(criterio,relaciones)
        .then(data=> res.send(data))
            
           // return res.render('search-results', {data: data});
        
        .catch(function(err){
            console.log(err);
        })
    }
}

module.exports = indexController;