<template>

	<div class="cookmess">
		<dl @click="messShow">
			<dt class="iconfont icon-youxiang"></dt>
			<dd ref="numbox" v-if="$store.state.cook.messData.length>0">
					{{$store.state.cook.messData.length}}
			</dd>
		</dl>

		<div class="tanc" v-if="hasshow">
			<h3>新增订单<b class="iconfont icon-shanchu" @click="messHide"></b></h3>
			<ul class="messread" >
				<li v-for="(ddobj,idx) in $store.state.cook.messData">
					<p class="c cai">
					<span v-for="(caiobj,idx) in ddobj.list">{{'[' + caiobj.name + ']  ' + '数量：' + caiobj.qty}}</span>
					</p>
					<p class="c beizhu">
						<span>备注</span>
						<b>{{ddobj.message}}</b>				
					</p>

				</li> 

			</ul>
			<p class="yes">
					<b @click="yesRead">订单已阅读</b>
			</p>
		</div>
		<div ref="mp3"></div>
	</div>


</template>


<script>
import '../../assets/font/cook/iconfont.css'
import './mess.scss'
export default {
	data:function(){
		return {
			mess:'信箱',
			hasshow:false,
	
		}
	},
	methods:{
		messShow:function(){
			this.hasshow = true;	
		},
		messHide:function(){
			this.hasshow = false;
		},
		yesRead:function(){
			this.hasshow = false;
			//阅读后清空邮箱 数据
			this.num = 0;
			this.messData = [];
			//清空map3
			this.$refs.mp3.innerHTML = '';
			console.log(this.num)
			console.log(this.messData)

		}
	},
	watch:{
		num:function(news,olds){
			
			if(news>0){
				var audio = '<audio  src="./src/assets/mp3/7499.wav" loop autoplay/>'
				this.$refs.mp3.innerHTML = audio;
			}
			
		}
	}
}

</script>