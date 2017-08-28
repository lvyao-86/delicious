<template>
	<div class="addmenu-box">
		<h4>菜式新增</h4>
		<el-form ref="form" :model="form" :rules="rules" label-width="90px" >
			<el-form-item label="菜名：" prop="name">
    			<el-input v-model="form.name"></el-input>
  			</el-form-item>
  			<el-form-item label="分类：" prop="category">
			    <el-select v-model="form.category" placeholder="请选择分类">
			      	<el-option v-for="(val, key, idx) in category" :label="val" :value="key" key="idx"></el-option>
			    </el-select>
  			</el-form-item>
  			<el-form-item label="价格：" prop="price">
    			<el-input v-model.number="form.price"></el-input>
  			</el-form-item>
  			<el-form-item label="耗时：" prop="timeConsuming">
    			<el-input v-model="form.timeConsuming"></el-input>
  			</el-form-item>
  			<el-form-item label="菜式简介：" prop="description">
				<el-input type="textarea" v-model="form.description"></el-input>
			</el-form-item>
			<el-form-item label="上传图片：">
				<el-upload
					class="upload-demo"
					ref="upload"
					action="http://localhost:888/addmenu"
					:file-list="fileList"
					:data="form"
					list-type="picture"
					:on-success="uploadSuccess"
					:on-error="uploadFail"
					:auto-upload="false">
				  <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
				</el-upload>
			</el-form-item>
		</el-form>
		 <el-button @click="submitUpload('form')" size="small" type="primary">点击上传</el-button>
		 <el-button @click="resetForm('form')" size="small">重置</el-button>
	</div>
</template>

<script type="text/javascript">
	import	'./addmenu.scss'
	export default {
		data() {
			return {
				form: {name: '',description:'',category:'',price:'',timeConsuming:''},
				category: {sala:'沙拉', snack:'小吃','staple-food':'主菜',soup:'汤品','main-course':'主食',dessert:'甜点',drink:'饮品'},
				fileList: [],
				rules:{
					name: [{ required: true, message: '请输入菜品名称', trigger: 'blur' }],
					price: [{ type: 'number', required: true, message: '请输入价格，且只能为数字', trigger: 'blur' }],
					category: [{ required: true, message: '请选择分类', trigger: 'change'  }]
				}
			}
		},
		methods: {
			//表单上传
			submitUpload(formName){
				this.$refs[formName].validate((valid) => {
		          if (valid) {
		            this.$refs.upload.submit()
		            //this.resetForm('form');
		          } else {
		            console.log('error submit!!');
		            return false;
		          }
		        });
				
			},

			//清空表单
			resetForm(formName) {
        		this.$refs[formName].resetFields();
        		this.$notify.success({
		          message: '重置成功',
		          offset: 100,
		          duration: 2000
		        });

      		},

      		//上传成功提示信息
      		uploadSuccess(res){
				this.$notify.success({
		          	message: '菜单新增成功',
		          	offset: 100,
		          	duration: 2000
		        });
		        this.$refs['form'].resetFields()
      		},

      		//上传失败提示信息
      		uploadFail(){
      			this.$notify.error({
		          	message: '菜单新增失败，请重试',
		          	offset: 100,
		          	duration: 3000
		        });
      		}	
		}
	}
</script>