var DB = require('../module/ProductsDB');
var ApiResult = require('../module/ApiResult');

var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: true })
var multer = require ('multer'); 

var storage = multer.diskStorage({
    destination: function (request, file, callback) {
    	var path = '../web/src/assets/images'
    	var category = request.body.category;

    	//根据图片分类存放到不同文件夹
    	if(category.length > 0){ 
    		path += '/' + category
    	}
        callback(null,  path)
    },
    filename: function (request, file, callback) {
        //获取文件后缀
        var fileFormat = (file.originalname).split(".");
        //根据时间生成文件名
        callback(null, Date.now() + "." + fileFormat[fileFormat.length - 1]);
    }
})

var upload = multer({ storage: storage })  


exports.Register = function(app){

	function getMenu(table, response){
		var condition = "select * from " + table;
		DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
	}
	
	//获取菜单信息
    app.post('/getProducts', urlencodedParser, function(request, response){
        getMenu('products', response)
    });
	
	//删除菜单
	app.post('/delMenu', urlencodedParser, function(request, response){
		var menuID = request.body.id;
		var condition = "DELETE FROM products WHERE id = " + menuID;
		//先删除数据，再获取数据
		DB.repertory(condition, function(result){
        	getMenu('products', response)//获取数据
        })
	})

	//修改菜单
	app.post('/editMenu', urlencodedParser, function(request, response){
		var obj = request.body
		var condition = 'UPDATE products SET ';

		//SQL语句拼接
		for(var key in obj){
			if(key != 'id'){
				condition += `${key} = '${obj[key]}',`
			}
		}

		condition = condition.slice(0,-1) //去除多余逗号 
		condition += `WHERE id = ${obj.id}`
		DB.repertory(condition, function(result){
			//response.send({status: true, message: '修改成功'})
            getMenu('products', response)
        })
	})
    
    //菜单查询
    app.post('/searchMenu', urlencodedParser, function(request, response){
    	var keyword = request.body.keyword;
    	var condition = "SELECT * FROM products WHERE CONCAT(name, category) LIKE  '%"+ keyword +"%' "
    	DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
    })

    //菜单新增
    app.post('/addMenu', upload.fields([{name:'file',maxCount:10}]), function(request, response){

    	var categoryField = {sala:'沙拉', snack:'小吃','staple-food':'主菜',soup:'汤品','main-course':'主食',dessert:'甜点',drink:'饮品'};//分类字段
    	var imgUrl = request.body.category + '/' +request.files.file[0].filename //图片路径拼接
    	request.body.imgurl =  imgUrl; //对象添加图片属性
    	request.body.category = categoryField[request.body.category]//分类转中文

		// SQL语句拼接
    	var keyStr = '(';
    	var valStr = '(';
    	for(var key in request.body){
    		keyStr += key + ',';
    		valStr += `'${request.body[key]}',`
    	}
    	keyStr = keyStr.slice(0, -1) + ')'
    	valStr = valStr.slice(0, -1) + ')'
		var condition = `INSERT INTO products ${keyStr} VALUES ${valStr}`

		//数据库操作
		DB.repertory(condition, function(result){
           response.send({status: true, message: '菜式新增成功'})
        })
    })

    //获取信箱消息
    app.get('/getLetterBox', (request, response) => {
        getMenu('letterbox', response)
    })

    //清空信箱
    app.get('/clearLetterBox', (request, response) => {
        var condition = "DELETE FROM letterbox";
        DB.repertory(condition, function(result){
           response.send({status: true, message: '清空信箱成功'})
        })
    })
    
    app.post('/getData', urlencodedParser, (request, response) => {
        var table = request.body.tableName;
        getMenu(table, response)

    })

   /* app.post('/getTableOrder', urlencodedParser, (request, response) =>{
        var name = request.body.name;
        var tableName = request.body.tableName;
        var condition = `select * from ${tableName} where name = '${name}'`
        DB.repertory(condition, function(result){
           response.send({status: true, message: '数据请求成功', data: result})
        })
    } )*/

    app.post('/getTableOrder', urlencodedParser, (request, response) => {
        console.log(request.body)
        var tableNum =  request.body.name
        var condition = "select * from indent where payment = '未付款'"
        var res;
        DB.repertory(condition, function(result){
            result.forEach((item) => {
                if(item.number == tableNum){
                    res = item
                }
            })
            if(res){
                response.send({status: true, message: '数据请求成功', data: res})
            }else{
                response.send({status: false, message: '没有订单信息'})
            }
        })
       
    })
}