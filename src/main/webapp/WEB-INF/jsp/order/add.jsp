<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/css.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/check.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/handle.js"></script>
<title></title>
<style type="text/css">
.STYLE1 {
	font-size: 18px
}
</style>
<!-- <script type="text/javascript"> -->
<!-- 	var Fields = "userName;name;password_M;role.id"; -->
<!-- 	var FieldsName = "用户名;姓名;密码;角色"; -->
<!-- 	var CheckType = "text;text;text;dropdownlist"; -->
<!-- 	var Length = "50;50;50,50"; -->
<!-- 	var IsEmpty = "false;false;false;false"; -->
<!-- </script> -->
</head>

<body>


	<!---------------右侧------------------>
	<div class="right">

		<!--right start-->
		<div class="top">
			<!--top start-->
			<div class="position pullleft ">
				<p>
					<span class="STYLE1">订单管理--添加</span>
				</p>
			</div>
			<div class="pullright overflowhidden">
				<input type="button" class="btn btn-default" value="返回"
					onclick="javascript:history.go(-1);" />
			</div>
			<div class="height10">
				<br>
			</div>
		</div><!--top end-->
		<div class="right-ctn">
			<div class="bordernormal plr20">
				<form action="<%=request.getContextPath()%>/order/add" method="post"
					　enctype="multipart/form-data">
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					
					
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>排：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="seatRow"
									name="seatRow" style=" padding:0 12px;">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>座：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="seatCol"
									name="seatCol" style=" padding:0 12px;">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>价格：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="price"
									name="price" style=" padding:0 12px;">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>状态：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="flag"
									name="flag" style=" padding:0 12px;">
							</div>
						</div>

					</div>
					
					<div class="formgroup">
						<label class="font14 widthtextalignr">备注：</label>
						<textarea rows="3" name="remark" id="remark"
							class="form-control textareawidthlong bglightgrey"></textarea>
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
