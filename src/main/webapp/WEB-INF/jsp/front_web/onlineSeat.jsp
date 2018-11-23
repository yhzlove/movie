<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>在线选座</title>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/SeatCharts/jquery.seat-charts.css" />
<style type="text/css">
.demo{ margin:40px auto 0 auto; min-height:450px;}/*width:700px;*/
@media screen and (max-width: 360px) {.demo {width:340px}}

.front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
.booking-details {float: left;position: relative; }/*width:200px;height: 450px;*/
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
div.seatCharts-row {height: 35px;}
div.seatCharts-seat.available {background-color: #B9DEA0;}
div.seatCharts-seat.focused {background-color: #76B474;border: none;}
div.seatCharts-seat.selected {background-color: #E6CAC4;}
div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}
div.seatCharts-container {border-right: 1px dotted #adadad;padding: 20px;float: left;}/*width: 400px;*/
/* div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;} */
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#selected-seats {max-height: 150px;overflow-y: auto;overflow-x: none;width: 400px;}
#selected-seats li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>
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
								<div class="clearfix"></div>
								</li>
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
		     
<!-- breadcrumb -->
<!-- 	<div class="w3_breadcrumb"> -->
<!-- 	<div class="breadcrumb-inner">	 -->
<!-- 			<ul> -->
<!-- 				<li><a href="<%=request.getContextPath()%>/">主页</a><i>//</i></li> -->
<!-- 				<li><a href="<%=request.getContextPath()%>/">电影</a><i>//</i></li> -->
<!-- 				<li>在线选座</li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- //breadcrumb -->
<!--/content-inner-section-->
<div class="w3_content_agilleinfo_inner">
	<div class="agile_featured_movies" style="padding: 0 12em;">
		<div id="main">
  			<form action="<%=request.getContextPath()%>/order/add.do" method="post">
  				<input type="hidden" name="movie.id" value="${movie.id}">
  				<input type="hidden" name="showFilm.id" value="${showFilm.id}">
		   		<input type="hidden" name="member.id" value="${loginMember.id}">
		   		<input type="hidden" name="price" id="price" value="">
		   		
		   		<!-- 附属座位 -->
<!-- 		   		<input type="hidde" name="seatRow" value=""> -->
<!-- 		   		<input type="hidde" name="seatCol" value=""> -->
		   		
		   		<div class="demo">
			   		<div id="seat-map">
						<div class="front">屏幕</div>					
					</div>
					<div class="booking-details">
						<p>影片：<span>${movie.movieName }</span></p>
	<!-- 					<p>时长：<span>${movie.starRating }</span></p> -->
						<p>时间：<span><fmt:formatDate value="${showFilm.startTime}" pattern="yyyy.MM.dd HH:mm" /></span></p>
						<p>座位：</p>
						<ul id="selected-seats"></ul>
						<p>票数：<span id="counter">0</span></p>
						<p>总计：<b>￥<span id="total">0</span></b></p>
						
						
						<button type="button" class="btn btn-success" onclick="commit();">提交订单</button> 
						<div id="legend"></div>
					</div>
					<div style="clear:both"></div>
		   		</div>
			</form>
		  <br/>
		</div>
	</div>
</div>
<!--//content-inner-section-->
<jsp:include page="foot.jsp"></jsp:include>


<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>	
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


<script type="text/javascript" src="<%=request.getContextPath()%>/js/SeatCharts/jquery.seat-charts.js"></script>
<script type="text/javascript">
var price = ${showFilm.price}; //票价
$(document).ready(function() {
	var $cart = $('#selected-seats'), //座位区
	$counter = $('#counter'), //票数
	$total = $('#total'); //总计金额
	
	var seats = "${hall.seats}";
	var date = new Array();
	date = seats.split(",");// 在每个逗号(,)处进行分解。
	var date_un = new Array();
	<c:forEach items="${showFilm.orderList}" var="u">
		<c:forEach items="${u.orderSeat}" var="uu">
			date_un.push('${uu.seatRow}_${uu.seatCol}');
		</c:forEach>
	</c:forEach>
	var sc = $('#seat-map').seatCharts({
		map: date,
		naming : {
			top : false,
			getLabel : function (character, row, column) {
				return column;
			}
		},
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '可选座' ],
				[ 'a', 'unavailable', '已售出']
			]					
		},
		click: function () { //点击事件
			if (this.status() == 'available') { //可选座
				$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)//确定data/attr的区别
					.attr('row', this.settings.row+1)
					.attr('label', this.settings.label)
					.appendTo($cart);

				$counter.text(sc.find('selected').length+1);
				$total.text(recalculateTotal(sc)+price);
				$("#price").val(recalculateTotal(sc)+price);
				
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
					//更新数量
					$counter.text(sc.find('selected').length-1);
					//更新总计
					$total.text(recalculateTotal(sc)-price);
					$("#price").val(recalculateTotal(sc)-price);	
					//删除已预订座位
					$('#cart-item-'+this.settings.id).remove();
					//可选座
					return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});
	//已售出的座位
	sc.get(date_un).status('unavailable');
		
});
//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
}

function commit(){
	//是否登入系统
	<c:if test="${empty loginMember }">
		alert("清先登入系统!");
		return;
	</c:if>
	
	//ajax  检测是否存在别人已经选择的
	var $form = $("form");
	$("[id^='cart-item-']").each(function(){
		console.log($(this).attr("row"));
		$('<input type="hidden" name="seatRow">')
		.attr('value', $(this).attr("row"))
		.appendTo($form);
		
		$('<input type="hidden" name="seatCol">')
		.attr('value', $(this).attr("label"))
		.appendTo($form);
	});
	
	$form.submit();
}
</script>


</body>
</html>