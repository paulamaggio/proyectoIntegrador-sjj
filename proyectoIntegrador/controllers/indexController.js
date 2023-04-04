const data = require('../data/data');

const indexController = {
    headerLogueado: function (req,res) {
        return res.render('headerLogueado');
    },
    index: function (req,res) {
        return res.render('index');
    },
    search: function (req,res) {
        return res.render('search-results');
    },
}

module.exports = indexController;