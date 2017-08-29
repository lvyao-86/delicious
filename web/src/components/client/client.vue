<template>
	<div id="client" ref="client">
		<orderlist ref='orderlist'></orderlist>
		<div class="right">
			<tabButton ref='tabButton'></tabButton>
			<transition name='v'>
				<div id="foodsdata">
					<goodsbrowse v-show="isShow" ref='goodsbrowse'></goodsbrowse>
					<menuShow v-show="!isShow" ref='menuShow'></menuShow>
				</div>
			</transition>	
			
			
		</div>
		
	</div>
		
</template>
<script>
    import './client.scss'
	import orderlist from './orderlist.vue'
	import tabButton from './tabButton.vue'
	import goodsbrowse from './goodsbrowse.vue'
	import menuShow from '../menuShow/menuShow.vue'
	export default {
		data:function(){
			return {
				isShow:true
			}
		},
		components:{
			orderlist,
			tabButton,
			goodsbrowse,
			menuShow
		}
		
	}
</script>
