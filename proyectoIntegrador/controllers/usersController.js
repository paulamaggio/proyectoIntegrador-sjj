const productos = require('../db/productos');

const usersController = {
    profile: function (req,res) {
        res.render('profile')
    },
    profileEdit: function (req,res) {
        res.render('profile-edit')
    },
}

module.exports = usersController;