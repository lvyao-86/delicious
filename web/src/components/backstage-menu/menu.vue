<template>
	<div class="menu">
		<dl>
			<dd v-for="(item, idx) in data">
				<div><img :src="'./src/assets/images/' + item.imgurl" ></div>
				<div>{{item.name}}</div>
				<div>￥{{item.price}}</div>
			</dd>
		</dl>
	</div>
</template>

<script type="text/javascript">
	import './menu.scss'
	import http from '../../utils/HttpClient.js'
	export default {
		data(){
			return {
				data: null
			}
		},
		beforeMount(){
			http.post('getProducts')
			.then(response => {
				this.data = response.data
				console.log(response.data)
			})
		}
	}
</script>
