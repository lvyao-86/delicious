<template>
	<div id="home">
		<div id="header">
		
		</div>
		<div id="container">
			<ul>	
				<li><router-link to="/client">客户端</router-link></li>
				<li><router-link to="/cook">厨房端</router-link></li>
				<li><router-link to="/backstage">后台管理</router-link></li>
				<li><router-link to="/showdishes">菜品进度表</router-link></li>
			</ul>
			<ul>
				
			</ul>
			<router-view></router-view>
		</div>
		<div id="footer">	
			
		</div>
	</div>
</template>

<script type="text/javascript">
	import './home.scss'
	import http from '../../utils/HttpClient.js'
	export default {
		data(){
			return {
				data: null
			}
		},
		created(){
			http.post('getProducts')
			.then(response => {
				this.data = response.data[0]
			})
		}
	}
</script>
