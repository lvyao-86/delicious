<template>
	<div id="client">
		<orderlist></orderlist>
		<tabButton></tabButton>
	</div>
		
</template>
<script>
    import './client.scss'
	import orderlist from './orderlist.vue'
	import tabButton from './tabButton.vue'
	export default {
		components:{
			orderlist,
			tabButton
		}
	}
</script>
