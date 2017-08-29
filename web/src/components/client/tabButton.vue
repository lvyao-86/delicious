<template>
	<div id="tabSelect">
		<div class="block tab1">
			<el-button type="success">热门推荐</el-button>
			<el-button type="warning">今日特价</el-button>
			<el-button type="danger">呼叫服务</el-button>
			<el-input
			  placeholder="请输入菜名"
			  icon="search"
			  v-model="searchfoods"
			 >
			</el-input>
		</div>
		<div class="block tab2">
				<h2>分类：</h2>
				<el-button :key="index" v-for="(value,index) in catagroy" @click="cata(value)">{{value}}</el-button>
		</div>
	</div>
</template>
<script>
	import './tabButton.scss'
	export default {
		data:function(){
			return {
				searchfoods:'',
				catagroy:['沙拉','小吃','主菜','汤品','主食','甜点','饮品'],
			}
		},
		methods:{
			cata:function(value){
				this.$parent.isShow=false;
				this.$parent.$refs.menuShow.kind=value;
				console.log(this.$parent)
				this.$parent.$refs.menuShow.getData(value)
				this.$parent.$refs.menuShow.initData(value)
			}
		},
		watch:{
			searchfoods:function(){
				this.$parent.$refs.menuShow.message=this.searchfoods;
				this.$parent.$refs.menuShow.search();
			}
		}
	}
</script>