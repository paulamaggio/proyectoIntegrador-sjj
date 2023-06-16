// const data = require('../data/data');

const db = require('../database/models');
const Producto = db.Producto;
const op = db.Sequelize.Op;


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

        let busqueda = req.query.search;
        Producto.findAll({
            order: [['createdAt', 'DESC']],
            include: [{association:'usuarios'}, {association:'comentarios'}],
            where: {
                [op.or]:[
                {nombreProducto: {[op.like]:"%"+busqueda+"%"}},
                {descripcion: {[op.like]:"%"+busqueda+"%"}}]
            }
        })
        .then(function(data){
            return res.render('search-results', {data: data});
        })
        .catch(function(err){
            console.log(err);
        })
    }
}

module.exports = indexController;