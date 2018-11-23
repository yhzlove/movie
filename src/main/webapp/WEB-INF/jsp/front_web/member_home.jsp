<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>个人资料</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet" />
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_img/font-awesome.4.6.0.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_img/amazeui.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_img/amazeui.cropper.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_img/custom_up_img.css">
	
	<style type="text/css">
		.up-img-cover {width: 100px;height: 100px;}
		.up-img-cover img{width: 100%;}
	</style>
	
	<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/home_img/amazeui.min.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/home_img/cropper.min.js" charset="utf-8"></script>
<!-- 	<script src="<%=request.getContextPath()%>/js/home_img/custom_up_img.js" charset="utf-8"></script> -->
	
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=request.getContextPath()%>">电影主页</a> 
            </div>
		<div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;"><a href="<%=request.getContextPath()%>/member/logout.do" class="btn btn-danger square-btn-adjust">退出</a> </div>
        </nav>   
        
		
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li><a href="<%=request.getContextPath()%>/member/update"  class="active-menu" >我的资料</a></li>
					<li><a href="<%=request.getContextPath()%>/order/member/list.do?memberId=${loginMember.id}"  >电影票</a></li>
					<li><a href="<%=request.getContextPath()%>/comment/member/list.do?memberId=${loginMember.id}">我的评论</a></li>
                </ul>
            </div>
        </nav>
        
        <div id="page-wrapper" >
            <div id="page-inner">
				<div class="row">
                    <div class="col-md-12">
                     <h2>个人资料</h2>   
                        <h5>欢迎${loginMember.realName}回来!</h5>                       
                    </div>
                </div>
				
				<hr />
				
				<div class="row">
					<div class="col-md-4">
<%-- 						<img src="assets/img/find_user.png" class="user-image img-responsive"/> --%>
						<center>
						<div class="up-img-cover"  id="up-img-touch" >
							<img class="am-circle" alt="点击图片上传" src="<%=request.getContextPath()%>/${loginMember.headImgUrl}" data-am-popover="{content: '点击上传', trigger: 'hover focus'}" >
						</div>
<%-- 						<div><a style="text-align: center; display: block;"  id="pic"></a></div> --%>
						</center>
					</div>
					<div class="col-md-8">
						
						<form action="<%=request.getContextPath()%>/member/update/${loginMember.id}" method="post">
							<input type="hidden" name="headImgUrl" id="pic" value="${loginMember.headImgUrl}"/>
							<div class="form-group">
								<label>用户名</label>
								<input class="form-control" placeholder="Disabled input" disabled value="${loginMember.userName}"/>    
							</div>
							<div class="form-group">
								<label>密码</label>
								<input class="form-control" name="password" value="${loginMember.password}"/>    
							</div>
							<div class="form-group">
								<label>用户昵称</label>
								<input class="form-control" name="realName" value="${loginMember.realName}" />
							</div>
							<div class="form-group">
								<label>邮箱</label>
								<input class="form-control" name="email" value="${loginMember.email}" />
							</div>
							<div class="form-group">
								<label>联系电话</label>
								<input class="form-control" name="tel" value="${loginMember.tel}" />
							</div>
							
							
							
							<button type="submit" class="btn btn-primary">确认修改</button>

						</form>
					<!--</div>-->
				</div>
			</div>
        </div>
        
     </div>
    
 <!-- /home_img  -->   
    <!--图片上传框-->
<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog up-frame-parent up-frame-radius">
	<div class="am-modal-hd up-frame-header">
	   <label>修改头像</label>
	  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	</div>
	<div class="am-modal-bd  up-frame-body">
	  <div class="am-g am-fl">
		<div class="am-form-group am-form-file">
		  <div class="am-fl">
			<button type="button" class="am-btn am-btn-default am-btn-sm">
			  <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
		  </div>
		  <input type="file" id="inputImage">
		</div>
	  </div>
	  <div class="am-g am-fl" >
		<div class="up-pre-before up-frame-radius">
			<img alt="" src="" id="image" >
		</div>
		<div class="up-pre-after up-frame-radius">
		</div>
	  </div>
	  <div class="am-g am-fl">
		<div class="up-control-btns">
			<span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
			<span class="am-icon-rotate-right" onclick="rotateimgright()"></span>
			<span class="am-icon-check" id="up-btn-ok" url="<%=request.getContextPath()%>/member/upload.do"></span>
		</div>
	  </div>
	  
	</div>
  </div>
</div>

<!--加载框-->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  <div class="am-modal-dialog">
	<div class="am-modal-hd">正在上传...</div>
	<div class="am-modal-bd">
	  <span class="am-icon-spinner am-icon-spin"></span>
	</div>
  </div>
</div>

<!--警告框-->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
	<div class="am-modal-hd">信息</div>
	<div class="am-modal-bd"  id="alert_content">
			  成功了
	</div>
	<div class="am-modal-footer">
	  <span class="am-modal-btn">确定</span>
	</div>
  </div>
</div>
 <!-- //home_img -->  
</body>
<script type="text/javascript">
$(document).ready(function(){
    $("#up-img-touch").click(function(){
    		  $("#doc-modal-1").modal({width:'600px'});
    });
});
$(function() {
'use strict';
// 初始化
var $image = $('#image');
$image.cropper({
    aspectRatio: '1',
    autoCropArea:0.8,
    preview: '.up-pre-after',
    
});

// 事件代理绑定事件
$('.docs-buttons').on('click', '[data-method]', function() {

    var $this = $(this);
    var data = $this.data();
    var result = $image.cropper(data.method, data.option, data.secondOption);
    switch (data.method) {
        case 'getCroppedCanvas':
        if (result) {
            // 显示 Modal
            $('#cropped-modal').modal().find('.am-modal-bd').html(result);
            $('#download').attr('href', result.toDataURL('image/jpeg'));
        }
        break;
    }
});



// 上传图片
var $inputImage = $('#inputImage');
var URL = window.URL || window.webkitURL;
var blobURL;

if (URL) {
    $inputImage.change(function () {
        var files = this.files;
        var file;

        if (files && files.length) {
           file = files[0];

           if (/^image\/\w+$/.test(file.type)) {
                blobURL = URL.createObjectURL(file);
                $image.one('built.cropper', function () {
                    // Revoke when load complete
                   URL.revokeObjectURL(blobURL);
                }).cropper('reset').cropper('replace', blobURL);
                $inputImage.val('');
            } else {
                window.alert('请选择图片文件.');
            }
        }

        // Amazi UI 上传文件显示代码
        var fileNames = '';
        $.each(this.files, function() {
            fileNames += '<span class="am-badge">' + this.name + '</span> ';
        });
        $('#file-list').html(fileNames);
    });
} else {
    $inputImage.prop('disabled', true).parent().addClass('disabled');
}

//绑定上传事件
$('#up-btn-ok').on('click',function(){
	var $modal = $('#my-modal-loading');
	var $modal_alert = $('#my-alert');
	var img_src=$image.attr("src");
	if(img_src==""){
		set_alert_info("没有选择上传的图片");
		$modal_alert.modal();
		return false;
	}
	
	$modal.modal();
	
	var url=$(this).attr("url");
	var canvas=$("#image").cropper('getCroppedCanvas');
	var data=canvas.toDataURL(); //转成base64
	console.log(data.toString())
    $.ajax( {  
            url:url,  
            dataType:'text',  
            type: "POST",  
            data: {"image":data.toString()},  
            success: function(data, status){
            	$modal.modal('close');
            	set_alert_info("保存成功!");
            	$modal_alert.modal();
            	
            		$("#up-img-touch img").attr("src",'${pageContext.request.contextPath}' + data);
            	
            		var img_name=data.split('/')[2];
            		console.log(img_name);
            		$("#pic").val(data);
            		
            },
            error: function(data, status, e){
            	$modal.modal('close');
            	set_alert_info("上传文件失败了！");
            	$modal_alert.modal();
            }  
     });  
	
});

});

function rotateimgright() {
$("#image").cropper('rotate', 90);
}


function rotateimgleft() {
$("#image").cropper('rotate', -90);
}

function set_alert_info(content){
$("#alert_content").html(content);
}
</script>
</html>
