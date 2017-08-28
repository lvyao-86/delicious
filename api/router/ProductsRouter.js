var DB = require('../module/ProductsDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: true })



exports.Register = function(app){

	
	function getMenu(table, response){
		var condition = "select * from " + table;
		DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
	}
	
	//获取菜单信息
    app.post('/getProducts', urlencodedParser, function(request, response){
        getMenu('products', response)
    });
	
	//删除菜单
	app.post('/delMenu', urlencodedParser, function(request, response){
		var menuID = request.body.id;
		var condition = "DELETE FROM products WHERE id = " + menuID;
		DB.repertory(condition, function(result){
        	getMenu('products', response)
        })
	})

	//修改菜单
	app.post('/editMenu', urlencodedParser, function(request, response){
		var data = request.body
		console.log(data)
	})
    
    //菜单查询
    app.post('/searchMenu', urlencodedParser, function(request, response){
    	var keyword = request.body.keyword;
    	console.log(keyword)
    	var condition = "SELECT * FROM products WHERE CONCAT(name, category) LIKE  '%"+ keyword +"%' "
    	DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
    })
}