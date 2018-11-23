<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="w3_agilits_banner_bootm">
	<div class="w3_agilits_inner_bottom">
		<div class="wthree_agile_login" style="float: right;">
			<ul>
				<c:if test="${not empty loginMember }">
					<c:if test="${not empty loginMember.headImgUrl }">
					<img alt="${loginMember.realName}" src="<%=request.getContextPath()%>/${loginMember.headImgUrl}" style="width:40px;height:40px;margin-top: -10px;">
					</c:if>
					<c:if test="${empty loginMember.headImgUrl }">
					<img alt="${loginMember.realName}" src="<%=request.getContextPath()%>/images/admin.jpg" style="width:40px;height:40px;margin-top: -10px;">
					</c:if>
				<li>${loginMember.realName}</li>
				<li><a href="<%=request.getContextPath()%>/member/update" class="login reg" >个人资料</a></li>
				<li><a href="<%=request.getContextPath()%>/member/logout.do" class="login reg">退出</a></li>
				</c:if>
				<c:if test="${empty loginMember}">
				<li><a href="#" class="login"  data-toggle="modal" data-target="#myModal4">登入</a></li>
				<li><a href="#" class="login reg"  data-toggle="modal" data-target="#myModal5">注册</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<!-- 登入 -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Login</h4>
					<div class="login-form">
						<form action="<%=request.getContextPath()%>/member/login.do" method="post">
							<input type="text" name="userName" id="loginName" placeholder="用户名" >
							<input type="password" name="password" id="loginPassword" placeholder="密码" >
							<div class="tp">
								<input type="button" onclick="login();" value="登入">
							</div>
							<div class="forgot-grid">
								<div class="clearfix"></div>
							</div>
								
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function login(){
				var userName = $("#loginName").val();
				var password = $("#loginPassword").val();
				if(userName==null||userName==""){
					alert("请输入用户名!");
					return;
				}
				if(password==null||password==""){
					alert("请输入密码");
					return;
				}
				$.ajax({
		            type: "POST",
		            url: "<%=request.getContextPath()%>/member/login.do",
		            data: {'userName': userName,'password': password},
					success: function (msg) {
		                if (msg != "success") {
		                    alert(msg);
		                }else{
		                	location.reload();
		                	//window.location.href="<%=request.getContextPath()%>"; 
		                }
		            },
		        });
			
			}
		
		</script>
	</div>
	
	<!-- //登入 -->
  	<!-- 注册 -->
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >
		<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>快速注册</h4>
					<div class="login-form">
						<form action="<%=request.getContextPath()%>/member/regist.do" method="post">
						    <input type="text" name="userName" id="registuserName" placeholder="用户名" >
							<input type="text" name="realName" id="registrealName" placeholder="用户昵称" >
							<input type="text" name="email" id="registemail" placeholder="邮箱" >
							<input type="password" name="password" id="registpassword" placeholder="密码" >
							<input type="password" name="conform_password" id="registpassword2" placeholder="确认密码" >
							<div class="tp">
								<input type="button" onclick="regist()" value="快速注册">
							</div>
						</form>
						
						<script type="text/javascript">
							function regist(){
								var userName = $("#registuserName").val();
								var realName = $("#registrealName").val();
								var email = $("#registemail").val();
								var password = $("#registpassword").val();
								var conform_password = $("#registpassword2").val();
								if(userName==null||userName==""){
									alert("请输入用户名!");return;
								}
								if(realName==null||realName==""){
									alert("请输入用户昵称");return;
								}
								if(password==null||password==""){
									alert("请输入密码");return;
								}else if(password!=conform_password){
									alert("输入的两次密码必须相同");return;
								}
								$.ajax({
						            type: "POST",
						            url: "<%=request.getContextPath()%>/member/regist.do",
						            data: {'userName': userName,'realName':realName,'email':email,'password': password},
									success: function (msg) {
						                if (msg != "success") {
						                    alert(msg);
						                }else{
						                	location.reload();//刷新当前页面
						                	//window.location.href="<%=request.getContextPath()%>"; 
						                }
						            },
						        });
							
							}
						
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //注册 -->
