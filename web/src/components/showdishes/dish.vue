<template>
	<div class="progress">
		<h1>菜品制作进度一览表</h1>
		<div class="order">
			<h3>已下单</h3>
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
			      label="桌号">
			    </el-table-column>
		  	</el-table>
		</div>

		<div class="cooking">
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
			      prop="name"
			      label="菜名"
			      width="180">
			    </el-table-column>
			    <el-table-column
			      prop="address"
			      label="数量">
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
	        tableData3: []
	      }
	    },

	    created(){
	    	http.get('indent').then(response => {
	    		console.log(1,this.tableData3)

	    		for(var item of response.data){
	    			this.tableData3.push(item)
	    		}
	    	})
	    } 
	}
</script>