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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/handle.js"></script>
	<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
			var Fields = "lc;fjh;mj;bz";
			var FieldsName = "楼层;房间号;建筑面积;备注";
			var CheckType = "int;text;float;text";
			var Length = "8;20;20;200";
			var IsEmpty = "false;false;false;true";
</script>
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
<script type="text/javascript">
	$(function(){
       $("input[name='fwzt']").click(function() {
              var fwzt = $("input[name='fwzt']:checked").val();
              if(fwzt==4){
              	$("[name='qcTime']").removeAttr("disabled"); 
              	$("#qcTime").show();
              }else{
              	$("#qcTime").hide();
              }
       	});
       	var status = ${fangy.fwzt};
       	if(status=='5'){
//        		$("input[name!='fwzt'][type!='button']").attr("readonly","readonly");
//        		$("textarea").attr("readonly","readonly");

       		$("input[name!='fwzt'][type!='button']").attr("disabled",true); 
       		$("textarea").attr("readonly","readonly");
       		$("select").attr("disabled",true); 
       	}
       	$("#sub").click(function(){
       	 
       		
       		var fwzt = $("input[name='fwzt']:checked").val();
       		if(fwzt==4){
              	if($("[name='qcTime']").val()==''){
              		alert("请选择预退时间！");
              		return false;
              	}
             }else{
             	$("[name='qcTime']").val("");
             }
       		$("input[name!='fwzt'][type!='button']").removeAttr("disabled"); 
       		$("select").removeAttr("disabled"); 
       		goform('upd');
       	});
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
		
		$(".validator").change(function () {
			var lz = $('#select option:selected').val();
			var fjh = $('#fjh').val();
			var fjhy=document.getElementById("fjhy").value;
			if(fjh != fjhy){
				if(fjh!=""){
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/fangy/validator",
                   // "Handler.ashx?NewsAdd=1&txtName=" + encodeURIComponent($(this).val()) + "",
                    data: {lz: lz,fjh: fjh},
					success: function (msg) {
                        if (msg != "") {
                            //flag = false;
                            alert("相同楼座不能添加重复房间号!");
                            $('#fjh').val("");
                            //return false;
                        }
                    }
                    //onerror: function () { alert("error") }
                });
               }
			}
			
            });
		//
		$("#lc").blur(function(){
            	var lc = $("#lc").val();
            	var type = "^[0-9]*[1-9][0-9]*$"; 
            	if(lc.match(type)){
            		//alert("通过");
            	}else{
            		alert("请输入整数");
            		$("#lc").val("");
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

<title></title>

</head>

<body>

	<!---------------右侧------------------>    
<div class="right"><!--right start-->

        <div class="top"><!--top start-->
            <div class="position pullleft">
                <p><span>当前位置：修改房源</span></p>
            </div>
            <div class="pullright overflowhidden">
              	<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
            </div>
        </div><!--top end-->

                
        <div class="right-ctn">
        	<div class="bordernormal plr20">
        	<form action="<%=request.getContextPath()%>/fangy/update/${fangy.id}" method="post"　enctype="multipart/form-data">
        		<input type="hidden" name="id" value='${fangy.id}' />
        		<label class="labelnormal">基本信息</label>
                <div class="height20"></div> 
                <div class=" overflowhidden"><!--列 外框 start-->
                			
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>楼座：</label>
                                        <select class="form-control widthlonger" name="lz" id="select" style=" padding:0 12px;width: 196px;">
                                        	<option value="A" <c:if test="${fangy.lz=='A'}">selected</c:if> >A座</option>
                                        	<option value="B" <c:if test="${fangy.lz=='B'}">selected</c:if>>B座</option>
                                        	<option value="C" <c:if test="${fangy.lz=='C'}">selected</c:if>>C座</option>
                                        	<option value="D" <c:if test="${fangy.lz=='D'}">selected</c:if>>D座</option>
                                        	<option value="E" <c:if test="${fangy.lz=='E'}">selected</c:if>>E座</option>
                                        	<option value="F" <c:if test="${fangy.lz=='F'}">selected</c:if>>F座</option>
                                        	<option value="大厦" <c:if test="${fangy.lz=='大厦'}">selected</c:if>>大厦</option>
                                        </select>
                                    </div>
                              </div><!---两列 end-->
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>楼层：</label>
                                        <input class="form-control widthlonger validator" placeholder="请在此处输入..." value="${fangy.lc}" name="lc" id="lc" style=" padding:0 12px;">
                                   		<input type="hidden" value="${fangy.lc}" name="lcy" id="lcy">
                                    </div>
                              </div><!---两列 end-->
                              
                              
                </div> <!--列 外框 end-->
                
                
                <div class=" overflowhidden"><!--列 外框 start-->
                			<div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>房间号：</label>
                                        <input class="form-control widthlonger validator" placeholder="请在此处输入..." value="${fangy.fjh}" name="fjh" id="fjh" style=" padding:0 12px;">
                                   		<input type="hidden" value="${fangy.fjh}" name="fjhy" id="fjhy">
                                    </div>
                              </div><!---两列 end-->
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>建筑面积 ：</label>
                                        <input class="form-control widthlonger" placeholder="请在此处输入..." name="mj" id="amount" value="${fangy.mj}" style=" padding:0 12px;">
                                    </div>
                              </div><!---两列 end--></div>
                               <div class=" overflowhidden"><!--列 外框 start-->
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>户型 ：</label>
                                        <div class="overflowhidden">
                                              <div class="radio pullleft font14">
                                                <label>
                                                  <input type="radio" name="hx" id="optionsRadios1" value="1" <c:if test="${fangy.hx=='1'}">checked</c:if>>内环
                                                </label>
                                              </div>
                                              <div class="radio pullleft  font14">
                                                <label>
                                                  <input type="radio" name="hx" id="optionsRadios2" value="2" <c:if test="${fangy.hx=='2'}">checked</c:if>>外环
                                                </label>
                                              </div>
                                              <div class="radio pullleft  font14">
                                                <label>
                                                  <input type="radio" name="hx" id="optionsRadios2" value="3" <c:if test="${fangy.hx=='3'}">checked</c:if>>阳面  
                                                </label>
                                              </div>
                                              <div class="radio pullleft  font14">
                                                <label>
                                                  <input type="radio" name="hx" id="optionsRadios2" value="4" <c:if test="${fangy.hx=='4'}">checked</c:if>>阴面
                                                </label>
                                              </div>
                                         </div>
                                    </div>
                              </div><!---两列 end-->
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>是否装修：</label>
                                        <div class="overflowhidden">
                                              <div class="radio pullleft font14">
                                                <label>
                                                	<input type="radio" name="zx" id="optionsRadios2" value="2" <c:if test="${fangy.zx=='2'}">checked</c:if>>未装修
                                                </label>
                                              </div>
                                              <div class="radio pullleft  font14">
                                                <label>
                                                  	<input type="radio" name="zx" id="optionsRadios1" value="1" <c:if test="${fangy.zx=='1'}">checked</c:if>>已装修
                                                </label>
                                              </div>
                                         </div><!----overflowhidden end------>
                                    </div>
                              </div><!---两列 end-->
                </div> <!--列 外框 end-->
                
                
                <div class=" overflowhidden"><!--列 外框 start-->
                <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                <div class="formgroup">
                    <label class="font14 widthtextalignr"><span class="required">*</span>房屋状态：</label>
                    <div class="overflowhidden">
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios1" value="1" <c:if test="${fangy.fwzt=='1'}">checked</c:if>>空置
                            </label>
                          </div>
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios2" value="2" <c:if test="${fangy.fwzt=='2'}">checked</c:if>>定置
                            </label>
                          </div>
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios2" value="3" <c:if test="${fangy.fwzt=='3'}">checked</c:if>>预留
                            </label>
                          </div>
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios2" value="4" <c:if test="${fangy.fwzt=='4'}">checked</c:if>>预退
                            </label>
                          </div>
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios2" value="5" <c:if test="${fangy.fwzt=='5'}">checked</c:if>>入住
                            </label>
                          </div>
                          <div class="radio pullleft font14">
                            <label>
                              <input type="radio" name="fwzt" id="optionsRadios2" value="6" <c:if test="${fangy.fwzt=='6'}">checked</c:if>>停用
                            </label>
                          </div>
                     </div><!----overflowhidden end------>
                </div><!----formgroup end--------->
				
                              
                   		<div class="pullleft" id="qcTime" <c:if test="${fangy.fwzt!='4'}">style="display:none;"</c:if> style="width:48%; padding-right:2%;"><!---两列 start-->
                         	<div class="formgroup">
                             	<label class="font14 widthtextalignr"><span class="required">*</span>预退时间：</label>
                                <input type='text'  name="qcTime" class="form-control widthlonger" onClick="WdatePicker()" value='<fmt:formatDate value="${fangy.qcTime}" pattern="yyyy-MM-dd" />'/> 
                             </div>
                                   
                         </div>
                </div><!---两列 end-->
                              <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                    <div class="formgroup">
                                        <label class="font14 widthtextalignr"><span class="required">*</span>设备 ：</label>
                                        <div class="overflowhidden">
                                              <div class="radio pullleft font14">
                                                <label>
                                                	<input type="radio" name="sb" id="optionsRadios2" value="2" <c:if test="${fangy.sb=='2'}">checked</c:if>>无
                                                  
                                                </label>
                                              </div>
                                              <div class="radio pullleft  font14">
                                                <label>
                                                  	<input type="radio" name="sb" id="optionsRadios1" value="1" <c:if test="${fangy.sb=='1'}">checked</c:if>>有
                                                </label>
                                              </div>
                                         </div><!----overflowhidden end------>
                                    </div><!-----formgroup end------->
                              </div><!---两列 end-->
                              
                              
                              
                </div> <!--列 外框 end-->
                
                <div class=" overflowhidden"><!--列 外框 start-->
                
                  </div><!---两列 end-->            

                <div class="formgroup">
                    <label class="font14 widthtextalignr">备注：</label>
                     <textarea rows="3" name="bz" id="bz" class="form-control textareawidthlong bglightgrey" >${fangy.bz }</textarea>
                </div><!----formgroup end---------> 
                <div class="height10"></div> 
                <div class="height20"></div> 
                <div style="border:1px dashed #e5e5e5;"></div>
                
                <div class="height20"></div> 
                
                <label class="labelnormal">图像信息</label>
                <div class="height20"></div> 

                <div class=" overflowhidden"><!--列 外框 start-->
                
                          <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                <div class="formgroup">
                                      <label class="font14 widthtextalignr">平面图：</label>
                                      <input type="hidden" id="pmt" name="pmt"  value="${fangy.pmt }"/>
                                       <a href="javascript:;" class="file">选择文件
										    <input class="inputfilenormal font14" type="file" id="img_pmt" name="img_pmt"  onchange="load('img_pmt','pmt');">
									  </a>
                                      <div id="preview" class="preview">
                                      		<img id="imgShow_pmt"  alt=""  width='252' height='162' <c:if test="${not empty fangy.pmt}">src="<%=request.getContextPath()%>${fangy.pmt}"</c:if> <c:if test="${empty fangy.pmt}">src="<%=request.getContextPath()%>/images/picture_default.png"</c:if>/>
                                      </div>
                                </div>
                          </div><!---两列 end-->
                          
                          <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                <div class="formgroup">
                                      <label class="font14 widthtextalignr">房屋装修图：</label>
                                      <input type="hidden" id="fwzxt" name="fwzxt"  value="${fangy.fwzxt }"/>
                                      <a href="javascript:;" class="file">选择文件
										    <input class="inputfilenormal font14" type="file" id="img_fwzxt" name="img_fwzxt"  onchange="load('img_fwzxt','fwzxt');">
									  </a>
                                      <div id="preview" class="preview">
                                          <img id="imgShow_fwzxt"  alt=""  width='252' height='162'   <c:if test="${not empty fangy.fwzxt}">src="<%=request.getContextPath()%>${fangy.fwzxt}"</c:if> <c:if test="${empty fangy.fwzxt}">src="<%=request.getContextPath()%>/images/picture_default.png"</c:if>>
                                      </div>
                                </div>
                          </div><!---两列 end-->
                              
                </div> <!--列 外框 end-->

				<div class="height20"></div> 

                <div class=" overflowhidden"><!--列 外框 start-->
                
                          <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                <div class="formgroup">
                                      <label class="font14 widthtextalignr">实物图1：</label>
                                      <input type="hidden" id="swt1" name="swt1"  value="${fangy.swt1 }"/>
                                       <a href="javascript:;" class="file">选择文件
										     <input class="inputfilenormal font14" type="file" id="img_swt1" name="img_swt1" value="11" onchange="load('img_swt1','swt1');">
									  </a>
                                      <div id="preview" class="preview">
                                      		<img id="imgShow_swt1"  alt=""  width='252' height='162' <c:if test="${not empty fangy.swt1}">src="<%=request.getContextPath()%>${fangy.swt1}"</c:if> <c:if test="${empty fangy.swt1}">src="<%=request.getContextPath()%>/images/picture_default.png"</c:if>/>
                                      </div>
                                </div>
                          </div><!---两列 end-->
                          
                          <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                <div class="formgroup">
                                      <label class="font14 widthtextalignr">实物图2：</label>
                                      <input type="hidden" id="swt2" name="swt2" value="${fangy.swt2 }" />
                                      <a href="javascript:;" class="file">选择文件
										   <input class="inputfilenormal font14" type="file" id="img_swt2" name="img_swt2" value="11" onchange="load('img_swt2','swt2');">
									  </a>
                                      <div id="preview" class="preview">
                                          <img id="imgShow_swt2"  alt=""  width='252' height='162'  <c:if test="${not empty fangy.swt2}">src="<%=request.getContextPath()%>${fangy.swt2}"</c:if> <c:if test="${empty fangy.swt2}">src="<%=request.getContextPath()%>/images/picture_default.png"</c:if>>
                                      </div>
                                </div>
                          </div><!---两列 end-->
                              
                </div> <!--列 外框 end-->
                <div class="height20"></div> 

                <div class=" overflowhidden"><!--列 外框 start-->
                
                          <div class="pullleft" style="width:48%; padding-right:2%;"><!---两列 start-->
                                <div class="formgroup">
                                      <label class="font14 widthtextalignr">实物图3：</label>
                                      <input type="hidden" id="swt3" name="swt3" value="${fangy.swt3 }" />
                                       <a href="javascript:;" class="file">选择文件
										     <input class="inputfilenormal font14" type="file" id="img_swt3" name="img_swt3" value="11" onchange="load('img_swt3','swt3');">
									  </a>
                                      <div id="preview" class="preview">
                                      		<img id="imgShow_swt3"  alt=""  width='252' height='162'  <c:if test="${not empty fangy.swt3}">src="<%=request.getContextPath()%>${fangy.swt3}"</c:if> <c:if test="${empty fangy.swt3}">src="<%=request.getContextPath()%>/images/picture_default.png"</c:if>/>
                                      </div>
                                </div>
                          </div><!---两列 end-->
                          
                </div> <!--列 外框 end-->
                
                
                <div class="height20"></div>
                
                
                
                <div style="margin-left:20px;">
                	<input type="button" class="btn btn-primary" value="提交" id="sub"/>
                	<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
                </div>
                <div class="height20"></div>
                <div class="height20"></div>
			</form>

           </div>     
        </div><!--right-ctn end-->
        	
</div><!--right end-->
</body>
</html>
