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
			<form action="<%=request.getContextPath()%>/fangy/lishi.do" method="post">
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
	        	<label>房号：</label>
	        	<input type="text" name="fjh" value="${fjh}" class="inputnormal inputlong mr10 bglightgrey" placeholder="请输入" />
	         
				<input type="submit" class="btn btn-warning" value="搜索" />
			</form>
        </div>
        
        <div style="height:50px; line-height:0;"></div>
        
        <div class="operation overflowhidden"><!---operation start--> 
        
   		  <div class="pullleft  ml30">
           	  <p class="colorgrey STYLE1"><strong>租房历史信息</strong></p>
                </div>
                   <div class="pullright overflowhidden STYLE1 mr30">
<!--                     <input type="button" class="btn-primary STYLE2" onclick="window.location.href='<%=request.getContextPath()%>/fangy/dongtaitu'" value="动态情况图" /> -->
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
                            <th width="40"><input type="checkbox" value="" /></th>
                            <th>序号</th>
                            <th>楼座</th>
                            <th>楼层</th>
                            <th>房间号</th>
                            <th>建筑面积</th>
                            <th>租赁企业</th>
                            <th>单价</th>
                            <th>租房时间段</th>
							<th>租金</th>
							<th>物业费</th>
<!-- 							<th>设备</th> -->
							<th style='width:10%'>备注</th>
					    </tr>
                        <c:forEach items="${hetongList}" var="u"  varStatus="status">
                        
                        <tr <c:if test="${status.count%2==0}">class="everyline"</c:if> >
                            <td width="40"><input type="checkbox" value="" /></td>
                            <td>${status.count}</td>
                            <td>${u.base_z }</td>
                            <td>${u.base_c }</td>
                            <td>
                            	<c:forEach items="${u.qiyezizhi.fangyList}" var="m" >
                            		<a href='<%=request.getContextPath()%>/fangy/view/${m.id}'>${m.fjh}</a>&nbsp;
                            	</c:forEach>
                            </td>
                            <td>${u.base_mj }</td>
                            <td>${u.yi }</td>
                            <td>${u.zj_dj }</td>
                            <td><span class="neirong"><fmt:formatDate value="${u.zlqx_start}" pattern="yyyy.MM.dd" />-<fmt:formatDate value="${u.zlqx_end}" pattern="yyyy.MM.dd" /></span></td>
                            <td>${u.zj_ze }</td>
                            <td>${u.wuyef_dj }</td>
<!--                             <td>${u.sb_dj }</td> -->
                          	<td title="${u.bz}"><c:out  value="${fn:substring(u.bz,0,10)}"/></td>
                        </tr>
                       	</c:forEach>
                    </table>
                   
                   <div style="text-align:center; margin-top:10px;">
                        <pg:pager items="${total}" url="lishi.do"
					        export="currentPageNumber=pageNumber" maxPageItems="10">
					        <pg:param name="lz"/>
					        <pg:param name="fjh"/>
					        
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
				event.srcElement.className="Menutbg_2 cursor";
			}else{
				el.style.display = "none";
				event.srcElement.className="Menutbg_1 cursor";
			}
		}
	}
</script>
</span>
</body>
</html>
