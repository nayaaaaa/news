<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>简易新闻发布系统</title>
	<link rel="shortcut icon " type="images/x-icon" href="./include/img/logo1.ico"/>
	<link rel="stylesheet" type="text/css" href="./include/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="./include/js/jquery.min.js"></script>
	<script type="text/javascript" src="./include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script>var base="<%=basePath%>";</script>
	<script src="./include/js/login.js"></script>
  </head>
  <body>
	  <div style="float: right;padding-right: 20px;">
		<a id="a" href="#" style="margin-right:15px;">登录</a><a href="#" id="b">新闻</a>
	  </div>
	  <div class="login">
		  <div id="llogin" class="box">
			  <div class="logo png"></div>
			  <div class="input">
				  <div class="log" id="login_form">
					  <div class="name">
						  <label>用户名</label><input type="text" class="text" id="uid" placeholder="用户名" tabindex="1"/>
					  </div>
					  <div class="pwd">
						  <label>密   码</label><input type="password" class="text" id="pwd" placeholder="密码" tabindex="2"/>
						  <input id="login_submit" type="button" class="submit" tabindex="3" value="登录"/>
						  <div class="check"></div>
					  </div>
					  <div class="tip"></div>
				  </div>
			  </div>
		  </div>
		  <div id="lnews" class="l-wrap">
			  <div>
				  <div>
					  <div class="l-news">
						  <div class="nheader">
							  <table cellspacing="0" cellpadding="0"><tbody>
								  <tr><td><h3>通知新闻：</h3></td></tr>
							  </tbody></table>
						  </div>
						  <div class="nlist">
							  <table id="newstable" width="100%">
								  <tbody>
									  <tr id="trpp"><td colspan="3" align="left"></td></tr>
								  </tbody>
							  </table>
						  </div>
						  <div id="pp" style="background: #efefef;"></div>
					  </div>
				  </div>
			  </div>
		  </div>
		  <div class="air-balloon ab-1 png"></div>
		  <div class="air-balloon ab-2 png"></div>
		  <div class="footer"></div>
	  </div>
	</body>
</html>
