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
    
    //获取所有餐桌信息
    app.post('/getData', urlencodedParser, (request, response) => {
        var table = request.body.tableName;
        getMenu(table, response)
    })
    
    //获取相应餐桌的订单
    app.post('/getTableOrder', urlencodedParser, (request, response) => {
        var tableNum =  request.body.name
        var condition = "select * from indent where payment = '未付款'"
       
        var res = []; //存放结果
        var allOrder; //存放订单筛选结果
        DB.repertory(condition, function(result){
            //数据筛选
            allOrder = result.filter( item => {
                 return item.number == tableNum
            })
            //数组合并
            allOrder.forEach( item => {
                res = res.concat(JSON.parse(item.list))
            })

            if(res){
                response.send({status: true, message: '数据请求成功', data: res})
            }else{
                response.send({status: false, message: '没有订单信息'})
            }
        })
    })
    
    //获取正在使用中台号
    app.get('/tableStatus', (request, response) => {
        DB.repertory("select * from indent where payment = '未付款'", result => {
            var arr =[]
            result.forEach(item => {
                if(arr.indexOf(item.number) < 0){
                    arr.push(item.number)
                }
            })
            response.send({status: true, data: arr})
        })
    })

    //charts获取销量数据
    app.get('/sales', (request, response) => {
        DB.repertory("select * from indent", result => {
            var arr = []; //空数组存放结果
            //获取所有订单数据
            result.forEach( item => {
                arr = arr.concat(JSON.parse(item.list))
            })
            //数据处理，相同菜品，销量相加
            var newArr = [arr[0]]
            for(var i=1; i<arr.length; i++){
                for(var j=0; j<newArr.length; j++){
                    if(arr[i].name == newArr[j].name){
                        newArr[j].qty += Number(arr[i].qty)
                        break;
                    }else if(arr[i].name != newArr[j].name && j == newArr.length - 1){
                        newArr.push(arr[i])
                    }
                }
            }
            response.send({status: true, message: '获取菜品销量成功', data: newArr})
        })
    })
}