<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- //for-mobile-apps -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css"  />
<link href="<%=request.getContextPath()%>/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/basictable.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" type="text/css"  />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
<!-- /main-header-->
<jsp:include page="head.jsp"></jsp:include>
<!--/banner-section-->
<!--//main-header-->
<div id="demo-1" class="banner-inner" style="background: url() no-repeat center center;background-size:cover;">
	<div class="banner-inner-dott">
		<!--/header-w3l-->
		<div class="header-w3-agileits" id="home">
		     <div class="inner-header-agile">	
				<nav class="navbar navbar-default">
				<div class="navbar-header">
					<h1><a  href="<%=request.getContextPath()%>"><span>M</span>ovies</a></h1>
				</div>
				<!-- navbar-header -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
						<li class="active"><a href="<%=request.getContextPath()%>">主页</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">类别<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<li>
								<div class="col-sm-4">
									<ul class="multi-column-dropdown">
										<li><a href="genre.html">战斗片</a></li>
										<li><a href="genre.html">传记片</a></li>
										<li><a href="genre.html">犯罪片</a></li>
										<li><a href="genre.html">家庭片</a></li>
										<li><a href="horror.html">恐怖片</a></li>
										<li><a href="genre.html">浪漫片</a></li>
										<li><a href="genre.html">运动片</a></li>
										<li><a href="genre.html">战争片</a></li>
									</ul>
								</div>
							</ul>
						</li>
						
						<li><a href="list.html">电影列表</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>	
			</nav>
			
				<div class="w3ls_search">
					<div class="cd-main-header">
						<ul class="cd-header-buttons">
							<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
						</ul> <!-- cd-header-buttons -->
					</div>
					<div id="cd-search" class="cd-search">
						<form action="#" method="post">
							<input name="Search" type="search" placeholder="请输入电影名称...">
						</form>
					</div>
				</div>

		</div> 
		   </div>
		<!--//header-w3l-->
	</div>
</div>	      
	        
			<!--/content-inner-section-->
				<div class="w3_content_agilleinfo_inner">
					<div class="agile_featured_movies">
					<div class="inner-agile-w3l-part-head">
						<h3 class="w3l-inner-h-title">Movie List</h3>
					</div>
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
								<div class="agile-news-table">
									<div class="w3ls-news-result">
										<h4>电影数 : <span>${total}</span></h4>
									</div>
									<table id="table-breakpoint">
										<thead>
										  <tr>
											<th>No.</th>
											<th>电影名称</th>
											<th>上映日期</th>
											<th>类别</th>
											<th>评分</th>
											<th>总票房</th>
										  </tr>
										</thead>
										<tbody>
										 	<c:forEach items="${movieList}" var="u" varStatus="status">
											  <tr>
												<td>${status.count}</td>
												<td class="w3-list-img"><a href="<%=request.getContextPath()%>/movie/single/${u.id}"><img src="<%=request.getContextPath()%>/${u.imgUrl}" alt="${u.movieName}"  style="width: 67px !important;height: 81px;"/> <span>${u.movieName}</span></a></td>
												<td><fmt:formatDate value="${u.showTime}" pattern="yyyy.MM.dd" /></td>
												<td>${u.category}</td>
												<td class="w3-list-info">${u.starRating}</a></td>
												<td class="w3-list-info">Drama</a></td>
											  </tr>
										  	</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
							
						</div>

						</div>
				</div>
			</div>
			<!--//content-inner-section-->


<!--/footer-bottom-->
<jsp:include page="foot.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<!-- Dropdown-Menu-JavaScript -->
<script>
$(document).ready(function(){
	$(".dropdown").hover(            
		function() {
			$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
			$(this).toggleClass('open');        
		},
		function() {
			$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
			$(this).toggleClass('open');       
		}
	);
});
</script>
<!-- //Dropdown-Menu-JavaScript -->
<!-- search-jQuery -->
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();
    });
</script>
<!-- //tables -->


<!--/script-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easing.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
		});
	});
</script>

<!--end-smooth-scrolling-->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

 

</body>
</html>