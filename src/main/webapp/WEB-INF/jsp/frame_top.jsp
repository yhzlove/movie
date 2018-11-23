<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css">
<script language="javascript" src='<%=request.getContextPath()%>/js/listselect.js'></script>
<title></title>
</head>
<body>
<!---------------头部------------------>
<div class="headwrapper">
<div class="head" style="position:relative;">

	<div class="pullleft" style="position:absolute;">
        
    </div>

	<div class="head_right">
		<!--head_right start-->

		<div class="pullleft">
			<img src="<%=request.getContextPath()%>/images/user.png" style="margin:13px;" class="pullleft" /> 
				<span>${loginUser.realName}</span>&nbsp;&nbsp;
				<a target=_parent href="<%=request.getContextPath()%>/back/logout.do" style="text-decoration:underline; color:#fff;">退出</a>
		</div>
	</div>
</div>
</div>
</body>
</html>
