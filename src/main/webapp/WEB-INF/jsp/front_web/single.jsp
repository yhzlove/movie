<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>电影详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- //for-mobile-apps -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/video/css/video-js.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/video/js/video.min.js"></script>

</head>
<body>
<!--/main-header-->
<jsp:include page="head.jsp"></jsp:include>
<!--//main-header-->
<div id="demo-1" class="banner-inner" style="background: url(<%=request.getContextPath()%>/${movie.imgUrl}) no-repeat center center;background-size:cover;">
	<div class="banner-inner-dott">
		<!--/header-w3l-->
		<div class="header-w3-agileits" id="home">
		     <div class="inner-header-agile">	
				<nav class="navbar navbar-default">
				<div class="navbar-header">
					<h1><a  href="主页地址"><span>M</span>ovies</a></h1>
				</div>
				<!-- navbar-header -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
						<li class="active"><a href="index.html">主页</a></li>
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
						
						<li><a href="list.html">实时票房</a></li>
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
				<h3 class="w3l-inner-h-title">${movie.movieName }</h3>
				<p class="w3ls_head_para">${movie.storyLine }</p>
			</div>
			<div class="latest-news-agile-info">
				<div class="col-md-8 latest-news-agile-left-content">
					

					<div class="video-grid-single-page-agileits">
						<div data-video="f2Z65fobH2I" id="video1"> 
							<img src="<%=request.getContextPath()%>/${movie.imgUrl}" alt="${movie.movieName}" class="img-responsive" style="height:80%" /> 
							<c:if test="${not empty movie.videoUrl }">
							<div id="play" onclick="playVideo();"></div>
							</c:if>
						</div>
						<!-- 视频 -->
						<c:if test="${not empty movie.videoUrl }">
						<div data-video="" id="video2" style="display: none;"> 
							<video id="my-video" class="video-js" controls preload="auto" style="width:100%;height:80%"
						  			poster="<%=request.getContextPath()%>/${movie.imgUrl}" data-setup="{}">
 									<source src="<%=request.getContextPath()%>/${movie.videoUrl }" type="video/mp4">
									<source src="<%=request.getContextPath()%>/${movie.videoUrl }" type="video/webm">
									<source src="<%=request.getContextPath()%>/${movie.videoUrl }" type="video/ogg">
 							</video>
						</div>
						</c:if>
					</div>
		
					<div class="player-text">
						<p class="fexi_header">${movie.movieName }</p>
						<p class="fexi_header_para"><span>导演:<label>:</label></span>${movie.director }</p>
						<p class="fexi_header_para"><span>演员:<label>:</label></span>${movie.actor }</p>
						<p class="fexi_header_para"><span>上映日期<label>:</label></span><fmt:formatDate value="${movie.showTime}" pattern="yyyy.MM.dd" /></p>
						<p class="fexi_header_para">
							<span>类别<label>:</label> </span>
							${movie.category } 							
						</p>
						<p class="fexi_header_para fexi_header_para1"><span>评分<label>:</label></span>
							${movie.starRating }
						</p>
					</div>
										    
					
							
						
					<div class="response">
						<h4>影片评论</h4>
						<c:forEach items="${commentList}" var="u" varStatus="status">
						<!-- 循环体 -->
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="<%=request.getContextPath()%>/images/admin.jpg" alt="">
								</a>
								<h5><a href="#">${u.member.realName }</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>${u.content}</p>
								<ul>
									<li><fmt:formatDate value="${u.createTime}" pattern="yyyy.MM.dd HH:mm" /></li>
								</ul>
								
							</div>
							<div class="clearfix"> </div>
						</div>
						<!-- 循环体End -->
						</c:forEach>
					</div>
					<div class="all-comments-info">
						<h5 >留下你的评论</h5>
						<div class="agile-info-wthree-box">
							<form action="<%=request.getContextPath()%>/comment/add.do" id="commentForm" method="post">
							   <input type="hidden" name="member.id" id="commentMid" value="${loginMember.id}">
							   <input type="hidden" name="movie.id" id="commentMoid" value="${movie.id}">
							   
							   <div class="col-md-12 form-info">
									<textarea placeholder="留下你的评论" name="content" id="content"></textarea>
									<input type="button" class="btn btn-success" onclick="commentAdd()" value="提交" >
								</div>
							 <div class="clearfix"> </div>
								
								
							</form>
						</div>
					</div>
				   </div>
				   <div class="col-md-4 latest-news-agile-right-content ">
				   
					  <h4 class="side-t-w3l-agile"><span>场次</span></h4>
					  	<c:forEach items="${showFileList}" var="u" varStatus="status">
						  	<a href="<%=request.getContextPath()%>/showFilm/onlineSeat/${u.id}">
							  	<div class="alert alert-success" role="alert">
									<strong>${u.showFilmName} <fmt:formatDate value="${u.startTime}" pattern="yyyy.MM.dd HH:mm" />-<fmt:formatDate value="${u.endTime}" pattern="HH:mm" /></strong> 
									<p>¥${u.price} 余座:${u.seatCount}</p>
							   	</div>
						   	</a>
					   	</c:forEach>
						
				   </div>
				   <div class="clearfix"></div>
			   </div>
	
		</div>
</div>
<!--//content-inner-section-->

<jsp:include page="foot.jsp"></jsp:include>


<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function commentAdd(){
		<c:if test="${empty loginMember }">
			alert("清先登入系统!");
		</c:if>
		<c:if test="${not empty loginMember }">
			var memberid = $("#commentMid").val();
			var movieid = $("#commentMoid").val();
			var content = $("#content").val();
			$.ajax({
	            type: "POST",
	            url: "<%=request.getContextPath()%>/comment/add.do",
	            data: {'member.id': memberid,'movie.id': movieid,'content':content},
				success: function (msg) {
	                if (msg != "success") {
	                    alert(msg);
	                }else{
	                	location.reload();
	                }
	            },
	        });
		</c:if>
		
	}
	function playVideo(){
		var myPlayer = videojs("my-video");
		myPlayer.play(); 
		$("#video1").hide();
		$("#video2").show();
		
	}
</script>
<!-- search-jQuery -->
<script src="<%=request.getContextPath()%>/js/main.js"></script>
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