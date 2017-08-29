<template>
	<div>
		<div class="search-box">
		  	<el-input placeholder="菜名/分类" v-model="keyword">
		    	<el-button slot="append" icon="search" @click="search"></el-button>
		  	</el-input>
		  	<div class="more-options" @click="sort">
				<span><i class="fa-sort sort-config fa "></i>默认</span>
				<span><i class="fa-sort-numeric-asc fa  sort-price"></i>价格</span>
		  		<router-link to="/addmenu" ><i class="fa fa-plus-circle"></i></router-link>
		  	</div>
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
				<span @click="close" class="close">&times;</span>
			</div>
			<el-form :model="editObj"  label-width="70px">
			 	<el-form-item v-for="(val, key, idx) in editObj" :label="cn[key] || key"  key="idx" v-if="key != 'id'  && key != 'remark'">
			    	<el-input type="text" size="small" v-model="editObj[key]" auto-complete="off"></el-input>
			  	</el-form-item>
			  	<div class="editbox-button">
			  		<el-button type="primary" size="small" @click="()=>{editStatus = false}">取消</el-button>
    				<el-button type="primary" size="small" @click="save">提交</el-button>
  				</div>
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
				editStatus: false,
				cn: {name: '菜名:', description: '简介:', category: '分类:', price: '价格:', imgurl: '图片:', timeConsuming: '耗时:'},
				sortPrice: false
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
			},

			search: function(){
				this.$store.dispatch('searchMenu', this.keyword)
			},

			close(){
				this.editStatus = false;//关闭修改框
			},

			save(){
				this.$store.dispatch('editMenu', {data: this.editObj, callback: () =>{
					this.editStatus = false; //回调函数关闭弹窗
				}})
			},

			sort(e){
				var ele = e.target;
				//按价格排序
				if(ele.classList.contains('sort-price')){
					var data = this.$store.state.backstageMenu.menu;
					this.sortPrice = !this.sortPrice; //切换排序状态
					if(this.sortPrice){
						// 改变icon-font样式
						ele.classList.remove('fa-sort-numeric-asc')
						ele.classList.add('fa-sort-numeric-desc')
						//升序
						data.sort(function(a, b){
							return b.price - a.price
						})

					}else{
						ele.classList.remove('fa-sort-numeric-desc')
						ele.classList.add('fa-sort-numeric-asc')
						//降序
						data.sort(function(a, b){
							return a.price - b.price
						})
					}
					
				}
				//默认排序
				if(ele.classList.contains('sort-config')){
					this.$store.dispatch('dataReverse')
				}
			}
		},

		beforeMount(){
			this.$store.dispatch('getMenu')
		}
	}
</script>
