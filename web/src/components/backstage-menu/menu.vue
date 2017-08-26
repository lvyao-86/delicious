<template>
	<div>
		<div class="search-box">
		  	<el-input placeholder="菜名/分类" v-model="keyword">
		    	<el-button slot="append" icon="search" @click="search"></el-button>
		  	</el-input>
		</div>
		<div class="menu-box">
			<el-card :body-style="{ padding: '0px' }" v-for="(item, idx) in this.$store.state.backstageMenu.menu" key="idx">
		      	<img :src="'./src/assets/images/' + item.imgurl"  class="image">
		      	<div style="padding: 14px;">
			        <span class="pro-name">{{item.name}}</span>
			        <span class="pro-price">￥{{item.price}}</span>
			        <div class="bottom clearfix">
			        	<el-button type="primary" icon="delete" size="mini" @click="del(item.id)"></el-button>
			        	<el-button type="primary" icon="edit" size="mini" @click="edit(item.id)"></el-button>
			        </div>
		      	</div>
		    </el-card>
		</div>
		<div class="edit-box" v-if="editStatus">
			<div class="edit-header">
				<span>信息编辑</span>
				<span>&times;</span>
			</div>
			<el-form :model="editObj"  ref="ruleForm2" label-width="80px" >
			 	<el-form-item label="菜名：" prop="name">
			    	<el-input type="text" v-model="editObj.name" auto-complete="off"></el-input>
			  	</el-form-item>
			</el-form>

		</div>
	</div>
</template>

<script type="text/javascript">
	import './menu.scss'
	import http from '../../utils/HttpClient.js'
	export default {
		data(){
			return {
				keyword: null,
				editObj: {},
				editStatus: false
			}
		},
		methods: {
			del: function(prID){
				this.$confirm('是否要删除选中菜品?', '提示', {
		        	confirmButtonText: '确定',
		        	cancelButtonText: '取消',
		        	type: 'warning'
		        }).then(() => {
		        	//要删除菜单ID，回调函数CB显示提示信息
		        	this.$store.dispatch('delMenu', {id: prID, cb: ()=>{
		        		this.$message({
            				type: 'success',
            				message: '删除成功!'
          				});}
		        	});
		        }).catch(() => {//忽略取消按钮提示信息     
		        });
			},
			
			edit: function(prID){
				//获取当前菜式信息
				let editData = this.$store.state.backstageMenu.menu.filter( item => {
					return item.id == prID
				})[0]
				this.editObj = JSON.parse(JSON.stringify(editData));//解决数据引用类型问题
				this.editStatus = true;//显示修改框
				return
				this.$store.dispatch('editMenu')
			},

			search: function(){
				this.$store.dispatch('searchMenu', this.keyword)
				console.log('asdsad')
			}
		},

		beforeMount(){
			this.$store.dispatch('getMenu')
		}
	}
</script>
