<template>
	<div class="letter-box">
		<h4>消息提示</h4>
		<ul>
			<li v-for="(item, idx) in this.$store.state.backstageHome.letterBox">
				<p class="letter-name">{{item.who}}</p>
				<div class="lette-rg">
					<div class="letter-msg">{{item.message}}</div>
					<div class="letter-time">{{item.createTime}}</div>	
				</div>
			</li>
		</ul>
	</div>
</template>

<script type="text/javascript">
	import './letterbox.scss'
	export default {
	}
</script>