<template>
	<table class="cooktable">
		<thead>
				<tr>
					<th v-for="(val,key) in $store.state.cook.indentData[0]" v-if="colss.indexOf(key) != -1">{{translate[key]}}</th>
					<th v-if="cookwho">订单操作</th>
				</tr>
		</thead>
		<tbody v-if="cookwho">

			<tr v-for="(obj,index) in $store.state.cook.indentData" :ref="'c' + index" v-if="obj.state == '未完成'">
				
				<td v-for="(val,key) in obj" v-if="colss.indexOf(key) != -1 ">
				{{key == 'list' ? ''  : val}}
					 <ul v-if="key == 'list'" class="caibox c">
						<li v-for="(cai,idx)  in  val" :ref="'cs' + index" @click="addcolor(obj,$event)">{{'['+ cai.name + ']' + '  数量：' + cai.qty }}</li>
						<span @click="successAll('c' + index,'cs' + index,obj,$event)">全部制成</span>
					</ul> 
				</td>
				<td class="caozuo"><button ref="obbut" class="okbut" @click="upDateIndent(obj.id,$event)">完成</button></td>
			</tr>

		</tbody>
		<tbody v-if="!cookwho">
			<tr v-for="(obj,idx) in $store.state.cook.indentData"  v-if="obj.state == '已完成'">
				<td v-for="(val,key) in obj" v-if="colss.indexOf(key) != -1 ">
				{{key == 'list' ? ''  : val}}
					 <ul v-if="key == 'list'">
						<li v-for="cai  in  val">{{cai.name + '数量：' + cai.qty}}</li>
					</ul> 
				</td>
				
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</template>

<script>
import http from '../../utils/HttpClient.js'
import './newIndent.scss'



var translate = {
	id:'订单ID',
	number:'订餐桌号',
	boy:'服务员',
	list:'订单详情',
	state:'订单状态',
	payment:'付款状态',
	message:'备注信息',
	price:'价格',
	updateTime:'修改日期',
	createTime:'创建日期',
}



export default {
	
	data:function(){
		return {
			translate:translate,
			colss:[],
			cais:[],
			
		}
	},
	methods:{
	
		addcolor(obj,e){
			var ta = e.target;
			var okbut = ta.parentElement.parentElement.parentElement.querySelector('.okbut');
			// //一个元素的比例
			// var bili = 1/obj.list.length*100;
			//原有总数量
			var childs = obj.list.length;
			//当前数量(排除即将删除的 + 全选的按钮)
		
			var dxchild = ta.parentElement.children.length -2 ;
		
			var targwidth = 100 - dxchild/childs*100;
			//按钮当前长度
			// var butcss = getComputedStyle(okbut).width.split('p')[0];
			//清除当前菜
			ta.parentElement.removeChild(ta);

			okbut.style.width = targwidth + '%';
			if(targwidth == 100){
				okbut.style.color = '#fff'
			}

			//推送信息给信箱
			var mess = obj.number + '号桌: ' + ta.innerText + ' 已制成，速速来拿！';
			this.cookMessToBOX(mess)

		},
		upDateIndent(id,e){
			var ta = e.target;
			//获得订单未完成的菜的数量
			var nowcai = e.target.parentElement.parentElement.querySelectorAll('.caibox li').length;

			if(nowcai == 0){

				//api 获取 id 更新订单状态
				 http.get('upIndent',{id:id}).then(res=>{
						
				 		if(res.state){
				 			this.$store.dispatch('getCookData','once')
				 			console.log('更改成功，重新渲染')
				 		}else{
							console.log('更改失败')
				 		}

				 })


			}else{
				alert('还有:' + nowcai + ' 道菜没完成！')
			}
		
		},

		successAll(tr,cs,obj,e){

			var tr = this.$refs[tr];
			var cais = this.$refs[cs];
			var caiul = tr[0].querySelector('.caibox');
			var but = tr[0].querySelector('.okbut');
			var bili = 100/cais.length;

			if(cais.length >0){
		
				Array.prototype.forEach.call(cais,function(item,idx){
		
		
		
							setTimeout(function(){
		
								caiul.removeChild(item);
								but.style.width = (idx+1)*bili + '%';
		
								if(but.style.width.replace('%','')== 100 ){
									but.style.color = '#fff'
								}
								
							 
							}.bind(this),idx*200)
		
				});

				caiul.removeChild(e.target)
		
			}

			//推送消息给信箱
			var mess = obj.number + '号桌: 全部已制成，速速来拿！';
			this.cookMessToBOX(mess)
			

		},

		cookMessToBOX(datas){
			 //添加信息到信箱
			 http.get('toLetter',{who:'cook',message:datas}).then(res=>{
						console.log(res)
				 		if(res.state){
				 			console.log('推送成功')
				 		}else{
							console.log('推送失败')
				 		}

				 })


		}
	},
	mounted:function(){

		
	
	 	console.log('mounted')
	 },
	//created
	beforeMount:function(){
		this.$store.dispatch('getCookData')

		console.log('beforeMount')
	 setInterval(()=>{
	 
	 	this.$store.dispatch('getCookData')
	 	
	 	

	 	
	 },3000)

	
	//获取显示列的配置信息
	this.colss = this.cols.split(',');
		
	},
	props:['cookwho','cols']
	


}

</script>

