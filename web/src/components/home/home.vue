<template>
	<div id="home">
		<div id="header">
			<h1>Header</h1>
		</div>
		<div id="container">
			<ul>
				<li><router-link to="/login">登录</router-link></li>
				<li><router-link to="/register">注册</router-link></li>
				<li><router-link to="/client">客户端</router-link></li>
				<li><router-link to="/cook">厨房端</router-link></li>
				<li><router-link to="/backstage">后台管理</router-link></li>
			</ul>
			<ul>
				
			</ul>
			<router-view></router-view>
		</div>
		<div id="footer">	
			<h1>Footer</h1>
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
