<template>
  <div id="foodsdatalist">
    <el-row>
      <el-col id='wih' :span="8" v-for="(obj, index) in datalist" :key="index" :offset="index > 0 ? datalist.length : 0">
        <el-card :body-style="{ padding: '0px' }">
          <img :src="'./src/assets/images/' + obj.imgurl" class="image">
        
          <div>  
              <p class="pce"><span>{{obj.name}}</span></p> 
              <p class="pce">价格：<span class="price">￥{{obj.price}}</span>
                <button class="button" :id="obj.ID" @click='orders(obj.ID)'>点</button>
              </p>
             
          </div>
        </el-card>
      </el-col>
    </el-row>
    <div class="block">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageIndex"
        :page-size="qty"
        :page-sizes="[2,4,8,10]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totallist.length">
      </el-pagination>
    </div>
  </div>
</template>
<script>
import './menuShow.scss'
import $ from 'jquery'
export default {
  data() {
    return {
      currentDate: new Date(),
      props:['api'],
      datalist:[],
      totallist:[],
      pageCount:50,
      pageIndex:1,
      qty:8,
      list:[],
      kind:'',
      message:''
    };
  },
  methods:{
    search:function(){
      $.post('http://localhost:888/search',{keyword:this.message,pageNo:this.pageIndex -1,qty:this.qty},function(response){
        this.datalist = response;
      }.bind(this))
    },
    handleSizeChange:function(val) {
      this.qty = val;
      this.getData(this.kind);
    },
    handleCurrentChange:function(val) {
      this.pageIndex = val;
      this.getData(this.kind);
    },
    getData:function(type){
      $.post('http://localhost:888/getmenu',{category:type,pageNo:this.pageIndex - 1,qty:this.qty},function(response){
        this.datalist = response;
      }.bind(this))
    },
    initData:function(type){
      $.post('http://localhost:888/menu',{category:type},function(response){
        this.totallist = response;
        this.pageCount = Math.ceil(this.totallist.length/this.qty)*10;
        console.log('asdasd',this.pageCount);
      }.bind(this))
    },
    open:function(idx){
      this.datalist.forEach(function(item,index){
        if(item.ID == idx){
            var rest = this.list.filter(function(temp){
              return temp.name === item.name;
            });
            if(rest.length>0){
              rest[0].qty++;
            }else{
              var goods = {
                name:item.name,
                price:item.price,
                qty:1
              };
              this.list.push(goods);
            }
            console.log(this.list);
        }
      }.bind(this))
    },
    orders:function(idx){
      this.open(idx);
      this.$parent.$refs.orderlist.list=this.list;
    }
  },
  created:function(){
    this.getData(this.kind);
    this.initData(this.kind);
  }
}
</script>
