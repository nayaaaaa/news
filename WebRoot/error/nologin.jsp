<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>无效访问</title>
	
	<meta charset="UTF-8"/>
	<link rel="shortcut icon " type="images/x-icon" href="./include/img/logo1.ico"/>
	<link rel="stylesheet" href='<%=basePath%>include/css/404.css?family=Love+Ya+Like+A+Sister' type="text/css">
	<script src="<%=basePath%>include/js/jquery.min.js" type="text/javascript"></script>
  </head>
  
  <body>
	  <div class="warp">
		  <div class="logo">
			  <div class="errcode"><span>out</span></div>
			  <p>对不起，您没有登录或者登录已超时！！！</p>
			  <div class="sub">
				  <p><a href="###" id="index">返回首页</a></p>
			  </div>
		  </div>
	  </div>
	  <script type="text/javascript">
	$("#index").click(function(){
		reDo();
	});
	setTimeout(reDo,5000);
	function reDo(){top.location.href = "<%=basePath%>";}
	</script>
  </body>
</html>
