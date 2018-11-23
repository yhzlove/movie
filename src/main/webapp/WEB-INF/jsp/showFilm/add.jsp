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
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/check.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/handle.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
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
					<span class="STYLE1">场次安排管理--添加</span>
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
				<form action="<%=request.getContextPath()%>/showFilm/back/add" method="post" >
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					<input type="hidden" name="movie.id" value="${movie.id }">
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>电影：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." 
									 style=" padding:0 12px;" readonly="readonly" value="${movie.movieName}">
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>影厅：</label> 
<!-- 									<input class="form-control widthlonger" placeholder="请在此处输入..." id="price" -->
<!-- 									name="price" style=" padding:0 12px;"> -->
									<select name="hall.id" class="form-control widthlonger bglightgrey">
								 		<!-- <option>请选择</option>  -->
								   		<c:forEach items="${hallList}" var="h">
								   			<option value="${h.id}">${h.name}</option>
									   </c:forEach>
								   	</select>
							</div>
						</div>

					</div>
					
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>开始时间：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="startTime"
									name="startTime" style=" padding:0 12px;" readonly="readonly" onchange="endDate(this);"
									class="input_text Wdate" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d+1}',
<!-- 										onpicked:pickedFunc()  -->
										})"
									>
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>结束时间：</label> 
								<input class="form-control widthlonger" placeholder="自动生成" id="endTime"
									 name="endTime" style=" padding:0 12px;" readonly="readonly">
							</div>
						</div>

					</div>
					
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>场次名称：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="showFilmName"
									name="showFilmName" style=" padding:0 12px;">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>价格：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="price"
									name="price" style=" padding:0 12px;">
							</div>
						</div>

					</div>
					
					<div class=" overflowhidden">
						
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>状态：</label> 
									<select class="form-control widthlonger " name="flag" id="flag"
										style=" padding:0 12px;width: 196px;">
										<option value="1">启用</option>
										<option value="2">暂停使用</option>
									</select>
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
<script type="text/javascript">
//$dp.$DV($dp.cal.getNewDateStr,{M:-3,d:-2})
//function() {$('#endTime').val();console.log($dp.$DV($dp.cal.getNewDateStr,{M:-3,d:-2}));alert(123);}
//第二种    才有这种方式
function pickedFunc(dateObject){
	var star = $('#startTime').val();
	dateObject = $dp.$DV(star,{M:-3,d:-2});
	console.log(dateObject);
	var y = dateObject.y;
	var M = dateObject.M<10?"0"+dateObject.M:dateObject.M;
	var d = dateObject.d<10?"0"+dateObject.d:dateObject.d;
	var H = dateObject.H<10?"0"+dateObject.H:dateObject.H;
	var m = dateObject.m<10?"0"+dateObject.m:dateObject.m;
	
	$("#endTime").val(y+"-"+M+"-"+d+" "+H+":"+m);
}

//第一种 
function endDate(_this){
	var star = $(_this).val();
	var length = ${movie.length};//1分钟
	var t = new Date(star);
	var t_s=t.getTime();//转化为时间戳毫秒数
	var nt=new Date();//定义一个新时间
	   nt.setTime(t_s+1000*60*length);
	
	   var M = (nt.getMonth()+1)<10?("0"+(nt.getMonth()+1)):(nt.getMonth()+1);
	   var d = nt.getDate()<10?("0"+nt.getDate()):nt.getDate();
	   var H = nt.getHours()<10?("0"+nt.getHours()):nt.getHours();
	   var m = nt.getMinutes()<10?("0"+nt.getMinutes()):nt.getMinutes();
	$("#endTime").val(nt.getFullYear()+"-"+M+"-"+d+" "+H+":"+m);
}
</script>
</html>
