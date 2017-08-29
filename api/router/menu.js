var DB = require('../module/menuDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: true })

exports.Register = function(app){
	//获取菜单信息
    app.post('/getmenu', urlencodedParser, function(request, response){
        var category = request.body.category;
        var qty = request.body.qty;
        var pageNo = request.body.pageNo;
        if(!qty){
            qty = 8;
        }
        if(!pageNo){
            pageNo = 0;
        }
        var condition = `SELECT * FROM menu WHERE category = '${category}' limit ${pageNo*qty},${qty}`;
        DB.menus(condition,function(result){
            response.send(result);
        })
    });
    app.post('/menu', urlencodedParser, function(request, response){
        var category = request.body.category;
        var condition = `SELECT * FROM menu WHERE category = '${category}'`;
        DB.menus(condition,function(result){
            response.send(result);
        })
    });
    //模糊查询
      app.post('/search', urlencodedParser, function(request, response){
        var keyword = request.body.keyword;
        var qty = request.body.qty;
        var pageNo = request.body.pageNo;
        if(!qty){
            qty = 8;
        }
        if(!pageNo){
            pageNo = 0;
        }
        var condition = `SELECT * FROM menu WHERE CONCAT(name, category) LIKE '%${keyword}%' limit ${pageNo*qty},${qty}`;
        DB.menus(condition,function(result){
            response.send(result);
        })
    });

}