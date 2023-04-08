const data = require('../data/data');

const usersController = {
    profile: function (req,res) {
        return res.render('profile', {data: data})
    },
    profileEdit: function (req,res) {
        return res.render('profile-edit')
    },
    login: function (req,res) {
        return res.render('login');
    },
    register: function (req,res) {
        return res.render('register');
    },
}

module.exports = usersController;