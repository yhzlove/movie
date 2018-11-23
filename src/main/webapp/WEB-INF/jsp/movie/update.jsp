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
<script src="<%=request.getContextPath()%>/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/video/css/video-js.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/video/js/video.min.js"></script>    

<style>
	.m{ width: 640px; height: 264; margin-left: auto; margin-right: auto; margin-top: 100px; }
</style>
<title></title>
<style type="text/css">
.STYLE1 {
	font-size: 18px
}
</style>
<style type="text/css">
.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
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
					<span class="STYLE1">电影管理--修改</span>
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
				<form action="<%=request.getContextPath()%>/movie/back/update/${movie.id}" method="post"
					　enctype="multipart/form-data">
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					
					<input type="hidden" name="id" value="${movie.id}">
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>电影名称：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="movieName"
									name="movieName" style=" padding:0 12px;" value="${movie.movieName}" >
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>看点：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="shortName"
									name="shortName" style=" padding:0 12px;" value="${movie.shortName}">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>导演：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="director"
									name="director" style=" padding:0 12px;" value="${movie.director}">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>演员：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="actor"
									name="actor" style=" padding:0 12px;" value="${movie.actor}" >
							</div>
						</div>

					</div>
					
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>类别：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="category"
									name="category" style=" padding:0 12px;" value="${movie.category}">
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>状态：</label> 
									<select class="form-control widthlonger " name="flag" id="flag"
										style=" padding:0 12px;width: 196px;">
										<option value="1"  <c:if test="${movie.flag=='1'}">selected</c:if>>上映</option>
										<option value="2"  <c:if test="${movie.flag=='2'}">selected</c:if>>未上映</option>
										<option value="3"  <c:if test="${movie.flag=='3'}">selected</c:if>>停映</option>
									</select>
							</div>
						</div>
					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>上映日期：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="showTime"
								class="input_text Wdate" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}'})"
									name="showTime" style=" padding:0 12px;" readonly="readonly" value="<fmt:formatDate value="${movie.showTime}" pattern="yyyy-MM-dd" />">
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>评分：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="starRating"
									name="starRating" style=" padding:0 12px;"  value="${movie.starRating}">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>时长：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="length"
									name="length" style=" padding:0 12px;" value="${movie.length}" >
							</div>
						</div>
					</div>
					<div class="formgroup">
						<label class="font14 widthtextalignr">剧情：</label>
						<textarea rows="3" name="storyLine" id="storyLine"
							class="form-control textareawidthlong bglightgrey">${movie.storyLine}</textarea>
					</div>
					<div class="formgroup">
						<label class="font14 widthtextalignr">备注：</label>
						<textarea rows="3" name="remark" id="remark"
							class="form-control textareawidthlong bglightgrey">${movie.remark}</textarea>
					</div>
					
					<!----formgroup end--------->
					<div class="height10"></div>
					<div style="border:1px dashed #e5e5e5;"></div>

					<label class="labelnormal">图像信息</label>
					<div class="height20"></div>

					<div class=" overflowhidden">
						<!--列 外框 start-->

						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">海报：</label> 
								<input type="hidden" id="pmt" name="imgUrl" value="${movie.imgUrl}"/> 
								<a href="javascript:;" class="file">选择文件 
									<input class="inputfilenormal font14" type="file" id="img_pmt" name="img_pmt"
									onchange="load('img_pmt','pmt');"> </a>
								<div id="preview" class="preview">
									<img id="imgShow_pmt" alt="" width='252' height='162' onerror="this.src='<%=request.getContextPath()%>/images/picture_default.png'"
										src="<%=request.getContextPath()%>/${movie.imgUrl}" />
								</div>
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>海报展示：</label> 
									<select class="form-control widthlonger " name="imgHead" id="imgHead"
										style=" padding:0 12px;width: 196px;">
										<option value="2" <c:if test="${movie.imgHead=='2'}">selected</c:if>>不展示</option>
										<option value="1" <c:if test="${movie.imgHead=='1'}">selected</c:if>>展示</option>
									</select>
							</div>
						</div>

					</div>
					<!--列 外框 end-->
					<div class=" overflowhidden">
						<!--列 外框 start-->

						<div class="pullleft" style="width:96%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup" id="videoDiv">
								<label class="font14 widthtextalignr">视频：</label> 
								<input type="hidden" id="video" name="videoUrl" value="${movie.videoUrl}"/> 
								<a href="javascript:;" class="file">选择文件 
									<input class="inputfilenormal font14" type="file" id="img_video" name="img_video"
									onchange="load('img_video','video',1);"> </a>
<!-- 								<div id="preview" class="preview"> -->
<!-- 									<img id="imgShow_video" alt="" width='252' height='162' -->
<!-- 										src="<%=request.getContextPath()%>/images/picture_default.png" /> -->
<!-- 								</div> -->
								
							</div>
						</div>
						

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
	$(function(){
		/*
		$("#amount").on('keyup', function (event) {
		    var $amountInput = $(this);
		    //响应鼠标事件，允许左右方向键移动 
		    event = window.event || event;
		    if (event.keyCode == 37 | event.keyCode == 39) {
		        return;
		    }
		    //先把非数字的都替换掉，除了数字和. 
		    $amountInput.val($amountInput.val().replace(/[^\d.]/g, "").
		        //只允许一个小数点              
		        replace(/^\./g, "").replace(/\.{2,}/g, ".").
		        //只能输入小数点后两位
		        replace(".", "$#$").replace(/\./g, "").replace("$#$", ".").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));
		            });
		$("#amount").on('blur', function () {
		    var $amountInput = $(this);
		    //最后一位是小数点的话，移除
		    $amountInput.val(($amountInput.val().replace(/\.$/g, "")));
		});
		*/
		$(".validator").blur(function () {
			var lz = $('#select option:selected').val();
			var fjh = $('#fjh').val();
			if(fjh!=""){
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/fangy/validator",
                   // "Handler.ashx?NewsAdd=1&txtName=" + encodeURIComponent($(this).val()) + "",
                    data: {lz: lz,fjh: fjh},
					success: function (msg) {
                        if (msg != "") {
                            alert("相同楼座不能添加重复房间号!");
                             $('#fjh').val("");
                        }
                    },
                    //onerror: function () { alert("error") }
                });
               }
            });
		
            /* $("#lc").blur(function(){
            	var lc = $("#lc").val();
            	var type = "^[0-9]*[1-9][0-9]*$"; 
            	if(lc.match(type)){
            		//alert("通过");
            	}else{
            		alert("请输入整数");
            		$("#lc").val("");
            	}
            }); */
    });
	function load(elementId,img,video){
		$.ajaxFileUpload({
			url:'<%=request.getContextPath()%>/upload/back/upload.do?elementId='
					+ elementId + '&imge=' + img,
			secureuri : false,
			fileElementId : elementId,//文件上传控件的id属性  <input type="file" id="upload" name="upload" />
			dataType : 'text',
			success : function(data, status) {
				var start = data.indexOf(">");
				if (start != -1) {
					var end = data.indexOf("<", start + 1);
					if (end != -1) {
						data = data.substring(start + 1, end);
					}
				}
				$('#' + img).val(data);
				if(video){//添加视频文件
					$("#videoDiv").append(" <div class='m'>"+
												"<video id='my-video' class='video-js' controls preload='auto' width='640' height='264'"+
												"poster='' data-setup='{}'>"+
												"	<source id='imgShow_video' src="+'${pageContext.request.contextPath}' + data+" type='video/mp4'>"+
												"</video>"+
											"</div>"
										);
					play();
				}else{//图片
					$('#imgShow_' + img).attr("src", '${pageContext.request.contextPath}' + data);
				}
					
			},
			error : function(data, status, e) {
			}

		})
		//return false;
	}
</script>
<script type="text/javascript">
function play(){
	var myPlayer = videojs('my-video');
	videojs("my-video").ready(function(){
		var myPlayer = this;
		myPlayer.play();
	});
}
</script>

</html>
