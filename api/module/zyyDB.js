
var ApiResult = require('./ApiResult')

var mysql = require('mysql');



    connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'delicious'

    })
    connection.connect();


module.exports = {

    get:function(sql,callback){
       
        //"select * from" + tableName + "where indexID = 1"
        connection.query(sql,function (error, results, fields) {
           	if(!error){
        		callback(results);
           	}else{
           		callback({state:false,message:'请求失败',data:[]})
           	}
           	
        });
    },
   
}