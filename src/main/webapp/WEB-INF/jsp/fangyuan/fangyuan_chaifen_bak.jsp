<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/css.css" />
	<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/ajaxfileupload.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
       //上传图片
//        $("#btnUpload").click(function() {
//                load();
//        });
    });
	function load(elementId,img){
		$.ajaxFileUpload({
				url:'<%=request.getContextPath()%>/upload/upload.do?elementId='+elementId+'&imge='+img,
				secureuri:false,
				fileElementId:elementId,//文件上传控件的id属性  <input type="file" id="upload" name="upload" />
				dataType: 'text',
				success: function (data, status)
				{
             		var start = data.indexOf(">");
             		if(start != -1) {  
                 		var end = data.indexOf("<", start + 1);  
                 		if(end != -1) {  
                     		data = data.substring(start + 1, end);  
                 		}
                 	}
                 	$('#'+img).val(data);
					$('#imgShow_'+img).attr("src", '${pageContext.request.contextPath}'+data);
				},
				error: function (data, status, e)
				{
					alert(e);
					//alert(data+" error:  "+e);
				}
				
			}
		)
		//return false;
}

</script>

<title></title>

</head>

<body>
	<form action="<%=request.getContextPath()%>/fangy/chaifen/${fangy.id }" method="post">
		<input type="hidden" name="lz" value="${fangy.lz }" />
		<input type="hidden" name="fjh" value="${fangy.fjh }" />
		<input type="hidden" name="hx" value="${fangy.hx }" />
		<input type="hidden" name="sb" value="${fangy.sb }" />
		<input type="hidden" name="fwzt" value="1" />
		<table class="add-tab" style="width: auto;margin: 0;border-collapse:collapse;margin:40px;" border="1" >
		  
		  <tr>
		    <td  align="right">楼座：</td>
		    <td >${fangy.lz }</td>
			<td  align="right" >房间号：</td>
		    <td >${fangy.fjh }</td>
		  </tr>
		  <tr class="everyline">
		    <td align="right">建筑面积：</td>
		    <td>${fangy.mj }</td>
			<td align="right">户型：</td>
		    <td><c:if test="${fangy.hx=='1'}">内环</c:if>
              	<c:if test="${fangy.hx=='2'}">外环</c:if>
              	<c:if test="${fangy.hx=='3'}">阳面</c:if>
              	<c:if test="${fangy.hx=='4'}">阴面</c:if>
             </td>
		  </tr>
		  <tr>
		   
			<td align="right">设备：</td>
		    <td><c:if test="${fangy.sb=='1'}">有中央空调</c:if>
                <c:if test="${fangy.sb=='2'}">无中央空调</c:if></td>
			<td align="right">房屋状态：</td>
		    <td><c:if test="${fangy.fwzt=='1'}">空置</c:if>
               	</td>
		  </tr>
		  <tr class="everyline">
		    <td align="right">房间号：</td>
		    <td><input type="text" name="fjh_1"  style="width:100%;height:100%;"/></td>
			<td align="right">拆分面积：</td>
		    <td><input type="text" name="mj_1"  style="width:100%;height:100%;"/></td>
		  </tr>
		  <tr >
		    <td align="right">房间号：</td>
		    <td><input type="text" name="fjh_2"  style="width:100%;height:100%;"/></td>
			<td align="right">拆分面积：</td>
		    <td><input type="text" name="mj_2"  style="width:100%;height:100%;"/></td>
		  </tr>
		  
		  <tr>
		    
		    <td colspan="4"><span class=" overflowhidden STYLE1">
		      <input type="submit"btn-primary STYLE2"  value="提交" />
		      <input type="button" class="btn-primary STYLE2" onclick="javascript:history.go(-1);" value="返回" />
		    </span>
			</td>
		  </tr>
		</table>
	</form>
  
  
  
</body>
<script type="text/javascript">
	$(function(){
		var mj = ${fangy.mj };
       $("input[name='mj_1']").change(function(){
       		var mj_1 = $(this).val();
       		if(mj_1<mj){
       			$("input[name='mj_2']").val(mj-mj_1);
       		}else{
       			$(this).val("");
       			alert("大于总面积，请重新输入！");
       		}
       		
       });
       $("input[name='mj_2']").change(function(){
       		var mj_2 = $(this).val();
       		if(mj_2<mj){
       			$("input[name='mj_1']").val(mj-mj_2);
       		}else{
       			$(this).val("");
       			alert("大于总面积，请重新输入！");
       		}
       });
    });
</script>
</html>
