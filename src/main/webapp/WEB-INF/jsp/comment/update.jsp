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
					<span class="STYLE1">影厅管理--修改</span>
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
				<form action="<%=request.getContextPath()%>/hall/update/${hall.id}" method="post"
					　enctype="multipart/form-data">
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					
					<input type="hidden" name="id" value="${hall.id}">
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>影厅名称：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="name"
									name="name" style=" padding:0 12px;" value="${hall.name}">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>座位数：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="seatCount"
									name="seatCount" style=" padding:0 12px;" value="${hall.seatCount}">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>影厅类型：</label> 
								<select class="form-control widthlonger " name="classify" id="classify"
										style=" padding:0 12px;width: 196px;">
										<option value="2D" <c:if test="${hall.classify=='2D'}">selected</c:if>>2D</option>
										<option value="3D" <c:if test="${hall.classify=='3D'}">selected</c:if>>3D</option>
										<option value="IMAX" <c:if test="${hall.classify=='IMAX'}">selected</c:if>>IMAX</option>
								</select>
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>状态：</label> 
									<select class="form-control widthlonger " name="flag" id="flag"
										style=" padding:0 12px;width: 196px;">
										<option value="1" <c:if test="${hall.flag=='1'}">selected</c:if>>启用</option>
										<option value="2" <c:if test="${hall.flag=='2'}">selected</c:if>>暂停使用</option>
									</select>
							</div>
						</div>

					</div>
					
					<div class="formgroup">
						<label class="font14 widthtextalignr">影厅位置：</label>
						<input class="form-control widthlonger" style="width:40%; padding-right:2%;" placeholder="请在此处输入..." id="addr"
									name="addr" style=" padding:0 12px;" value="${hall.addr}">
					</div>
					
					<div class="formgroup">
						<label class="font14 widthtextalignr">备注：</label>
						<textarea rows="3" name="remark" id="remark"
							class="form-control textareawidthlong bglightgrey">${hall.remark}</textarea>
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
