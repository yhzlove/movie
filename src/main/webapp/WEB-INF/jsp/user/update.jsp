<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/css.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/check.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/handle.js"></script>
<title></title>
<style type="text/css">
.STYLE1 {
	font-size: 18px
}
</style>
 	<script type="text/javascript">
// 			var Fields = "userName;name;password_M;role.id";
// 			var FieldsName = "用户名;姓名;密码;角色";
// 			var CheckType = "text;text;text;dropdownlist";
// 			var Length = "50;50;50,50";
// 			var IsEmpty = "false;false;false;false";
		</script>
</head>

<body>
	

	<!---------------右侧------------------>
	<div class="right">
	
		<!--right start-->
		 	<div class="top"><!--top start-->
            <div class="position pullleft ">
                <p><span class="STYLE1">用户管理--修改</span></p>
            </div>
            <div class="pullright overflowhidden">
              	<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
            </div>
            <div class="height10"><br></div>
        </div>
        <div class="right-ctn">
			<div class="bordernormal plr20">
				<form action="<%=request.getContextPath()%>/user/back/update/${user.id}" method="post"
					　enctype="multipart/form-data">
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					
					<input type="hidden" name="id" value="${user.id}">
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>用户名：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="userName"
									name="userName" style=" padding:0 12px;" value="${user.userName}">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>密码：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="password"
									name="password" style=" padding:0 12px;" value="${user.password}">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>用户昵称：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="realName"
									name="realName" style=" padding:0 12px;" value="${user.realName}">
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>邮箱：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="email"
									name="email" style=" padding:0 12px;" value="${user.email}">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>联系电话：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="tel"
									name="tel" style=" padding:0 12px;" value="${user.tel}">
							</div>
						</div>
<!-- 						<div class="pullleft" style="width:48%; padding-right:2%;"> -->
<!-- 							<div class="formgroup"> -->
<!-- 								<label class="font14 widthtextalignr"> -->
<!-- 									<span class="required">*</span>注册时间：</label>  -->
<!-- 								<input class="form-control widthlonger" placeholder="请在此处输入..." id="registTime" -->
<!-- 									name="registTime" style=" padding:0 12px;"> -->
<!-- 							</div> -->
<!-- 						</div> -->

					</div>
					
					<div class=" overflowhidden">
	
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>用户角色：</label> 
								<select class="form-control widthlonger " name="roleid" id="roleid"
									style=" padding:0 12px;width: 196px;">
									<option value="1" <c:if test="${user.roleid=='1'}">selected</c:if>>系统管理员</option>
									<option value="2" <c:if test="${user.roleid=='2'}">selected</c:if>>工作人员</option>
								</select>
							</div>
						</div>

						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>状态：</label> 
									<select class="form-control widthlonger " name="flag" id="flag"
										style=" padding:0 12px;width: 196px;">
										<option value="1" <c:if test="${user.flag=='1'}">selected</c:if>>可登入</option>
										<option value="2" <c:if test="${user.flag=='2'}">selected</c:if>>不可登入</option>
									</select>
							</div>
						</div>
					</div>

					<div style="margin-left:20px;">
						<input type="submit" class="btn btn-primary" value="提交"
							 /> 
						<input type="button" class="btn btn-default" value="返回"
							onclick="javascript:history.go(-1);" />
					</div>
					<div class="height20"></div>
					<div class="height10"></div>
				</form>

			</div>
			<!----bordermal end--->
		</div>
		<!--right-ctn end-->
		
		
	</div>

</body>
</html>
