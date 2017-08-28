
<template>
	<div id="order">
		<div class="logo">
			<h1>logo</h1>
		</div>
		<h2>订单列表</h2>
		<el-button>默认按钮</el-button>
		<el-button type="primary">主要按钮</el-button>
		<el-button type="text">文字按钮</el-button>
		<div id="goodslist">
			<table class="goodsbox" >
				<thead>
					<tr >
						<th v-for="(value,index) in cols">{{value}}</th>
					</tr>
				</thead>
				<tbody>
						<tr v-for="(obj,index) in list">
							<td>{{index+1}}</td>
							<td>{{obj.name}}*{{obj.qty}}</td>
							<td>￥{{obj.price}}</td>
							<td><span class="btnSub" @click="btnSub(index)">-</span>
								<span class="btnPlus" @click='btnPlus(index)'>+</span>
							</td>	
						</tr>
				</tbody>
			</table>
		</div>	
		<div class="message">
			<p><i style="font-size: 20px;color: red">{{id}}</i> 号桌提示：
			<input type="text" v-model='message' class="remark"></p>
			<p><span class="total">总金额：<i class="red">￥{{total}}</i></span><input type="button" value="下单" class="btnSure" @click="sureOrder"></p>
			</div>
	</div>
</template>
<script>
	import "./orderlist.scss"
	import Vue from 'vue'
	import {Button} from 'element-ui'
	Vue.use({Button})
	export default {
		data:function(){
			return {
				input:'',
				id:2,
				cols:['序号','菜名','单价','操作'],
				list:[{
					name:"鱼香肉丝",
					price:"10",
					qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:3
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					}
					,{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					},{
						name:'王老吉',
						price:'5',
						qty:1
					}],
				message:''

			}
		},
		methods:{
			sureOrder:function(){
				console.log(1313)
			},
			btnPlus:function(index){
				this.list[index].qty++
			},btnSub:function(index){
				this.list[index].qty--
				if(this.list[index].qty<=0){
					this.list.splice(index,1)
				}
			}
		},
		computed:{
			total:function(){
					var total=0;
				this.list.forEach(function(obj,index){
					total+= obj.price*obj.qty
				})
				return total
				console.log('总额:'+total)
			}
		}

	}
</script>
