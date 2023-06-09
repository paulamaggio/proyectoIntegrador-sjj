var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');


const indexRouter = require('./routes/index');
const productRouter = require('./routes/product');
const usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// configuracion de session
app.use(session({ 
  secret: "ETyavaacasa",
	resave: false,
	saveUninitialized: true }));

// pasar datos de session a las vistas
app.use(function (req, res, next) {
  res.locals.user = req.session.user;
  res.locals.idUser = req.session.idUser;
  return next()
})

app.use(function(req, res, next) {
  if (req.session.user != undefined) {
      res.locals.user = req.session.user;
      return next();
  }
  return next();
});
//  middleware para cookies
app.use(function(req, res, next) {
  if (req.cookies.usuario != undefined && req.session.user == undefined) {
      let idUsuarioEnCookie = req.cookies.usuario;
      Usuario.findByPk(idUsuarioEnCookie)
      .then((data) => {
        req.session.user = data.dataValues;
        res.locals.user  = data.dataValues;
        return next();
      }).catch((err) => {
        console.log(err);
        return next();
      });
  } else {
    return next();
  }
});

app.use('/', indexRouter);
app.use('/product', productRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
