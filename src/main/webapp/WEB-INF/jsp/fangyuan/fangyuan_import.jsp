<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
<link href="<%=request.getContextPath()%>/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.js"></script>

<title>导入excel</title>
<style type="text/css">
.STYLE1 {font-size: 18px}
.STYLE2 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}

</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	//用户显示导入成功的弹窗
	boolean bool = false;
%>

<body>
	<div class="right">
		<!--right start-->

		<div class="top">
			<!--top start-->
			<div class="position pullleft">
				<p>
					<span>当前位置：房源信息导入</span>
				</p>
			</div>
			<div class="pullright overflowhidden">
				<input type="button" class="btn btn-default" value="返回"
					onclick="javascript:history.go(-1);" value="返回" />
			</div>
		</div>
		<!--top end-->
		<form id="importform" style="padding: 20px;" action="<%=request.getContextPath()%>/fangy/doImport" method="post" enctype="multipart/form-data">
			<center>
				<table style="background-color:#efefef;" width="550">
					<tr style="background-color:#d6e6f5;height:40px;">
						<td style="padding-left:20px;">下载EXCEL模板</td>
					</tr>
					<tr style="height:60px;">
						<td align="center">
							<a href="<%=request.getContextPath()%>/fangy/doImport_temp" id="down" style="font-size:25px;">下载模板</a>
						</td>
					</tr>

					<tr style="background-color:#d6e6f5;height:40px;">
						<td style="padding-left:20px;">请选择EXCEL文件</td>
					</tr>
					<tr style="height:60px;">
						<td align="center">
						<input class="null" style="margin-left:10px;" type="file" name="excel"  accept="xls"></td>
					</tr>


					<tr style="background-color:#d6e6f5;height:40px;">
						<td align="center">
							<input type="button" class="btn btn-primary" id="btn" value="确认导入"> <!-- 返回按钮 -->
						</td>
					</tr>
					<tr style="padding:0px;">
						<td style="padding:20px;">
							<div style="height:150px;margin:0px;overflow:auto;color:red;">
								<c:forEach items="${list_info}" var="u"  varStatus="status">
									${u}<br/>
								</c:forEach>	
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
		
	</div>
	<script type="text/javascript">
		$(function() {
			$("#btn").click(function() {
					$("#importform").submit();
			});
			$("#fh").click(function() {
				parent.removeJumpWindow();

			});
			
		});
	</script>
</body>
</html>