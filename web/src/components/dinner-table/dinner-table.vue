<template>
	<div>
		<div class="dinner-table">
			<div v-for="(item, idx) in data" class="table">
				<img src="../../assets/images/table.jpg">
				<p class="status">{{tableStatus.indexOf(idx+1) >= 0? '使用中':'空闲'}}</p>
				<p class="table-number">
					<span>台号: {{item.name}}</span>
					<i class="fa fa-eye" @click="open(item)"></i>
				</p>
			</div>
		</div>
		<div class="table-order">
			<h3>{{currentTable}}号桌订单详情</h3>
			<table v-if="currentData.length > 0">
				<thead>
					<th v-for="(val, key, idx) in currentData[0]">{{tableFiled[key] || key}}</th>
					<th>小计</th>
				</thead>
				<tbody>
					<tr v-for="(item, idx) in currentData">
						<td v-for="(val, key, idx) in item">{{val}}</td>
						<td>{{item.qty * item.price}}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th>合计</th>
						<th v-for="(val, key) in sum">{{val}}</th>
					</tr>
				</tfoot>
			</table>
		</div>	
	</div>
</template>

<script type="text/javascript">
	import './dinner-table.scss'
	import http from '../../utils/HttpClient'
	export default {
		data(){
			return {
				data:[{name: '夏日风情沙拉', status: 'false', qty: 1, price: 38,  subtotal: 38}],
				tableFiled: {name: '菜名', status: '状态', qty: '数量', price: '单价', subtotal: '小计'},
				status: {false: '空闲', true: '使用中'},
				currentTable: null,
				currentData: [],
				sum:{},
				tableStatus: []
			}
		},
		methods:{
			open(data){
				this.currentTable = data.name; //桌号
				http.post('getTableOrder', {name: data.name})
				.then( response => {
					if(response.data){
						//表格数据
						this.currentData = response.data

						//表格合计
						var [priceSum, qtySum, totalSum] = [0, 0, 0];
						response.data.forEach( item => {
							priceSum += Number(item.price)
							qtySum += Number(item.qty)
							totalSum += Number(item.price)*Number(item.qty)
						})
						this.sum = {priceSum: priceSum, qtySum: qtySum, totalSum: totalSum}
					}else{
						this.currentData = '';
					}
				})
			}
		},
		beforeMount(){
			http.post('getData', {tableName: 'dinnertable'})
			.then( response =>{
				this.data = response.data;
			})
			
			//页面刷新获取餐桌状态
			http.get('tableStatus')
			.then( response =>{
				this.tableStatus = response.data;
			})
			
			//餐桌状态监听
			setInterval(() =>{
				http.get('tableStatus')
				.then( response =>{
					this.tableStatus = response.data;
				})
			}, 10000)
		}
	}
</script>