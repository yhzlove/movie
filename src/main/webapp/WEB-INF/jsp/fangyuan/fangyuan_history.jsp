<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 

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
        <span class="STYLE1">
        <!---operation end--> 
        </span>
        <div class="right-ctn STYLE1">
        
                <div class="main_ctn_table"><!---main_ctn_table start-->
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th>合同编号</th>
                            <th>公司名称</th>
                            <th>建筑面积</th>
                            <th>单价</th>
                            <th>天数</th>
                          	<th>收费期限</th>
                            <th>房租</th>
                            <th>设备租赁费</th>
                            <th>物业费</th>
                         	<th>备注</th>
					    </tr>
                        <c:forEach items="${hetongList}" var="u"  varStatus="status">
                        
                        <tr <c:if test="${status.count%2==0}">class="everyline"</c:if> >
                            <td><a href="#">${u.bh }</a></td>
                            <td><span class="neirong"><a href="<%=request.getContextPath()%>/qiye/qiye_xiangqing/${u.qiyezizhi.qiye.id}"  target='mainFrame' >${u.yi }</a></span></td>
                            <td>${u.base_mj }</td>
                            <td>${u.zj_dj }</td>
                            <td>${u.zlpx_tj}</td>
                            <td><span class="neirong"><fmt:formatDate value="${u.zlqx_start}" pattern="yyyy.MM.dd" />-<fmt:formatDate value="${u.zlqx_end}" pattern="yyyy.MM.dd" /></span></td>
                            <td>${u.zj_ze }</td>
                            <td>${u.sb_dj }</td>
                            <td>${u.wuyef_dj }</td>
                          	<td>${u.bz }</td>
                        </tr>
                       	</c:forEach>
                    </table>
                   
                   <div style="text-align:center; margin-top:10px;">
                        <pg:pager items="${total}" url="${pageContext.request.contextPath}/fangy/history_list/${id}"
					        export="currentPageNumber=pageNumber" maxPageItems="5">
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

</span>
</body>
</html>
