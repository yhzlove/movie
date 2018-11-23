<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>登录页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/amazeui.min.css" />
<style>
	.header {text-align: center;}
	.header h1 {font-size: 200%;color: #333;margin-top: 30px;}
	.header p {font-size: 14px;}
</style>
<script type="text/javascript">
//使页面位于最顶层
if (window.top != null && window.top.location != window.location) {
    window.top.location = window.location;
}
</script>
</head>

<body style="background: url(<%=request.getContextPath()%>/images/bg1.jpg) no-repeat center center fixed;-webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">
	<div class="header">
		<div class="am-g">
			<h1>登录页面</h1>
		</div>
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			
			<hr>
			<br> <br>
			<form action="<%=request.getContextPath()%>/back/login.do" method="post" class="am-form">
			 <!-- <input type="hidden" name="type" value="admin_login"> -->
				<label for="email">用户名:</label>
				<input type="text" name="username"> <br> 
				<label for="password">密码:</label>
				<input type="password" name="password"><br> 
				<!-- <label for="remember-me"> -->
<!-- 				登录类型：<select name="type" > -->
<!--                         <option value="1">商家账号 -->
<!--                         <option value="2">管理员账号 -->
<!--                          <option value="3">用户账号 -->
<!--                         </label></option> -->
<!--                         </select> <br >  -->
				<div class="am-cf">
					<input type="submit" name="" value="登录" class="am-btn am-btn-primary am-btn-sm am-fl"> 
				</div>
			</form>
			<hr>
			<p>© 计算机13-3 郝照天</p>
		</div>
	</div>
    
</body>
</html>


