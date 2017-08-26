var DB = require('../module/zyyDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: true })



exports.Register = function(app){

    app.get('/indent', function(request, response){
        
        var sql = "select * from indent"
        //连接数据库
        DB.get(sql, function(res){
        	console.log(res)
        if(res.state == undefined){
        	response.send({status: true, message: '数据请求成功', data: res})
            return
        }else{
        	response.send({status: false, message: '请求失败', data: []})
            return
        }
           
           
        })
    });


    app.get('/upIndent',function(require,response){

    	var sql = "UPDATE indent SET state="+ "'已完成'" + "  WHERE id=" + require.query.id;
    	 //连接数据库
        DB.get(sql, function(res){

        if(res.state == undefined){
           response.send({state: true, message: '更新成功'})
           return
        }else{
           response.send(res)
           return
        }
           
           
        })

    })

    
}