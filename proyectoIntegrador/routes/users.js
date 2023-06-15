const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');

router.get('/profile/:id', usersController.profile); 

router.get('/profile/edit/:id', usersController.profileEdit);
router.post('/profile/edit', usersController.profileEditStore);

router.get('/login', usersController.login);
router.post('/login', usersController.loginStore);

router.post('/logout', usersController.logout)

router.get('/register', usersController.register);
router.post('/register', usersController.registerStore);

router.get('/usersearch', usersController.userSearch)

module.exports = router;