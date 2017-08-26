<template>

	<div class="cookmess">
		<dl @click="messShow">
			<dt class="iconfont icon-youxiang"></dt>
			<dd ref="numbox" v-if="num>0">{{num}}</dd>
		</dl>

		<div class="tanc" v-show="hasshow">
			<h3>新增订单<b class="iconfont icon-shanchu" @click="messHide"></b></h3>
			<ul class="messread" >
				<li v-for="(ddobj,idx) in messData">
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
			num:0,
			messData:[]
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
		}
	},
	watch:{
		num:function(news,olds){
			

			
		}
	}
}

</script>