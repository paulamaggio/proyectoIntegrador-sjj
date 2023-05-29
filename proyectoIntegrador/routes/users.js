const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');

router.get('/profile', usersController.profile);
router.get('/profile/edit', usersController.profileEdit);
router.get('/login', usersController.login);
router.get('/register', usersController.register);

router.get('/prueba', usersController.prueba);
router.get('/pruebacom', usersController.pruebacom);


module.exports = router;