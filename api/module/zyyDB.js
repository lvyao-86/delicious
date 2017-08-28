
var ApiResult = require('./ApiResult')

var mysql = require('mysql');


function create() {
    connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'epos'
    })
    connection.connect();
}

module.exports = {

    get:function(sql,callback){
        create();
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