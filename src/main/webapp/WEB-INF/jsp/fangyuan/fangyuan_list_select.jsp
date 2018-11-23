<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<%  
  response.setHeader("Cache-Control",   "Public");  
  response.setHeader("Pragma",   "no-cache");  
  response.setDateHeader("Expires",   0);   
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<title></title>
<style type="text/css">

.STYLE1 {font-size: 18px}
.STYLE2 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE3 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE4 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE5 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}

</style>
</head>

<!---------------右侧------------------>    
<div class="right"><!--right start-->

		<div class="search-bar overflowhidden">
			<form action="<%=request.getContextPath()%>/fangy/list_select.do" method="post">
	        	<label>楼座：</label>
	        	<select name="lz" class="inputnormal  mr10 bglightgrey">
					<option value="">请选择</option>
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
				<label>房间号</label>
				<input type="text" name="fjh" value="${fjh}" class="inputnormal inputlong mr10 bglightgrey" placeholder="请输入" />
				
	        	<label>户型</label> 
				<select name="hx" class="inputnormal  mr10 bglightgrey">
					<option value="">请选择</option>
					<option value="1"
						<c:if test="${hx=='1'}"> selected="selected"</c:if>>内环</option>
					<option value="2"
						<c:if test="${hx=='2'}"> selected="selected"</c:if>>外环</option>
					<option value="3"
						<c:if test="${hx=='3'}"> selected="selected"</c:if>>阳面</option>
					<option value="4"
						<c:if test="${hx=='4'}"> selected="selected"</c:if>>阴面</option>
				</select> 
			<label>设备</label> 
				<select name="sb" class="inputnormal  mr10 bglightgrey">
					<option value="">请选择</option>
					<option value="1"
						<c:if test="${sb=='1'}"> selected="selected"</c:if>>有</option>
					<option value="2"
						<c:if test="${sb=='2'}"> selected="selected"</c:if>>无</option>
				</select> 
			<label>面积范围：</label> 
				<input type="text" name="mj1" value="${mj1}" class="inputnormal inputshort mr5 bglightgrey" />~ 
				<input type="text" name="mj2" value="${mj2}" class=" inputnormal inputshort mlr5 bglightgrey" /> 
			<label style="margin-right:5px;">平方米</label> 
			<label>状态：</label> 
				<select name="status" class="inputnormal inputlong mr10 bglightgrey">
					<option value="">请选择</option>
					<option value="1"
						<c:if test="${status=='1'}"> selected="selected"</c:if>>未使用（空、定、预）</option>
					<option value="2"
						<c:if test="${status=='2'}"> selected="selected"</c:if>>已使用</option>
					<option value="3"
						<c:if test="${status=='3'}"> selected="selected"</c:if>>停用</option>
				</select> 
				<input type="submit" class="btn btn-warning" value="搜索" />
			</form>
        </div>
        
        <div style="height:50px; line-height:0;"></div>
        
        <div class="operation overflowhidden"><!---operation start--> 
        
   		  <div class="pullleft  ml30">
           	  <p class="colorgrey STYLE1"><strong>房源信息</strong></p>
                </div>
                   <div class="pullright overflowhidden STYLE1 mr30"> 
<!--                    <label>动态截止日期</label> -->
<!-- 	               <input type="text" id="endTime" value="" onClick="WdatePicker({dateFmt:'yyyy-MM'})"  class=" inputnormal mlr5 bglightgrey" style="width: 100px;"/> -->
                   <input type="button" class="btn-primary STYLE2" style="margin-top: 10px;" onclick="dt();" value="动态情况图" />
                </div>
        </div>
        
        <div style="height:50px; line-height:0;"></div>
        
        <span class="STYLE1">
        <!---operation end--> 
        </span>
        <div class="right-ctn STYLE1">
        
                <div class="main_ctn_table"><!---main_ctn_table start-->
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th>序号</th>
                            <th>楼座</th>
                            <th>房间号</th>
                            <th>建筑面积</th>
                            <th>户型</th>
                            <th>设备</th>
                            <th>房屋状态</th>
                            
                            
                            <th>入住企业</th>
                            <th>合同编号</th>
                            <th>起止时间</th>
                         	<th width="15%">备注</th>
                        </tr>
                        <c:forEach items="${fangyList}" var="u"  varStatus="status">
                        
                        <tr <c:if test="${status.count%2==0}">class="everyline"</c:if> >
                            <td>${status.count}</td>
                            <td>${u.lz}</td>
                            <td><a href='<%=request.getContextPath()%>/fangy/view/${u.id}'>${u.fjh}</a></td>
                            <td>${u.mj}</td>
                            <td><c:if test="${u.hx=='1'}">内环</c:if>
                            	<c:if test="${u.hx=='2'}">外环</c:if>
                            	<c:if test="${u.hx=='3'}">阳面</c:if>
                            	<c:if test="${u.hx=='4'}">阴面</c:if>
                            </td>
                            <td><c:if test="${u.sb=='1'}">有</c:if>
                            	<c:if test="${u.sb=='2'}">无</c:if>
                            </td>
                            <td>
                            	<c:if test="${u.fwzt=='1'}">空置</c:if>
                            	<c:if test="${u.fwzt=='2'}">定置</c:if>
                            	<c:if test="${u.fwzt=='3'}">预留</c:if>
                            	<c:if test="${u.fwzt=='4'}">预退</c:if>
                            	<c:if test="${u.fwzt=='5'}">入住</c:if>
                            	<c:if test="${u.fwzt=='6'}">停用</c:if>
                            </td>
                            <c:set var="qiyezizhi" ></c:set>
                            <c:if test="${u.fwzt!='1'&&u.fwzt!='6'}">
	                            <c:forEach items="${u.qiyezizhiList}" var="uu" >
									<c:if test="${uu.status==6 }">
										<c:set var="qiyezizhi" value="${uu}" ></c:set>
									</c:if>
								</c:forEach>
							</c:if>
							
	                        
	                        <td>
	                        	<c:if test="${not empty qiyezizhi}">
	                        		<a href='<%=request.getContextPath()%>/qiye/qiye_xiangqing/${qiyezizhi.qiye.id}'>${qiyezizhi.qiye.name }</a>
	                        	
	                        	</c:if>
	                        	</td>
	                        <td>
	                        	<c:if test="${not empty qiyezizhi}">
	                        		<a href="<%=request.getContextPath()%>/hetong/view/${qiyezizhi.hetong.id}">${qiyezizhi.hetong.bh}</a>
		                        
		                        </c:if>
	                        </td>
	                        <td>
	                        	<c:if test="${not empty qiyezizhi}">
	                        	<fmt:formatDate value="${qiyezizhi.hetong.zlqx_start}" pattern="yyyy.MM.dd" />-<fmt:formatDate value="${qiyezizhi.hetong.zlqx_end}" pattern="yyyy.MM.dd" />
	                        	</c:if>
	                        </td>
	                        <td title="${u.bz}"><c:out  value="${fn:substring(u.bz,0,10)}"/></td>
                        </tr>
                       	</c:forEach>
                       	<!-- 合计 -->
                       	<tr >
                            <td></td>
                            <td><font color="red">累计</font></td>
                            <td></td>
                            <td><font color="red">${mjs }</font></td>
                            <td></td>
                            <td></td>
                            <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
                        </tr>
                        <!-- 合计 END-->
                        
                    </table>
                   
                   <div style="text-align:center; margin-top:10px;">
                        <pg:pager items="${total}" url="list_select.do"
					        export="currentPageNumber=pageNumber" maxPageItems="10">
					        <pg:param name="lz"/>
					        <pg:param name="fjh"/>
					        <pg:param name="hx"/>
					        <pg:param name="sb"/>
					        <pg:param name="mj1"/>
					        <pg:param name="mj2"/>
					        <pg:param name="status"/>
					        <pg:first>
					         <a href="${pageUrl}"><nobr>
					           [首页]
					          </nobr> </a>
					        </pg:first>
					        <pg:prev>
					         <a href="${pageUrl}">前一页</a>
					        </pg:prev>
					        <pg:pages>
					         <c:choose>
					          <c:when test="${currentPageNumber eq pageNumber}">
					           <font color="red">${pageNumber }</font>
					          </c:when>
					          <c:otherwise>
					           <a href="${pageUrl}">${pageNumber}</a>
					          </c:otherwise>
					         </c:choose>
					        </pg:pages>
					        <pg:next>
					         <a href="${pageUrl}">下一页</a>
					        </pg:next>
					        <pg:last>
					         <a href="${pageUrl}"><nobr>
					           [尾页]
					          </nobr> </a>
					        </pg:last>
					       </pg:pager> 
                   </div> 
                </div><!---main_ctn_table end-->
        </div>
        <span class="STYLE1">
        <!--right-ctn end-->
        </span></div>
<span class="STYLE1">
<!--right end-->




<script>
total = document.documentElement.clientHeight;
colHeight = total-1-document.getElementById("left").offsetTop;
document.getElementById("left").style.height=colHeight+"px";
document.getElementById("right").style.height=colHeight+"px";
</script>


<script language="javascript">
	function dt(){
// 		var endTime = $("#endTime").val();
// 		if(endTime!=null&&endTime!=""){
			window.location.href='<%=request.getContextPath()%>/fangy/dongtaitu?lz=A';
// 		}else{
// 			alert("请选择动态截止时间！");
// 		}
		
	}
	//菜单隐藏与显示
	function SwitchMenu(obj){
		if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("Menu").getElementsByTagName("ul");
		var dr = document.getElementById("Menu").getElementsByTagName("div");
			for(var i = 0; i < dr.length; i ++){
				dr[i].className = "Menutbg_1 cursor";
			}
			if(el.style.display != "block"){ 
				for (var i=0; i<ar.length; i++){
					if (ar[i].className=="submenu")
					ar[i].style.display = "none";
				}
				el.style.display = "block";
				event.srcElement.className="Menutbg_2 cursor"
			}else{
				el.style.display = "none";
				event.srcElement.className="Menutbg_1 cursor"
			}
		}
	}
</script>
</span>
</body>
</html>
