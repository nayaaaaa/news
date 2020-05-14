<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="UTF-8"/>
	<title>看新闻</title>
	<link rel="shortcut icon " type="images/x-icon" href="<%=basePath%>include/img/logo1.ico"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/news.css">
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
  </head>

  <body>
	  <div style="background: #B3DFDA; padding:0 10px; vertical-align: middle;">
		<img src="<%=basePath%>include/img/logo.png" width="126" height="50" />
		<div style="float: right; line-height: 50px; margin-right: 10px; font-size: 9pt;">
			<span>【</span><a style="color: blue;" href="javascript.window.close();"><span>关闭窗口</span></a><span>】</span>
		</div>
	  </div>
	  <div class="ndetail">
		  <div class="ntitle">${news.title}</div>
		  <div class="nauthor">
			<div>
				来源:&nbsp;<strong>${news.cruser}</strong>&nbsp;&nbsp;发布时间:&nbsp;<strong><fmt:formatDate value="${news.tjdate}" pattern="yyyy-MM-dd"/></strong>&nbsp;&nbsp;访问量&nbsp;<strong>[<span>${news.hitnum}</span>]</strong>
			</div>
		  </div>
		  <div class="nbody">
			  <div id="vsb_content">${news.content}</div>
		  </div>
	  </div>
  </body>
</html>
