<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<frameset rows="50,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=request.getContextPath()%>/back/top.do" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset rows="*" cols="205,*" framespacing="0" frameborder="no" border="0">
    <frame src="<%=request.getContextPath()%>/back/menu.do" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame"/>
    <frame src="<%=request.getContextPath()%>/movie/back/boxOffice/all.do" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="auto" noresize="noresize" />
  </frameset>
</frameset>
</html>
</html>
