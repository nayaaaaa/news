<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
	<link rel="shortcut icon " type="images/x-icon" href="./include/img/logo1.ico"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="./include/js/jquery.min.js"></script>
	<script type="text/javascript" src="./include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="./include/js/lrwtab.js"></script>
  </head>
  <body class="easyui-layout">
	  <div data-options="region:'north',border:false" style="background: #ffffff;padding: 0 10px 0 10px;vertical-align: middle;">
		<img src="<%=basePath%>include/img/logo.png" width="126" height="50"/>
		<div style="float: right;line-height: 50px;margin-right: 10px;">
		<a href="#" id="logout" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出</a>
		</div>
		<div style="float: right;line-height: 50px;margin-right: 10px;">登录用户：${me.xm}|</div>
	  </div>
	  <div data-options="region:'west',split:true,title:'系统菜单'" style="width: 180px; padding: 10px;">
		<ul id="menutree" class="easyui-tree"></ul>
	  </div>
	  <div data-options="region:'south',border:false" style="height: 30px;padding: 5px;text-align: center;font-family: arial;color:#A0B1BB;">
		Copyright@ 2017 javaEE.All Right Reserved.
	  </div>
	  <div data-options="region:'center'">
		  <div id="tabs" class="easyui-tabs" fit="true" border="false">
		  </div>
	  </div>
	  <script>
		  var opened_node;
		  $(function(){
			  $('#menutree').tree(
				  {
					  url:"<%=basePath%>menutree",
					  animate:true,
					  onClick:function(node){
						if(!node.attributes){
							if(!opened_node){
								$("#menutree").tree('expand',node.target);
								opened_node = node.target;
							}else if(opened_node != node.target){
								$("#menutree").tree('collapse',opened_node);
								$("#menutree").tree('expand',node.target);
								opened_node = node.target;
							}
						}else{
							swNewTab(node.text,"<%=basePath%>"+node.attributes.url);
						}
					  },
					  onLoadSuccess:function(node,data){
						$("#menutree").tree('expandAll');
					  }
				  });
			  $("#logout").click(function(){
				  top.location.href="<%=basePath%>user/doLogout";
			  });
			  swNewTab('新闻管理',"<%=basePath%>news/goList");
		  });
	  </script>
  </body>
</html>
