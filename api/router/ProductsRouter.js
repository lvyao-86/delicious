var DB = require('../module/ProductsDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: true })



exports.Register = function(app){

    app.post('/getProducts', urlencodedParser, function(request, response){
        
        var condition = "select * from products"
        //连接数据库
        DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
    });

    
}