<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>  
 
<title></title>
<style type="text/css">
.STYLE1 {font-size: 18px}
.STYLE2 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE3 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE4 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
.STYLE5 {padding: 4px 0; margin-right:2px; margin-bottom: 0; width:90px; font-weight: normal; line-height: 1.428571429; text-align: enter; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none; display: inline-block;}
ul.imglist{ margin:0 auto;  overflow:hidden} 
ul.imglist li{ float:left; padding:4px 8px; width:160px} 
ul.imglist li img{ display:block; width:160px; height:90px} 
ul.imglist li span{ display:block; width:100%; height:30px; line-height:30px; background:#F6F6F6} 
</style>
</head>

<body>
<!---------------右侧------------------>    
<div class="right"><!--right start-->

        
        
        <div class="top"><!--top start-->
            <div class="position pullleft">
                <p><span>当前位置：附件管理</span></p>
            </div>
            <div class="pullright overflowhidden">
            	<a href="<%=request.getContextPath()%>/movie/attach_video/${movie.id}"><input type="button" class="btn btn-success" value="测试播放" /></a>
            	<a href="<%=request.getContextPath()%>/movie/attach_add/${movie.id}"><input type="button" class="btn btn-success" value="上传" /></a>
				<input type="button" class="btn btn-default" value="返回" onclick="javascript:history.go(-1);" value="返回"/>
            </div>
        </div><!--top end-->
        <span class="STYLE1">
        <!---operation end--> 
        </span>
        <div class="right-ctn STYLE1">
        
                <div class="main_ctn_table"><!---main_ctn_table start-->
                    <div class="fangwu-info"><img src="<%=request.getContextPath()%>/images/fw-1.png" width="46" height="46" />${movie.movieName }</div>
                    
                <div class="clear"></div> 
                <ul class="imglist"> 
                	<c:forEach items="${movie.attachList}" var="u"  varStatus="status">
	                	<c:if test="${u.img==1}">
	                		<li>
						           <img alt="${u.oldName}" src="<%=request.getContextPath()%>/${u.address}" />
						           <span>${u.oldName}</span>
						    </li> 
		                </c:if>            
                 	</c:forEach>
				</ul>  
                
              <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th width="40"><input type="checkbox" value="" /></th>
                            <th>序号</th>
                            <th>文件名</th>
                            <th>上传日期</th>
                            <th>文件大小</th>
                            
                            <th></th>
					    </tr>
                        
                         <c:forEach items="${movie.attachList}" var="u"  varStatus="status">
                         	
                         	<c:if test="${ u.img==0}">
	                        <tr  >
	                            <td width="40"><input type="checkbox" value="" /></td>
	                            <td>${status.count}</td>
	                            <td>${u.oldName}</td>
	                            <td><fmt:formatDate value="${u.createTime}" pattern="yyyy/MM/dd" /></td>
	                            <td>${u.size}</td>
	                     
							  	<td><a href="<%=request.getContextPath()%>/upload/attach_down/${u.id}">下载</a></td>
	                            
	                        </tr>
	                        </c:if>
                       	</c:forEach>
                    </table>
                   
                </div><!---main_ctn_table end-->
        </div>
        <span class="STYLE1">
        <!--right-ctn end-->
        </span></div>
<!--right end-->

</body>
</html>
