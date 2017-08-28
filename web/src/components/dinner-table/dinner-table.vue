<template>
	<div class="dinner-table">
		<div v-for="(val, idx) in 10" class="table">
			<img src="../../assets/images/table.jpg">
			<p class="status">空闲</p>
			<p class="table-number">
				<span>台号: {{idx + 1}}</span>
				<i class="fa fa-eye" @click="open"></i>
			</p>
		</div>
	</div>
</template>

<script type="text/javascript">
	import './dinner-table.scss'
	export default {
		methods:{
			open(){
				alert('打开餐桌')
			}
		}
	}
</script>