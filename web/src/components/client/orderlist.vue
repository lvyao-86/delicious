
<template>
	<div id="order">
		<div class="logo">
			<h1>logo</h1>
		</div>
		<h2>订单列表</h2>
		<div id="goodslist">
			<table class="goodsBox" >
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
			<p><i style="font-size: 20px;color: red">{{id}}</i> 号桌备注：
			<input type="text" v-model='message' class="remark"></p>
			<p><span class="total">小计：<i class="red">￥{{total}}</i></span><input type="button" value="下单" class="btnSure" @click="sureOrder"></p>
			</div>
	</div>
</template>
<script>
	import "./orderlist.scss"
	import $ from 'jquery'

	export default {
		data:function(){
			return {
				input:'',
				id:2,
				cols:['序号','菜名','单价','操作'],
				list:[],
				message:'',
				tishi:''

			}
		},
		methods:{
			sureOrder:function(){
				console.log(13131)
				var data = {
					number:2,
					boy:'小明',
					list:JSON.stringify(this.list),
					state:'未完成',
					payment:'未付款',
					message:this.message,
					price:this.total
				}
				$.post('http://localhost:888/addData',{data:data},function(res){
						this.tishi=res;
						this.open();
						this.list=[];
				}.bind(this))
			},
			btnPlus:function(index){
				this.list[index].qty++
			},btnSub:function(index){
				this.list[index].qty--
				if(this.list[index].qty<=0){
					this.list.splice(index,1)
				}
			},
			open(){
				this.$message(this.tishi)
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
