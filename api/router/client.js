var DB = require('../module/menuDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: true })

exports.Register = function(app){
	//获取菜单信息
    app.post('/addData', urlencodedParser, function(request, response){
        var data = request.body.data;
       console.log(data)
       // SQL语句拼接
        var keyStr = '(';
        var valStr = '(';
        for(var key in data){
            keyStr += key + ',';
            valStr += `'${data[key]}',`
        }
        keyStr = keyStr.slice(0, -1) + ')'
        valStr = valStr.slice(0, -1) + ')'

        var condition = `INSERT INTO indent ${keyStr} VALUES ${valStr}`
        DB.menus(condition,function(result){
            if(result){
                 response.send('下单成功');
            }else{
                 response.send('下单失败');
            }
           
        })
    });
}