<template>
	<div class="progress">
		<h1>菜品制作进度一览表</h1>
		<div class="order">
			<h3>制作中</h3>
			<el-table
			    :data="tableData3"
			    height="500"
			    border
			    style="width: 100%">
			    <el-table-column
			      prop="id"
			      label="编号"
			      width="80">
			    </el-table-column>
			    <el-table-column
			      prop="createTime"
			      label="下单时间">
			    </el-table-column>
			    <el-table-column
			      prop="number"
			      label="桌号"
			      width="80">
			    </el-table-column>
			    <el-table-column
			      prop="list" 
			      label="菜名"
			      width="180">
			    </el-table-column>
			    <el-table-column
			      prop="message"
			      label="备注">
			    </el-table-column>
			    <el-table-column
			      prop="state"
			      label="操作"
			      width="120">
			    </el-table-column>
		  	</el-table>
		</div>

		<div class="cooking">
			<h3>已完成</h3>
			<el-table
			    :data="tableData4"
			    height="500"
			    border
			    style="width: 100%">
			    <el-table-column
			      prop="id"
			      label="编号"
			      width="80">
			    </el-table-column>
			    <el-table-column
			      prop="list" 
			      label="菜名"
			      width="180">
			    </el-table-column>
			    <el-table-column
			      prop="message"
			      label="备注">
			    </el-table-column>
			    <el-table-column
			      prop="number"
			      label="桌号">
			    </el-table-column>
			    <el-table-column
			      prop="payment"
			      label="付款"
			      width="100">
			    </el-table-column>
			    <el-table-column
			      prop="state"
			      label="操作"
			      width="120">
			    </el-table-column>
		  	</el-table>
		</div>
	</div>
</template>

<script>
	import http from '../../utils/HttpClient'
	import './dish.scss'
	export default {
	    data() {
	      return {
	        tableData3: [],
	        tableData4: []
	      }
	    },

	    created(){
	    	http.get('indent').then(response => {
	    		for(var item of response.data){
	    			//转为json对象
	    			item.list = JSON.parse(item.list)
	    			
	    			if(item.state == '未完成'){

	    				item.list = item.list.map(function(temp,idx){
	    					return temp.name+ "\n"
	    				})

	    				//去掉重复的菜品名
	    				var res = item.list
	    				function norepeat(arr){
						 	var newArr = [];

						 	// 遍历传入的数组arr
						 	for(var i=0;i<arr.length;i++){
						 		for(var j=0;j<newArr.length;j++){
						 			if(arr[i] === newArr[j]){
						 				break;
						 			}
						 		}
						 		if(j === newArr.length){
						 			newArr.push(arr[i]);
						 		}
						 		
						 	}

						 	return newArr;
						}

						var res1 = norepeat(res)
						item.list = res1 
	    				this.tableData3.push(item)
	    			}else{

	    				item.list = item.list.map(function(temp,idx){
	    					return temp.name+ "\n"
	    				})

	    				//去掉重复的菜品名
	    				var res = item.list
	    				function norepeat(arr){
						 	var newArr = [];
						 	// 遍历传入的数组arr
						 	for(var i=0;i<arr.length;i++){
						 		for(var j=0;j<newArr.length;j++){
						 			if(arr[i] === newArr[j]){
						 				break;
						 			}
						 		}
						 		if(j === newArr.length){
						 			newArr.push(arr[i]);
						 		}
						 		
						 	}

						 	return newArr;
						}

						var res1 = norepeat(res)
						item.list = res1 
	    				this.tableData4.push(item)
	    			}
	    		}
	    	})
	    } 
	}
</script>