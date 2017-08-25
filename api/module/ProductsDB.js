var ApiResult = require('./ApiResult')

var mysql = require('mysql');

connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'epos'
})
connection.connect();


module.exports = {

    repertory: function(condition, callback){
        connection.query(condition, function (error, results, fields) {
            if (error) throw error;
            callback(results);
            
        });
    },
    products: function(condition, callback){
        create();
        connection.query(condition, function (error, results, fields) {
            if (error) throw error;
            callback(results);
            connection.end()
        });
    },
   
}