<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/css.css">
<title></title>
</head>

<body>
	<!---------------左侧----------------->
	<div class="left" id="left">
		<!--left start-->


		<div id="Menu">
			<div class="Menutbg_1 cursor" onclick="SwitchMenu('1')">
				<img src="<%=request.getContextPath()%>/images/sidebar-icon1.png" />系统功能
			</div>
			<ul id="1" class="submenu">
				<li><a href="<%=request.getContextPath()%>/user/back/list.do" target='mainFrame'>用户管理</a></li>
				<li><a href="<%=request.getContextPath()%>/member/back/list.do" target='mainFrame'>会员管理</a></li>
			</ul>
			<div class="Menutbg_1 cursor" onclick="SwitchMenu('2')">
				<img src="<%=request.getContextPath()%>/images/sidebar-icon3.png" />影院基础
			</div>
			<ul id="2" class="submenu">
				<li><a href="<%=request.getContextPath()%>/hall/back/list.do" target='mainFrame'>影厅管理</a></li>
				<li><a href="<%=request.getContextPath()%>/showFilm/back/list.do" target='mainFrame'>场次管理</a></li>
				<li><a href="<%=request.getContextPath()%>/order/back/list.do" target='mainFrame'>订单管理</a></li>
				</li>
			</ul>

			<div class="Menutbg_1 cursor" onclick="SwitchMenu('3')">
				<img src="<%=request.getContextPath()%>/images/sidebar-icon9.png" />电影管理
			</div>
			<ul id="3" class="submenu">
				<li><a href="<%=request.getContextPath()%>/movie/back/list.do" target='mainFrame'>电影管理</a></li>
				<li><a href="<%=request.getContextPath()%>/comment/back/list.do" target='mainFrame'>留言查询</a></li>
			</ul>
			
			<div class="Menutbg_1 cursor" onclick="SwitchMenu('4')">
				<img src="<%=request.getContextPath()%>/images/sidebar-icon4.png" />票房查询
			</div>
			<ul id="4" class="submenu">
				<li><a href="<%=request.getContextPath()%>/movie/back/boxOffice/day.do" target='mainFrame'>日票房</a></li>
				<li><a href="<%=request.getContextPath()%>/movie/back/boxOffice/mouth.do" target='mainFrame'>月票房</a></li>
				<li><a href="<%=request.getContextPath()%>/movie/back/boxOffice/year.do" target='mainFrame'>年票房</a></li>
				<li><a href="<%=request.getContextPath()%>/movie/back/boxOffice/all.do" target='mainFrame'>总票房</a></li>
			</ul>

		</div>
	</div>
	<!--left end-->

	<!--right end-->
	<script>
		total = document.documentElement.clientHeight;
		colHeight = total - 1 - document.getElementById("left").offsetTop;
		document.getElementById("left").style.height = colHeight + "px";
		document.getElementById("right").style.height = colHeight + "px";
	</script>
	<script language="javascript">
		//菜单隐藏与显示
		function SwitchMenu(obj) {
			if (document.getElementById) {
				var el = document.getElementById(obj);
				var ar = document.getElementById("Menu").getElementsByTagName(
						"ul");
				var dr = document.getElementById("Menu").getElementsByTagName(
						"div");
				for (var i = 0; i < dr.length; i++) {
					dr[i].className = "Menutbg_1 cursor";
				}
				if (el.style.display != "block") {
					for (var i = 0; i < ar.length; i++) {
						if (ar[i].className == "submenu")
							ar[i].style.display = "none";
					}
					el.style.display = "block";
					event.srcElement.className = "Menutbg_2 cursor";
				} else {
					el.style.display = "none";
					event.srcElement.className = "Menutbg_1 cursor";
				}
			}
		}
	</script>
</body>
</html>
