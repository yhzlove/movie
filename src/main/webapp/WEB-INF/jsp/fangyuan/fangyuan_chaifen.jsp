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
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/ajaxfileupload.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/demo.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/check.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/handle.js"></script>
<script type="text/javascript">
			var Fields = "fjh_1;fjh_2;mj_1";
			var FieldsName = "房间号;房间号;建筑面积";
			var CheckType = "text;text;float";
			var Length = "20;20;20";
			var IsEmpty = "false;false;false";
</script>
<script type="text/javascript">
	$(function(){
      $("[name^='mj_']").on('keyup', function (event) {
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
		$("[name^='mj_']").on('blur', function () {
		    var $amountInput = $(this);
		    //最后一位是小数点的话，移除
		    $amountInput.val(($amountInput.val().replace(/\.$/g, "")));
		});
		
		
		
		
    });
	function load(elementId,img){
		$.ajaxFileUpload({
				url:'<%=request.getContextPath()%>/upload/upload.do?elementId='
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
				$('#imgShow_' + img).attr("src",
						'${pageContext.request.contextPath}' + data);
			},
			error : function(data, status, e) {
				alert(e);
				//alert(data+" error:  "+e);
			}

		})
		//return false;
	}
</script>

<title></title>

</head>

<body>

	<!---------------右侧------------------>
	<div class="right">
		<!--right start-->

		<div class="top">
			<!--top start-->
			<div class="position pullleft">
				<p>
					<span>当前位置：房源拆分</span>
				</p>
			</div>
			<div class="pullright overflowhidden">
				<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
			</div>
		</div>
		<!--top end-->


		<div class="right-ctn">
		<div class="bordernormal plr20">
			<form action="<%=request.getContextPath()%>/fangy/chaifen/${fangy.id }" method="post">
				<input type="hidden" name="lz" value="${fangy.lz }" />
				<input type="hidden" name="fjh" value="${fangy.fjh }" />
				<input type="hidden" name="hx" value="${fangy.hx }" />
				<input type="hidden" name="sb" value="${fangy.sb }" />
				<input type="hidden" name="zx" value="${fangy.zx }" />
				<input type="hidden" name="fwzt" value="1" />
				
				<label class="labelnormal">基本信息</label>
				<div class="height20"></div>
				<div class=" overflowhidden">
					<!--列 外框 start-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">楼座：</label> 
							<label class="font14 widthtextalignr" id="lz">${fangy.lz }</label> 
						</div>
					</div>
					<!---两列 end-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">房间号：</label> 
							<label class="font14 widthtextalignr">${fangy.fjh }</label>
						</div>
					</div>
					<!---两列 end-->

				</div>
				<!--列 外框 end-->


				<div class=" overflowhidden">
					<!--列 外框 start-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">建筑面积 ：</label>
							<label class="font14 widthtextalignr">${fangy.mj }</label>
						</div>
					</div>
					<!---两列 end-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">户型 ：</label>
							<label class="font14 widthtextalignr"><c:if test="${fangy.hx=='1'}">内环</c:if>
					              	<c:if test="${fangy.hx=='2'}">外环</c:if>
					              	<c:if test="${fangy.hx=='3'}">阳面</c:if>
					              	<c:if test="${fangy.hx=='4'}">阴面</c:if></label>
							
						</div>
					</div>
					<!---两列 end-->

				</div>
				<!--列 外框 end-->


				<div class=" overflowhidden">
					<!--列 外框 start-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">设备 ：</label>
							<label class="font14 widthtextalignr"><c:if test="${fangy.sb=='1'}">有中央空调</c:if>
                			<c:if test="${fangy.sb=='2'}">无中央空调</c:if></label>
							<!----overflowhidden end------>
						</div>
						<!-----formgroup end------->
					</div>
					<!---两列 end-->

					<div class="pullleft" style="width:48%; padding-right:2%;">
						<!---两列 start-->
						<div class="formgroup">
							<label class="font14 widthtextalignr">是否装修：</label>
							<label class="font14 widthtextalignr"><c:if test="${fangy.zx=='1'}">装修</c:if>
								<c:if test="${fangy.zx=='2'}">未装修</c:if>
							</label>
							<!----overflowhidden end------>
						</div>
					</div>
					<!---两列 end-->

				</div>
				<!--列 外框 end-->


				<div class="formgroup">
					<label class="font14 widthtextalignr">备注：</label>
					<textarea rows="3" name="bz" id="bz"
						class="form-control textareawidthlong bglightgrey" disabled="disabled">${fangy.bz }</textarea>
				</div>
				<!----formgroup end--------->
				<div class="height10"></div>
				<div class="height20"></div>
				<div style="border:1px dashed #e5e5e5;"></div>

				<div class="height20"></div>

				<label class="labelnormal">拆分房源</label>
				<div class="height20"></div>
				
				<div class=" overflowhidden"><!--列 外框 start-->
                
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr">房间号：</label>
                                        <input class="form-control widthlonger validator" placeholder="请在此处输入..." name="fjh_1" id="fjh_1" value="${fangy.fjh }-1" style=" padding:0 12px;">
                                    </div>
                              </div><!---两列 end-->
                              
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr">拆分面积：</label>
                                        <input class="form-control widthlonger" placeholder="请在此处输入..." name="mj_1" style=" padding:0 12px;">
                                    </div>
                              </div><!---两列 end-->
                              
                </div> <!--列 外框 end-->
                
                <div class=" overflowhidden"><!--列 外框 start-->
                
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr">房间号：</label>
                                        <input class="form-control widthlonger validator" placeholder="请在此处输入..." name="fjh_2" id="fjh_2" value="${fangy.fjh }-2" style=" padding:0 12px;">
                                    </div>
                              </div><!---两列 end-->
                              
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr">拆分面积：</label>
                                        <input class="form-control widthlonger" placeholder="请在此处输入..." name="mj_2" style=" padding:0 12px;">
                                    </div>
                              </div><!---两列 end-->
                              
                </div> <!--列 外框 end-->
				
				<div class="height20"></div>



				<div style="margin-left:20px;">
					<input type="button" class="btn btn-primary" value="提交" onclick="tj();" /> 
					<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回" />
				</div>
				<div class="height20"></div>
			</form>


		</div>
		<!--right-ctn end-->
</div>
	</div>
	<!--right end-->
</body>
<script type="text/javascript">
	$(function(){
		var mj = ${fangy.mj };
       $("input[name='mj_1']").change(function(){
       		var mj_1 = $(this).val();
       		if(mj_1<mj){
       			$("input[name='mj_2']").val((Number(mj-mj_1)).toFixed(2));
       		}else{
       			$(this).val("");
       			$("input[name='mj_2']").val("");
       			alert("大于总面积，请重新输入！");
       		}
       		
       });
       $("input[name='mj_2']").change(function(){
       		var mj_2 = $(this).val();
       		if(mj_2<mj){
       			$("input[name='mj_1']").val((Number(mj-mj_2)).toFixed(2));
       		}else{
       			$(this).val("");
       			$("input[name='mj_1']").val("");
       			alert("大于总面积，请重新输入！");
       		}
       });
       $(".validator").change(function () {
			validator();
			});
    });
    function tj(){
    	validator();
    	goform('upd');
    }
    function validator(){
    	var lz = $("#lz").text();
			var fjh_1 = $('#fjh_1').val();
			var fjh_2 = $('#fjh_2').val();
			if(fjh_1 ==fjh_2){
				 alert("相同楼座不能添加重复房间号!");
				  $('#fjh_2').val("");
			}
			if(fjh_1!=""){
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%=request.getContextPath()%>/fangy/validator",
                    data: {lz: lz,fjh: fjh_1},
					success: function (msg) {
                        if (msg != "") {
                            alert("相同楼座不能添加重复房间号!");
                            $('#fjh_1').val("");
                        }
                    },
                });
               }
               if(fjh_2!=""){
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%=request.getContextPath()%>/fangy/validator",
                    data: {lz: lz,fjh: fjh_2},
					success: function (msg) {
                        if (msg != "") {
                            alert("相同楼座不能添加重复房间号!");
                            $('#fjh_2').val("");
                        }
                    },
                });
               }
            
    }
</script>
</html>
