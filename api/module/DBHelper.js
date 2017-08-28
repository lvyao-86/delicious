var ApiResult = require('./ApiResult')

var mysql = require('mysql');


function create() {
    connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'delicious'
    })
    connection.connect();
}

module.exports = {

    get: function(tableName, condition, callback){
        create();
        connection.query("select * from" + tableName + "where indexID = 1", function (error, results, fields) {
            if (error) throw error;
            console.log(results);
        });
    },
   
}