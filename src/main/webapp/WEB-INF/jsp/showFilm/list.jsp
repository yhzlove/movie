<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/css.css" />
<title></title>

</head>

<body>


	<!---------------右侧------------------>
	<div class="right">
		<!--right start-->

		<div class="search-bar overflowhidden">
		<form action='<%=request.getContextPath()%>/showFilm/back/list.do' method="post">
			<label>名称：</label>
			<input type="text" name='showFilmName' class="inputnormal inputlong mr10 bglightgrey" placeholder="请输入关键字" value='${showFilmName}'/>
				
			<input type="submit" class="btn btn-warning" value="搜索"  />
		</form>
		</div>

		<div style="height:50px; line-height:0;"></div>

		<div class="operation overflowhidden">
			<!---operation start-->

			<div class="pullleft ml30">
				<p class="colorgrey STYLE1">
					<strong>场次安排信息</strong>
				</p>
			</div>
			<div class="pullright overflowhidden mr30">
				<input type="button" class="btn btn-primary" value="添加" style="margin-top: 10px;"
					onclick="location.href='<%=request.getContextPath()%>/movie/back/list.do'" />
			</div>
		</div>
		<div style="height:50px; line-height:0;"></div>
		<span class="STYLE1"> <!---operation end-->
		</span>
		<div class="right-ctn STYLE1">
			<div class="main_ctn_table">
				<!---main_ctn_table start-->
				<table cellpadding="0" cellspacing="0">
					<tr>
						<th width="40"><input type="checkbox" value="" /></th>
						<th>场次名称</th>
						<th>电影名</th>
						<th>影厅</th>
						
						<th>时间段</th>
						<th>价格</th>
						
						<th>添加时间</th>
<!-- 						<th>状态</th> -->
<!-- 						<th>备注</th> -->
						<th width="20%">操作</th>
					</tr>
					<c:forEach items="${showFilmList}" var="u">
						<tr>
							<td width="40"><input type="checkbox" value="" /></td>
							<td>${u.showFilmName}</td>
							
							<th>${u.movie.movieName}</th>
							<td>${u.hall.name}</td>
							
							<td><fmt:formatDate value="${u.startTime}" pattern="yyyy.MM.dd HH:mm" />-<fmt:formatDate value="${u.endTime}" pattern="HH:mm" /></td>
							<td>${u.price}</td>
							
							<td><fmt:formatDate value="${u.createTime}" pattern="yyyy.MM.dd" /></td>
<!-- 							<td>${u.flag}</td> -->
<!-- 							<td>${u.remark}</td> -->
							<td>
								<a href="<%=request.getContextPath()%>/showFilm/back/update/${u.id}"><input type="button" class="btn btn-success" value="修改" /></a>
								<a href="<%=request.getContextPath()%>/showFilm/back/delete/${u.id}" onclick="return confirm('是否删除该数据')"><input type="button" class="btn btn-success" value="删除" /></a>
							</td>
						</tr>
					</c:forEach>
				</table>

				<div style="text-align:center; margin-top:10px;">

				<pg:pager items="${total}" url="list.do"
        export="currentPageNumber=pageNumber" maxPageItems="10">
        <pg:param name="showFilmName"/>
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
			<!---main_ctn_table end-->
		</div>
<!-- 		<span class="STYLE1"> right-ctn end -->
<!-- 		</span> -->
	</div>
<!-- 	<span class="STYLE1"> right end <script> -->
<!-- 		total = document.documentElement.clientHeight; -->
<!-- 		colHeight = total - 1 - document.getElementById("left").offsetTop; -->
<!-- 		document.getElementById("left").style.height = colHeight + "px"; -->
<!-- 		document.getElementById("right").style.height = colHeight + "px"; -->
<!-- 	</script>  -->
<!-- 	</span> -->
</body>
</html>






