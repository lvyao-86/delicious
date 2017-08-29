<template>
	<div id="goodsbrowse">
		<template>
			  <el-carousel :interval="2500" type="card" height="350px">
			    <el-carousel-item v-for="(item,index) in imgurl" :key="item">
			     	<img :src="'./src/assets/images/' + item" />
			     	<p>写个字kankan</p>
			    </el-carousel-item>
			  </el-carousel>
			  <h1>欢迎光临<br>LOVE FOODS , LOVE LIFE</h1>
		</template>
	</div>
</template>
<script>
	import './goodsbrowse.scss'
	export default {
		data:function(){
			return{
				imgurl: ['drink/avocado-Yakult-milk-shake.jpg','main-course/Braised-chicken-with-French-wine.jpg','soup/Tomato-seafood-soup.jpg','sala/Dried-fruit-salad.jpg','snack/Potato-bacon-cheesecake.jpg']
			}
		}
	}
</script>