var ApiResult = require('./ApiResult')

var mysql = require('mysql');

connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
<<<<<<< HEAD
    database : 'delicious'
=======
    database : 'zyy'
>>>>>>> 028d20e1851440d07c23467ed77615e2cba812ce
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