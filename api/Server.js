var express = require('express');
var Router = require('./router/RootRouter')

var app = Router.Register(express);
app.listen(888);