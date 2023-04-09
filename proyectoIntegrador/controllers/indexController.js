const data = require('../data/data');

const indexController = {
    headerLogueado: function (req,res) {
        return res.render('headerLogueado', {data: data});
    },
    index: function (req,res) {
        return res.render('index', {data: data.productos});
    },
    search: function (req,res) {
        return res.render('search-results');
    },
}

module.exports = indexController;