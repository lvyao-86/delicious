<template>
	<table class="cooktable">
		<thead>
				<tr>
					<th v-for="(val,key) in list[0]" v-if="colss.indexOf(key) != -1">{{translate[key]}}</th>
					<th v-if="who">订单操作</th>
				</tr>
		</thead>
		<tbody v-if="who">

			<tr v-for="(obj,index) in list" :ref="'c' + index" v-if="obj.state == '未完成'">
				
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
		<tbody v-if="!who">
			<tr v-for="(obj,idx) in list"  v-if="obj.state == '已完成'">
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
			list:[],
			who:true,
			translate:translate,
			colss:[],
			cais:[],
			
			getlist:function(mode){
					http.get('indent').then(res=>{
					//获取订单数据
					

					if(res.data.length > this.list.length){
						
						//转换菜单列表为对象（默认是json字符串）
						res.data.forEach(function(item,idx){

								item.list = JSON.parse(item.list);
								
						})

						//更新信箱数量及内容传给邮箱组件(不是首次进入页面)
						if(this.list.length != 0 ){
							//得出 最新内容长度和 原有内容长度差值
							var cha = res.data.length - this.list.length;
							//组件 qty 图标原有基础上加上差值
							this.$parent.$refs.mess.num += cha;
							//新的内容 合并 原有内容，更新邮箱组件data 
							// console.log(this.$parent.$children[0])
							// console.log(res.data.slice(-cha))
					
							this.$parent.$refs.mess.messData = this.$parent.$refs.mess.messData.concat(res.data.slice(-cha));

							console.log('邮箱更新')
							

						}
						

						
						this.list = res.data;
						
					}
					//如果模式为渲染请求
					if(mode == 'once'){
						//转换菜单列表为对象（默认是json字符串）
						res.data.forEach(function(item,idx){

								item.list = JSON.parse(item.list);
								
						})

						this.list = res.data;

					}
					
					

				})
			}

			
		}
	},
	methods:{

	},
	methods:{
		show(who){
			 this.who = who;
			 
		},
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
						console.log(res)
				 		if(res.state){
				 			this.getlist('once')
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
	//created
	beforeMount:function(){

	 setInterval(()=>{
	 	
	 	//console.log(this.$parent.$children)
	 	this.getlist();
	 	// console.log(this.$parent.$refs.mess)
	 	// console.log(this.$parent.$refs.mess.messData);
	 	
	 },3000)

	
	//获取显示列的配置信息
	this.colss = this.cols.split(',');
		
	},
	props:['cols']


}

</script>

