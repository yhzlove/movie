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

	<div class="right-ctn">
		<form action="<%=request.getContextPath()%>/fangy/add" method="post"　enctype="multipart/form-data">
			<div class="formgroup">
				<!---formgroup start-->
				<label class="labelnormal">楼座</label>
				<div class="overflowhidden">

					<input type='text' name="lz" value='' />
				</div>
				<label class="labelnormal">房间号</label>
				<div class="overflowhidden">

					<input type='text' name="fjh" value='' />
				</div>
				<label class="labelnormal">建筑面积</label>
				<div class="overflowhidden">

					<input type='text' name="mj" value='' />
				</div>

				<label class="labelnormal">户型</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios1" value="1" checked>内环 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios2" value="2">外环 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios3" value="3">阳面 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="hx"
							id="optionsRadios4" value="4">阴面 </label>
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
							id="optionsRadios1" value="1" checked>有中央空调 </label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="sb"
							id="optionsRadios2" value="2">无中央空调 </label>
					</div>

				</div>
				<label class="labelnormal">是否装修</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="zx"
							id="optionsRadios1" value="1" checked>装修 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="zx"
							id="optionsRadios2" value="2">未装修 </label>
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

			<div class="formgroup">
				<!---formgroup start-->
				<label class="labelnormal">房屋状态</label>
				<div class="overflowhidden">
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios1" value="1" checked>空置 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios2" value="2">定置 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios3" value="3">预留 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios4" value="4">预退 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios5" value="5">入住 </label>
					</div>
					<div class="radio pullleft">
						<label> <input type="radio" name="fwzt"
							id="optionsRadios6" value="6">停用 </label>
					</div>
				</div>
			</div>
			<!---formgroup end-->
			<br/>
			 
			<label class="labelnormal">平面图</label>
			<br/>
			<input type="hidden" id="pmt" name="pmt"  />
			<input type="file" id="img_pmt" name="img_pmt" value="浏览" onchange="load('img_pmt','pmt');"/><br/>
			<img id="imgShow_pmt"  alt=""  width='252' height='162' src=""/>
			<br />
			
			<br /> <label class="labelnormal"> 房屋装修图</label>
			<br /> 
			<input type="hidden" id="fwzxt" name="fwzxt"  />
			<input type="file" id="img_fwzxt" name="img_fwzxt" value="浏览" onchange="load('img_fwzxt','fwzxt');"/><br/>
			<img id="imgShow_fwzxt"  alt=""  width='252' height='162' src=""/>
			
			<br /> 
			<label class="labelnormal"> 实物图1</label> 
			<br /> 
			<input type="hidden" id="swt1" name="swt1"  />
			<input type="file" id="img_swt1" name="img_swt1" value="浏览" onchange="load('img_swt1','swt1');"/><br/>
			<img id="imgShow_swt1"  alt=""  width='252' height='162' src=""/>
			<br /> 
			
			<label class="labelnormal"> 实物图2</label> <br /> 
			
			<input type="hidden" id="swt2" name="swt2"  />
			<input type="file" id="img_swt2" name="img_swt2" value="浏览" onchange="load('img_swt2','swt2');"/><br/>
			<img id="imgShow_swt2"  alt=""  width='252' height='162' src=""/>
			<br />
			
			<label class="labelnormal"> 实物图3</label> <br /> 
			
			<input type="hidden" id="swt3" name="swt3"  />
			<input type="file" id="img_swt3" name="img_swt3" value="浏览" onchange="load('img_swt3','swt3');"/><br/>
			<img id="imgShow_swt3"  alt=""  width='252' height='162' src=""/>
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
