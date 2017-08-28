
var ApiResult = require('./ApiResult')

var mysql = require('mysql');



    connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'zyy'
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
     add:function(sql,arr,callback){

    	connection.query(sql,arr,function(err,res,fie){
     		if(!err){
     			callback(res)
     		}else{
     			callback({state:false,message:'插入失败'})
     		}


     	})

     }
   
}