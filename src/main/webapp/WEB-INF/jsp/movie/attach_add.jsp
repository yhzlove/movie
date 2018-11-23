<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css"/>
<link href="<%=request.getContextPath()%>/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.js"></script>  
 
<title></title>
<style type="text/css">
.STYLE1 {font-size: 18px}
.STYLE2 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE3 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE4 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE5 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.uploadify-button {
        background-color: transparent;
        border: none;
        padding: 0;
    }
    .uploadify:hover .uploadify-button {
        background-color: transparent;
    }
	
</style>
</head>

<body>
<div class="right"><!--right start-->

        <div class="top"><!--top start-->
            <div class="position pullleft">
                <p><span>当前位置：电影附件上传</span></p>
            </div>
            <div class="pullright overflowhidden">
              	<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
            </div>
        </div><!--top end-->
    <div class="right-ctn">
                <div class="height20"></div> 
                <div class=" overflowhidden"><!--列 外框 start-->
  <div id="fileQueue"></div>
  <input type="file" name="uploadify" id="uploadify"/>
  <!-- 多个文件不间断上传，也就是只点击一次上传 -->
  <div style="margin-left:20px;">
		<input type="button" class="btn btn-primary" value="上传" onclick="javascript:$('#uploadify').uploadify('upload','*')"/> 
<!-- 		<input type="button" class="btn btn-default"  onclick="javascript:history.go(-1);" value="返回" /> -->
	</div>
<!--   <input type="button" value="上传文件" class="btn btn-primary" onclick="javascript:$('#uploadify').uploadify('upload','*')"> -->
<!--   <p><a href="javascript:$('#uploadify').uploadify('upload','*')">上传文件</a></p> -->
	<!-- 一个个文件上传 -->
<!--   <p><a href="javascript:$('#uploadify').uploadify('upload')">上传文件</a></p> -->
  </div>
  </div>
  </div>
</body>
<script type="text/javascript">  
$(document).ready(function() {  
     $("#uploadify").uploadify({
     	'buttonText' : '选择文件',
     	'auto'     : false,
        'swf'           : '<%=request.getContextPath()%>/js/uploadify/uploadify.swf',
        'uploader'      : '<%=request.getContextPath()%>/upload/movie_attach/${movie.id}',
        'simUploadLimit':10,
        'multi '		:true,
        //完成时是否清除队列 默认true  
        'removeCompleted': false,               
        //完成时清除队列显示秒数,默认3秒 
        //'removeTimeout': 1,                   
        //队列上传出错，是否继续回滚队列
        'requeueErrors': false,                
        //上传超时 
        'successTimeout': 5,     
    });
});  
</script> 
</html>
