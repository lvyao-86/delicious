<template>
	<div class="cook">
		<h1>{{name}} <mess></mess></h1>
		<button :class="{butactive:who}" @click="active1">未完成订单</button>
		<button :class="{butactive:!who}" @click="active1">已完成订单</button>
		<newIndent  cols='number,list,message,createTime'></newIndent>

	</div>

</template>


<script>
import './cook.scss'
import '../../assets/common.css'
import newIndent from './newIndent.vue'
import mess from './mess.vue'

export default {
	data:function(){
		return {
			name:'cook',
			who:true
			
		
		}
	},
	components:{
		newIndent,
		mess
	},
	methods:{
		active1:function(){
			
			this.who = !this.who;
			this.$children[1].show(this.who)
			
		},
		
	}
}

</script>