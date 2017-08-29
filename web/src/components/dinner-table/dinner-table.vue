<template>
	<div>
		<div class="dinner-table">
			<div v-for="(item, idx) in data" class="table">
				<img src="../../assets/images/table.jpg">
				<p class="status">{{item.status}}</p>
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
				data:[{name: '夏日风情沙拉', status: 'false', qty: 1, price: 38,  subtotal: 38}, {name: '土豆培根奶酪球', status: 'false', qty: 1, price: 38,  subtotal: 38},{name: '鲜虾天妇罗', status: 'true', qty: 1, price: 38,  subtotal: 38}],
				tableFiled: {name: '菜名', status: '状态', qty: '数量', price: '单价', subtotal: '小计'},
				status: {false: '制作中', true: '已上菜'},
				currentTable: null,
				currentData: []
				

			}
		},
		methods:{
			open(data){
				this.currentTable = data.name;
				http.post('getTableOrder', {name: data.name})
				.then( response => {
					if(response.data){
						this.currentData = JSON.parse(response.data.list)
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
		}
	}
</script>