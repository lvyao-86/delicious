<template>
	<div class="menu-box">
		<dl v-for="(item, idx) in data">
			<dt><img :src="'./src/assets/images/' + item.imgurl" ></dt>
			<dd>
				<span class="pro-name">{{item.name}}</span>
				<span class="pro-price">￥{{item.price}}</span>
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
