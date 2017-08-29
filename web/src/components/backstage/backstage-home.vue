<template>
	<div id="backstage">
		<div class="header">
			<div class="header-logo">LOGO</div>
			<div class="action" @click="toggle">
				<i class="fa fa-outdent"></i>
                <div class="option">
                    <ul>
                        <li class="letter-qty"><i class="fa fa-envelope" @click="openEnvelope"></i><span v-if="this.$store.state.backstageHome.letterQty > 0">{{this.$store.state.backstageHome.letterQty}}</span></li>
                        <li><i class="fa fa-bell"></i></li>
                        <li><i class="fa fa-user"></i></li>
                    </ul>
                </div>
                <i class="fa fa-bars"></i>
			</div>
		</div>
		<div class="content-wrap">
			<div class="side-bar" ref="sidebar" @click="selectCategory">
				<el-menu default-active="2" class="menu">
					<el-submenu index="1">
			        	<template slot="title"><i class="fa fa-bank"></i>餐厅管理</template>
		        		<el-menu-item index="1-1"><router-link to="dinnerTable">餐桌浏览</router-link></el-menu-item>
			      	</el-submenu>
			      	<el-submenu index="2">
			        	<template slot="title"><i class="fa fa-sticky-note-o" ></i>菜单浏览</template>
		        		<el-menu-item 
		        			:index="'2-' + (idx+1)" 
		        			v-for="(item, idx) in this.$store.state.backstageMenu.category" 
		        			key="idx"
		        			class="category"
		        			>{{item}}
		        		</el-menu-item>
			      	</el-submenu>
			      	<el-submenu index="3">
			        	<template slot="title"><i class="fa fa-bar-chart"></i>营业分析</template>
		        		<el-menu-item index="3-1"><router-link to="/charts">营业分析</router-link></el-menu-item>
		        		<el-menu-item index="3-2"><router-link to="/charts">营业报表</router-link></el-menu-item>
			      	</el-submenu>
				    <el-menu-item index="4" class="last-li"><i class="fa fa-desktop"></i>收银台</el-menu-item>
				    <el-menu-item index="5" class="last-li"><i class="fa fa-cog"></i>设置&nbsp;&nbsp;&nbsp;&nbsp;</el-menu-item>
			    </el-menu>
			</div>
			<div class="backstage-content">
				<router-view></router-view>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	import './backstage-home.scss'
	import menu from '../backstage-menu/menu.vue'
	import http from '../../utils/HttpClient'
	export default {
		methods: {
			toggle: function(e) {

				//侧栏显示隐藏
				let ele = e.target;
				if(ele.classList.contains('fa-outdent')){
					let status = this.$refs.sidebar.style.display 
					status == 'none'?  this.$refs.sidebar.style.display = 'block' : this.$refs.sidebar.style.display = "none"
				}
			},

			selectCategory: function(e){
				//点击侧栏分类，获取相应数据
				if(e.target.classList.contains('category')){ //事件监听，判断是否为target是否符合
					this.$router.push('menu')
					var currentCategory = String.trim(e.target.innerHTML);//获取当前分类，去除前后空格
					this.$store.dispatch('searchMenu', currentCategory)
				}
			},

			openEnvelope(){
				this.$router.push('letterbox')
				this.$store.state.backstageHome.letterQty = 0;
				this.$store.dispatch('getLetterBox')
				http.get('clearLetterBox')
				.then(response => {
					console.log(response)
				})
			},

		},
		created(){
			this.$store.dispatch('letterBox')
		}
	}
</script>
