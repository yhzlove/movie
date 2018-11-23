<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<title></title>
<script type="text/javascript">
	$(function(){
       //上传图片
//        $("#btnUpload").click(function() {
//                load();
//        });
		$("input[name='fwzt']").click(function() {
              var fwzt = $("input[name='fwzt']:checked").val();
              if(fwzt==4){
              	$("#qcTime").show();
              }else{
              	$("#qcTime").hide();
              }
       	});
		
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
</head>

<body>

	<div class="right-ctn">
		<form action="<%=request.getContextPath()%>/fangy/update/${fangy.id}" method="post">
			<div class="formgroup">
				<!---formgroup start-->
				<input type="hidden" name="id" value='${fangy.id}' />
				<label class="labelnormal">楼座</label>
				<div class="overflowhidden">

					<input type='text' name="lz" value='${fangy.lz}' />
				</div>
				<label class="labelnormal">房间号</label>
				<div class="overflowhidden">

					<input type='text' name="fjh" value='${fangy.fjh}' />
				</div>
				<label class="labelnormal">建筑面积</label>
				<div class="overflowhidden">

					<input type='text' name="mj" value='${fangy.mj}' />
				</div>

				<label class="labelnormal">户型</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios1" value="1" <c:if test="${fangy.hx=='1'}">checked</c:if>>内环 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios2" value="2" <c:if test="${fangy.hx=='2'}">checked</c:if>>外环 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios3" value="3" <c:if test="${fangy.hx=='3'}">checked</c:if>>阳面 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios4" value="4" <c:if test="${fangy.hx=='4'}">checked</c:if>>阴面 </label>
					</div>
				</div>
			</div>
			<!---formgroup end-->


			<div class="formgroup">
				<!---formgroup start-->
				<label class="labelnormal">设备</label>
				<div class="overflowhidden">
					<div class="radio">
						<label> <input type="radio" name="sb"
							id="optionsRadios1" value="1" <c:if test="${fangy.sb=='1'}">checked</c:if>>有中央空调 </label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="sb"
							id="optionsRadios2" value="2" <c:if test="${fangy.sb=='2'}">checked</c:if>>无中央空调 </label>
					</div>

				</div>
				<label class="labelnormal">是否装修</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="zx"
							id="optionsRadios1" value="1" <c:if test="${fangy.zx=='1'}">checked</c:if>>装修 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="zx"
							id="optionsRadios2" value="2" <c:if test="${fangy.zx=='2'}">checked</c:if>>未装修 </label>
					</div>

				</div>
			</div>
			<!---formgroup end-->

			<div class="formgroup">
				<!---formgroup start-->
				<label class="labelnormal">房屋状态</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios1" value="1" <c:if test="${fangy.fwzt=='1'}">checked</c:if>>空置 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios2" value="2" <c:if test="${fangy.fwzt=='2'}">checked</c:if>>定置 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios3" value="3" <c:if test="${fangy.fwzt=='3'}">checked</c:if>>预留 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios4" value="4" <c:if test="${fangy.fwzt=='4'}">checked</c:if>>预退 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios5" value="5" <c:if test="${fangy.fwzt=='5'}">checked</c:if>>入住 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios6" value="6" <c:if test="${fangy.fwzt=='6'}">checked</c:if>>停用 </label>
					</div>
				</div>
				<div class="overflowhidden"  id="qcTime" <c:if test="${fangy.fwzt!='4'}">style="display:none;"</c:if> >			
					<div class="radio pullleft">
						<label> 预退时间：<input type='text'  name="qcTime" class="Wdate" onClick="WdatePicker()" value='<fmt:formatDate value="${fangy.qcTime}" pattern="yyyy-MM-dd" />'/> </label>
					</div>
				</div>
			</div>
			<div class="formgroup">
				<!---formgroup start-->
				<label class="labelnormal">备注</label>
				<div class="overflowhidden">
						<textarea  name="bz" cols="45" rows="5" class="add-inp2" id="textarea"></textarea>
				</div>

			</div>
			<!---formgroup end-->
			<br/>
			 
			<label class="labelnormal">平面图</label>
			<br />
			<input type="hidden" id="pmt" name="pmt"  value="${fangy.pmt}"/>
			<input type="file" id="img_pmt" name="img_pmt" value="浏览" onchange="load('img_pmt','pmt');"/>
			<br />
			<img id="imgShow_pmt" src="<%=request.getContextPath()%>${fangy.pmt}" alt="平面图"  width='252' height='162' src=""/>
			<br />
			
			<br /> <label class="labelnormal"> 房屋装修图</label>
			<br />
			<input type="hidden" id="fwzxt" name="fwzxt"  value="${fangy.fwzxt}"/>
			<input type="file" id="img_fwzxt" name="img_fwzxt" value="浏览" onchange="load('img_fwzxt','fwzxt');"/>
			<br />
			<img id="imgShow_fwzxt" src="<%=request.getContextPath()%>${fangy.fwzxt}" alt="房屋装修图"  width='252' height='162' src=""/>
			
			<br /> 
			<label class="labelnormal"> 实物图1</label> 
			<br />
			<input type="hidden" id="swt1" name="swt1" value="${fangy.swt1}" />
			<input type="file" id="img_swt1" name="img_swt1" value="浏览" onchange="load('img_swt1','swt1');"/>
			<br />
			<img id="imgShow_swt1" src="<%=request.getContextPath()%>${fangy.swt1}"  alt="实物图"  width='252' height='162' src=""/>
			<br /> 
			
			<label class="labelnormal"> 实物图2</label> 
			<br />
			<input type="hidden" id="swt2" name="swt2"  value="${fangy.swt2}"/>
			<input type="file" id="img_swt2" name="img_swt2" value="浏览" onchange="load('img_swt2','swt2');"/>
			<br />
			<img id="imgShow_swt2" src="<%=request.getContextPath()%>${fangy.swt2}" alt="实物图"  width='252' height='162' src=""/>
			<br />
			
			<label class="labelnormal"> 实物图3</label> 
			<br />
			<input type="hidden" id="swt3" name="swt3"  value="${fangy.swt3}"/>
			<input type="file" id="img_swt3" name="img_swt3" value="浏览" onchange="load('img_swt3','swt3')"/>
			<br />
			<img id="imgShow_swt3" src="<%=request.getContextPath()%>${fangy.swt3}" alt="实物图"  width='252' height='162' src=""/>
			<br />





			<div>
				<input type="submit" class="btn btn-default" value="提交" /> 
				<input type="button" class="btn btn-default" onclick="javascript:history.go(-1);" value="返回" />
			</div>






		</form>
	</div>
	<!--right-ctn end-->
</body>
</html>
