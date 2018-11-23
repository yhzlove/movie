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
				
					<!-- 
					<li class="text-center">
						<img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li> 
					-->
						
					<li><a href="<%=request.getContextPath()%>/member/update"  >我的资料</a></li>
					<li><a href="<%=request.getContextPath()%>/order/member/list.do?memberId=${loginMember.id}"  >电影票</a></li>
					<li><a href="<%=request.getContextPath()%>/comment/member/list.do?memberId=${loginMember.id}" class="active-menu" >我的评论</a></li>
				
                </ul>
               
            </div>
            
        </nav>
        
        <div id="page-wrapper" >
            <div id="page-inner">
            
            		<c:forEach items="${commentList}" var="u">
					<!-- /循环体 -->
					<div class="col-md-4 col-sm-4">
						<div class="panel panel-success">
							<div class="panel-heading">
								${u.movie.movieName}
							</div>
							<div class="panel-body">
								<p>${u.content}</p>
							</div>
							<div class="panel-footer">
								<fmt:formatDate value="${u.createTime}" pattern="yyyy.MM.dd HH:mm" />
							</div>
						</div>
					</div>
					<!-- //循环体 -->
					</c:forEach>
					
				
			</div>
        </div>
        
     </div>
    
    
    
   
</body>
</html>

