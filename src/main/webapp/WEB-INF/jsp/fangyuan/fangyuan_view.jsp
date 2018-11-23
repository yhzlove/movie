<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css">
<link href="<%=request.getContextPath()%>/css/css-lz.css"
	rel="stylesheet" type="text/css" />
<SCRIPT src="<%=request.getContextPath()%>/js/jquery-1.2.6.pack.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/js/base.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/js/lib.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/js/163css.js"
	type=text/javascript></SCRIPT>
<SCRIPT type=text/javascript>
	$(function() {
		$(".jqzoom").jqueryzoom({
			xzoom : 400,
			yzoom : 250,
			offset : 10,
			position : "right",
			preload : 1,
			lens : 1
		});
		$("#spec-list").jdMarquee({
			deriction : "left",
			width : 400,
			height : 56,
			step : 2,
			speed : 4,
			delay : 10,
			control : true,
			_front : "#spec-right",
			_back : "#spec-left"
		});
		$("#spec-list img").bind("mouseover", function() {
			var src = $(this).attr("src");
			$("#spec-n1 img").eq(0).attr({
				src : src.replace("\/n5\/", "\/n1\/"),
				jqimg : src.replace("\/n5\/", "\/n0\/")
			});
			$(this).css({
				"border" : "2px solid #ff6600",
				"padding" : "1px"
			});
		}).bind("mouseout", function() {
			$(this).css({
				"border" : "1px solid #ccc",
				"padding" : "2px"
			});
		});
	})
</SCRIPT>
<style type="text/css">
.fangwu-tab td.biaoti {
text-align: left;
border-bottom: 0px;
height: 30px;
line-height: 30px;
font-weight: bold;
width: 60px;
}
.main_ctn_table table {
width: 360px;
text-align: center;
line-height: 42px;
}
.fangwu-tab-box {
    width: 40%;
    padding-left: 50px;
}
</style>
</head>
<body>

	<!---------------右侧------------------>
	<div class="right">
		<!--right start-->
		 <div class="top"><!--top start-->
            <div class="position pullleft">
                <p><span>当前位置：房屋详情 ${fangy.lz }--${fangy.fjh }</span></p>
            </div>
            <div class="pullright overflowhidden">
              	<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
            </div>
        </div><!--top end-->
        <span class="STYLE1">
        <!---operation end--> 
        </span>
        
                
		<span class="STYLE1"> <!---operation end--> </span>
		<div class="right-ctn STYLE1">
			<div class="main_ctn_table"><!---main_ctn_table start-->
                    <div class="fangwu-info"><img src="<%=request.getContextPath()%>/images/fw-1.png" width="46" height="46" />${fangy.lz }-${fangy.fjh }</div>
		
<!-- 			<div class="main_ctn_table"> -->
				<!---main_ctn_table start-->
<!-- 				<div class="fangwu-info"> -->
<!-- 					<img src="<%=request.getContextPath()%>/images/fw-1.png" width="46" height="46" />${fangy.lz }-${fangy.fjh } -->
<!-- 				</div> -->

<!-- 				<dl class="xiangqing"> -->
<!-- 					<dd class="xz">基本信息</dd> -->
<!-- 					<dd>合同信息记录</dd> -->
<!-- 				</dl> -->
				<div class="clear"></div>
				<div class="fangwu-tu">

					<div id=preview>
						<div class=jqzoom id=spec-n1>
							<IMG height=250 src="<%=request.getContextPath()%>/${fangy.pmt }" jqimg="<%=request.getContextPath()%>/${fangy.pmt }"
								width=350>
						</div>
						<div id=spec-n5>

							<div id=spec-list>
								<ul class=list-h>
								<c:if test="${not empty fangy.pmt}">
										<li><img src="<%=request.getContextPath()%>${fangy.pmt }"></li>
								</c:if>
								<c:if test="${not empty fangy.fwzxt}">
										<li><img src="<%=request.getContextPath()%>${fangy.fwzxt }"></li>
								</c:if>
								<c:if test="${not empty fangy.swt1}">
										<li><img src="<%=request.getContextPath()%>${fangy.swt1 }"></li>
								</c:if>
								<c:if test="${not empty fangy.swt2 }">
										<li><img src="<%=request.getContextPath()%>${fangy.swt2 }"></li>
								</c:if>
								<c:if test="${not empty fangy.swt3}">
										<li><img src="<%=request.getContextPath()%>${fangy.swt3 }"></li>
								</c:if>
								</ul>
							</div>


						</div>
					</div>



					<div class="fangwu-tab-box">
						<table class="fangwu-tab">
							<tr>
								<td class="biaoti">房间号：</td>
								<td class="neirong">${fangy.fjh }</td>
								<td class="biaoti">面积：</td>
								<td class="neirong">${fangy.mj }</td>
							</tr>
							<tr>
								<td class="biaoti">户型 ：</td>
								<td class="neirong"><c:if test="${fangy.hx=='1'}">内环</c:if> 
													<c:if test="${fangy.hx=='2'}">外环</c:if> 
													<c:if test="${fangy.hx=='3'}">阳面</c:if>
													<c:if test="${fangy.hx=='4'}">阴面</c:if>
								</td>
								<td class="biaoti">状态：</td>
								<td class="neirong"><c:if test="${fangy.fwzt=='1'}">空置</c:if> 
													<c:if test="${fangy.fwzt=='2'}">定置</c:if> 
													<c:if test="${fangy.fwzt=='3'}">预留</c:if>
													<c:if test="${fangy.fwzt=='4'}">预退</c:if> 
													<c:if test="${fangy.fwzt=='5'}">入住</c:if>
													<c:if test="${fangy.fwzt=='6'}">停用</c:if>
								</td>
							</tr>
							<tr>
								<td class="biaoti">装修：</td>
								<td class="neirong"><c:if test="${fangy.zx=='1'}">装修</c:if> 
													<c:if test="${fangy.zx=='2'}">未装修</c:if> 
								</td>
								<td class="biaoti">设备：</td>
								<td class="neirong"><c:if test="${fangy.sb=='1'}">有</c:if> 
													<c:if test="${fangy.sb=='2'}">无</c:if>
								</td>
							</tr>
							<tr>
								<td class="biaoti">&nbsp;</td>
								<td class="neirong">&nbsp;</td>
								<td class="biaoti">&nbsp;</td>
								<td class="neirong">&nbsp;</td>
							</tr>
							<c:forEach items="${fangy.qiyezizhiList}" var="u"  varStatus="status">
								<c:if test="${u.status==6 }">
									<c:set var="qiyezizhi" value="${u}" ></c:set>
								</c:if>
							</c:forEach>
							
							<tr>
								<td class="biaoti">公司：</td>
								<td class="neirong">${qiyezizhi.qiye.name }</td>
								<td class="biaoti">租期：</td>
								<td class="neirong"><fmt:formatDate value="${qiyezizhi.hetong.zlqx_start}" pattern="yyyy.MM.dd" />-<fmt:formatDate value="${qiyezizhi.hetong.zlqx_end}" pattern="yyyy.MM.dd" /></td>
							</tr>
							<tr>
								<td class="biaoti">电话：</td>
								<td class="neirong">${qiyezizhi.qiye.qy_mobile }</td>
								<td class="biaoti">邮箱：</td>
								<td class="neirong">${qiyezizhi.qiye.qy_email }</td>
							</tr>
						</table>

					</div>
				</div>
				<div class=" clear"></div>
				<div >
			    	<iframe src="<%=request.getContextPath()%>/fangy/history_list/${fangy.id }?lz=${fangy.lz}&fjh=${fangy.fjh}" scrolling="no" frameborder='0' style="width: 100%;height: 400px;"></iframe>
			    </div>
			</div>
			<!---main_ctn_table end-->
		</div>
		<span class="STYLE1"> <!--right-ctn end--> </span>
	</div>
	<span class="STYLE1"> <!--right end--> <script>
		total = document.documentElement.clientHeight;
		colHeight = total - 1 - document.getElementById("left").offsetTop;
		document.getElementById("left").style.height = colHeight + "px";
		document.getElementById("right").style.height = colHeight + "px";
	</script> <script language="javascript">
	//菜单隐藏与显示
	function SwitchMenu(obj) {
		if (document.getElementById) {
			var el = document.getElementById(obj);
			var ar = document.getElementById("Menu").getElementsByTagName("ul");
			var dr = document.getElementById("Menu")
					.getElementsByTagName("div");
			for ( var i = 0; i < dr.length; i++) {
				dr[i].className = "Menutbg_1 cursor";
			}
			if (el.style.display != "block") {
				for ( var i = 0; i < ar.length; i++) {
					if (ar[i].className == "submenu")
						ar[i].style.display = "none";
				}
				el.style.display = "block";
				event.srcElement.className = "Menutbg_2 cursor";
			} else {
				el.style.display = "none";
				event.srcElement.className = "Menutbg_1 cursor";
			}
		}
	}
</script> </span>
</body>
</html>
