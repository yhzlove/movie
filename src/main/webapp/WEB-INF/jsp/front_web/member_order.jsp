<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>个人资料</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet" />
	<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
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
					<li><a href="<%=request.getContextPath()%>/member/update" >我的资料</a></li>
					<li><a href="<%=request.getContextPath()%>/order/member/list.do?memberId=${loginMember.id}" class="active-menu" >电影票</a></li>
					<li><a href="<%=request.getContextPath()%>/comment/member/list.do?memberId=${loginMember.id}"  >我的评论</a></li>
                </ul>
               
            </div>
            
        </nav>
        
        <div id="page-wrapper" >
            <div id="page-inner">
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             电影票
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th width="10%">电影</th>
                                            <th width="10%">时间</th>
                                            <th width="10%">影厅</th>
                                            <th width="10%">价格</th>
                                            <th width="10%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderList}" var="u">
                                        <!-- /循环体 -->
										<tr class="odd gradeX">
                                            <td>${u.movie.movieName}</td>
                                            <td><fmt:formatDate value="${u.showFilm.startTime}" pattern="yyyy.MM.dd HH:mm" /></td>
                                            <td>${u.showFilm.hall.name}</td>
                                            <td>${u.price}</td>
                                            <td>
                                            	<c:if test="${u.pay!=1 }">
                                            	<input type="button" class="btn btn-success" onclick="pay(${u.id});" value="支付" />
                                            	</c:if>
                                            	<c:if test="${u.pay==1 }">
                                            	已支付,请及时取票观影.
                                            	</c:if>
                                            </td>
                                        </tr>
										<!-- //循环体 -->
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <pg:pager items="${total}" url="list.do"
							        export="currentPageNumber=pageNumber" maxPageItems="10">
							        <pg:param name="memberId"/>
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
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
				
			</div>
        </div>
        
     </div>
    
    
    
   
</body>
<script type="text/javascript">
	function pay(orderId){
		if (confirm("确定支付?支付后不可更改")==true){ 
			$.ajax({
	            type: "POST",
	            url: "<%=request.getContextPath()%>/order/pay.do",
	            data: {'orderId': orderId},
				success: function (msg) {
	                if (msg != "success") {
	                    alert(msg);
	                }else{
	                	location.reload();
	                }
	            },
	        });
		}
	}

</script>
</html>

