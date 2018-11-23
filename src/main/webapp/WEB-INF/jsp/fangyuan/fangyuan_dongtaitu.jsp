<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/css.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.ganttView.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/date.js"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ganttView.js" charset="UTF-8"></script>

<title></title>
<style type="text/css">

.STYLE1 {font-size: 18px}
.STYLE2 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE3 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE4 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE5 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}

</style>

</head>
<body>
<div class="right"><!--right start-->
<div class="top"><!--top start-->
            <div class="position pullleft">
                <p><span>当前位置：房屋动态情况图</span></p>
            </div>
            <div class="pullright overflowhidden" style="margin-top: 4px;">
            <form action="<%=request.getContextPath()%>/fangy/dongtaitu.do" method="post">
	        	<label>楼座：</label>
	        	<select name="lz" class="inputnormal  mr10 bglightgrey">
<!-- 					<option value="">请选择</option> -->
					<option value="A"
						<c:if test="${lz=='A'}"> selected="selected"</c:if>>A座</option>
					<option value="B"
						<c:if test="${lz=='B'}"> selected="selected"</c:if>>B座</option>
					<option value="C"
						<c:if test="${lz=='C'}"> selected="selected"</c:if>>C座</option>
					<option value="D"
						<c:if test="${lz=='D'}"> selected="selected"</c:if>>D座</option>
					<option value="E"
						<c:if test="${lz=='E'}"> selected="selected"</c:if>>E座</option>
					<option value="F"
						<c:if test="${lz=='F'}"> selected="selected"</c:if>>F座</option>
					<option value="大厦"
						<c:if test="${lz=='大厦'}"> selected="selected"</c:if>>大厦</option>
				</select>
	        	<label>截止时间：</label>
	        	<input type="text" id="time" name="time" value='${time}' onClick="WdatePicker({dateFmt:'yyyy-MM'})"  class=" inputnormal mlr5 bglightgrey" style="width: 100px;"/>
	         
				<input type="submit" class="btn-primary STYLE2"  value="动态情况图" />
				<input type="button" class="btn btn-default" style="margin-top: 0px;" value="返回" onclick="javascript:window.location.href='<%=request.getContextPath()%>/fangy/list_select.do'" value="返回"/>
			</form>
              	
            </div>
        </div><!--top end-->



<h2 align="center">房屋动态情况图</h2>
	<div id="ganttChart" ></div>
</div>
	<script type="text/javascript">
	function dt(){
		var endTime = $("#endTime").val();
// 		if(endTime!=null&&endTime!=""){
// 			$.ajax({  
//                 url:"<%=request.getContextPath()%>/fangy/dongtaitu2.do",  
//                 type:"post",
//                 data:"endTime="+endTime,  
//                 success:function(data){
//                 	alert(data)
//                  alert("userName--->" + data.userName + "age--->" + data.age );  
//                     var ganttData =  data
//                 }  
//             }); 
			window.location.href='<%=request.getContextPath()%>/fangy/dongtaitu?endTime='+endTime;
// 		}
		
	}
	var ganttData = [
	<c:forEach items="${glist}" var="u"  varStatus="status">
		{
			id: '${u.id}', name: '${u.name}', series: [
				{ name: '${u.fjh}',block:[
					<c:forEach items="${u.seriesList}" var="m"  varStatus="statum">
						{gs: '${m.gs}', start: new Date('${m.start}'.replace(/-/g,"/")), end: new Date('${m.end}'.replace(/-/g,"/")) ,color:'${m.color}'},
					</c:forEach>
					]
				}
			]
		},
	</c:forEach>
	
	];
		$(function () {
			var str1 = '${starTime}';
			var str2 = '${endTime}';
			$("#ganttChart").ganttView({ 
				data: ganttData,
				start: new Date(str1.replace(/-/g,"/")),
				end: new Date(str2.replace(/-/g,"/")),
				slideWidth: 1100
			});
		});
	</script>
</body>
</html>
