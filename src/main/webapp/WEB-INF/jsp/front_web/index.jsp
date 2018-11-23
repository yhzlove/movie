<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
<!-- /main-header-->
<jsp:include page="head.jsp"></jsp:include>
<!--/banner-section-->
<!-- 展示海报 -->
<!-- data-zs-src='["images/2.jpg", "images/1.jpg", "images/3.jpg","images/4.jpg"]${imgHeadList}' -->
<div id="demo-1"  >
	<div class="demo-inner-content">
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
							<ul class="dropdown-menu multi-column columns-3" style="width: auto;">
								<li>
								<div class="">
									<ul class="multi-column-dropdown">
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=爱情">爱情片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=动作">动作片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=战争">战争片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=传记">传记片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=犯罪">犯罪片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=家庭">家庭片</a></li>
										<li><a href="<%=request.getContextPath()%>/movie/list.do?category=恐怖">恐怖片</a></li>
									</ul>
								</div>
								<div class="clearfix"></div>
								</li>
							</ul>
						</li>
						<li><a href="<%=request.getContextPath()%>/movie/list.do">实时票房</a></li>
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
						<form action="<%=request.getContextPath()%>/movie/list.do" method="post">
							<input  type="search" name="movieName" placeholder="请输入电影名称...">
						</form>
					</div>
				</div>

		</div> 
		   </div>
	<!--//`er-w3l-->
	</div>
   </div>
<!--/banner-section-->
<!--//main-header-->
	         
	
	
	<!--/内容部分-->
				<div class="w3_content_agilleinfo_inner">
					<div class="agile_featured_movies">
						<!--/agileinfo_tabs-->
					   <div class="agileinfo_tabs">
						<!--/tab-section-->
					    <div id="horizontalTab">
							<ul class="resp-tabs-list">
								<li>最新电影</li><!-- new -->
								<li>高分电影</li><!-- topScore -->
							</ul>
							<div class="resp-tabs-container">
								<div class="tab1">
									<div class="tab_movies_agileinfo">
										<div class="w3_agile_featured_movies">
											<c:forEach items="${movieList_New}" var="u" varStatus="status" begin="0" end="0">
											<!-- /1-循环体 -->
											<div class="col-md-5 video_agile_player">
												<div class="video-grid-single-page-agileits">
													<div > 
													<a href='<%=request.getContextPath()%>/movie/single/${u.id}'>
														<img src="<%=request.getContextPath()%>/${u.imgUrl}" alt="${u.movieName}" class="img-responsive" style="height: 330px;"/>
													 </a>
													</div>
												</div>
									
												<div class="player-text">
													<p class="fexi_header">${u.movieName}</p>
													<p class="fexi_header_para"><span>上映日期<label>:</label></span><fmt:formatDate value="${u.showTime}" pattern="yyyy.MM.dd" /></p>
													<p class="fexi_header_para">
														<span>类别<label>:</label></span>
														${u.category}						
													</p>
													<p class="fexi_header_para fexi_header_para1"><span>评分<label>:</label></span>
														${u.starRating}
													</p>
													<p class="fexi_header_para">
														<span class="conjuring_w3">剧情<label>:</label></span>${u.storyLine}
													</p>
												</div>
										    </div>
										    <!-- //1-循环体 -->
										 	</c:forEach>
										    <div class="col-md-7 wthree_agile-movies_list">
										    	<c:forEach items="${movieList_New}" var="u" varStatus="status" begin="1" >
										    	<!-- /2-循环体 -->
										     	<div class="w3l-movie-gride-agile">
													<a href="<%=request.getContextPath()%>/movie/single/${u.id}" class="hvr-sweep-to-bottom"><img src="<%=request.getContextPath()%>/${u.imgUrl}" title="${u.movieName}" class="img-responsive" alt="${u.movieName}"style="height: 200px;">
														<div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
													</a>
													<div class="mid-1 agileits_w3layouts_mid_1_home" style="background: #02a388;">
														<div class="w3l-movie-text">
															<h6><a href="<%=request.getContextPath()%>/movie/single/${u.id}">${u.movieName}</a></h6>						
														</div>
														<div class="mid-2 agile_mid_2_home">
															<p><fmt:formatDate value="${u.showTime}" pattern="yyyy.MM.dd" /></p>
															<div class="block-stars">
																${u.starRating}
															</div>
															<div class="clearfix"></div>
														</div>
													</div>
													<div class="ribben">
														<p>最新电影</p>
													</div>
												</div>
												<!-- //2-循环体 -->
											 	</c:forEach>
											 </div>
											<div class="clearfix"></div>
										  </div>
										  <div class="cleafix"></div>
									</div>	
								</div>
							<div class="tab2">
								<div class="tab_movies_agileinfo">
										<div class="w3_agile_featured_movies">
											<c:forEach items="${movieList_Top}" var="u" varStatus="status" begin="0" end="0">
											<!-- /1-循环体 -->
											<div class="col-md-5 video_agile_player">
												<div class="video-grid-single-page-agileits">
													<div > 
													<a href='<%=request.getContextPath()%>/movie/single/${u.id}'>
														<img src="<%=request.getContextPath()%>/${u.imgUrl}" alt="${u.movieName}" class="img-responsive" style="height: 330px;"/>
													 </a>
													</div>
												</div>
									
												<div class="player-text">
													<p class="fexi_header">${u.movieName}</p>
													<p class="fexi_header_para"><span>上映日期<label>:</label></span><fmt:formatDate value="${u.showTime}" pattern="yyyy.MM.dd" /></p>
													<p class="fexi_header_para">
														<span>类别<label>:</label></span>
														${u.category}						
													</p>
													<p class="fexi_header_para fexi_header_para1"><span>评分<label>:</label></span>
														${u.starRating}
													</p>
													<p class="fexi_header_para">
														<span class="conjuring_w3">剧情<label>:</label></span>${u.storyLine}
													</p>
												</div>
										    </div>
										    <!-- //1-循环体 -->
										 	</c:forEach>
										    <div class="col-md-7 wthree_agile-movies_list">
										    	<c:forEach items="${movieList_Top}" var="u" varStatus="status" begin="1" >
										    	<!-- /2-循环体 -->
										     	<div class="w3l-movie-gride-agile">
													<a href="<%=request.getContextPath()%>/movie/single/${u.id}" class="hvr-sweep-to-bottom"><img src="<%=request.getContextPath()%>/${u.imgUrl}" title="${u.movieName}" class="img-responsive" alt=" " style="height: 200px;">
														<div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
													</a>
													<div class="mid-1 agileits_w3layouts_mid_1_home" style="background: #02a388;">
														<div class="w3l-movie-text">
															<h6><a href="<%=request.getContextPath()%>/movie/single/${u.id}">${u.movieName}</a></h6>						
														</div>
														<div class="mid-2 agile_mid_2_home">
															<p><fmt:formatDate value="${u.showTime}" pattern="yyyy.MM.dd" /></p>
															<div class="block-stars">
																${u.starRating}
															</div>
															<div class="clearfix"></div>
														</div>
													</div>
													<div class="ribben">
														<p>高分电影</p>
													</div>
												</div>
												<!-- //2-循环体 -->
											 	</c:forEach>
											 </div>
											<div class="clearfix"></div>
										  </div>
										  <div class="cleafix"></div>
									</div>	
							</div>
							
						</div>
					</div>
						
				</div>
				<!--//tab-section-->	
				 	
			
				
			</div>
		</div>
	<!--//内容部分-->
		
	<jsp:include page="foot.jsp"></jsp:include>
	
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<!-- Dropdown-Menu-JavaScript -->
<script>
	$(document).ready(function(){
		
		var igUrls = "[";
		<c:forEach items="${imgHeadList}" var="u" varStatus="status">
			igUrls +='"';
				igUrls += "/movie"+"${u.imgUrl}";
			igUrls +='",';
		</c:forEach>
		igUrls += "]";
		igUrls = igUrls.substring(0, igUrls.lastIndexOf(',')) + igUrls.substr( igUrls.lastIndexOf(',')+1);
		
		$("#demo-1").attr("data-zs-src",igUrls);
		$("#demo-1").zoomSlider();
	    
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
<!-- 图片轮播的js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.zoomslider.min.js"></script>
<!-- search-jQuery -->
<script src="<%=request.getContextPath()%>/js/main.js"></script>
			
<script src="<%=request.getContextPath()%>/js/easy-responsive-tabs.js"></script>
<script>
$(document).ready(function () {
	$('#horizontalTab').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion           
		width: 'auto', //auto or any width like 600px
		fit: true,   // 100% fit in a container
		closed: 'accordion', // Start closed if in accordion view
		activate: function(event) { // Callback function if tab is switched
			var $tab = $(this);
			var $info = $('#tabInfo');
			var $name = $('span', $info);
			$name.text($tab.text());
			$info.show();
		}
	});
	$('#verticalTab').easyResponsiveTabs({
		type: 'vertical',
		width: 'auto',
		fit: true
	});
});
</script>
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