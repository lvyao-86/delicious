var path = require('path');

var ProductsRouter = require('./ProductsRouter');
var cookieParser = require('cookie-parser');
var session = require('express-session');


var indent = require('./indent');
var menu = require('./menu');
var client = require('./client');


exports.Register = function(express){
    var app = express();
        //sesstion 配置
    app.use(cookieParser())

    app.use(session({
         secret:'123456',
         name:'testapp',
         cookie:{maxAge:80000},
         resave:false,
         saveUninitialized:true
    }))

  

    app.all('*', function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
        res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
        if(req.method=="OPTIONS") {
            res.send(200);/*让options请求快速返回*/
        } else{
            next();
        }
    });
    app.use(express.static(path.join(path.resolve(__dirname, '../../'), '/')));
    app.get('/', function(request, response){


        //判断用户是否登录
        if(request.session.name){
             response.send({status:request.session.name})
             return
        }else{
            response.send({status:'未登录'})
            return
        }
        
    })

    ProductsRouter.Register(app);
    indent.Register(app);
    menu.Register(app);
    client.Register(app);
    return app;
}