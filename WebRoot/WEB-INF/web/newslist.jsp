<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻列表</title>
    <meta charset="UTF-8"/>
	<link rel="shortcut icon " type="images/x-icon" href="./include/img/logo1.ico"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="./include/js/jquery.min.js"></script>
	<script type="text/javascript" src="./include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./include/easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
	  <table id="dg" cellpadding="2"></table>
	  <div id="tb" style="padding:5px;">
		<input type="text" id="s_name" class="easyui-textbox" data-options="prompt:'标题关键字...'" style="widows: 200px;height: 32px;">
		<a href="#" id="s_news" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	  </div>
  </body>
  <script>
	  var s_name="",id="",title="";
	  function loadGrid(){
		  s_name=$("#s_name").val();
		  $("#dg").datagrid({
			  width:800,height:500,nowrap:false,
			  striped:true,border:true,collapsible:false,
			  url:"<%=basePath%>news/listNews",
			  queryParams:{"s_name":s_name},
			  pagination:true,
			  rownumbers:true,
			  fitColumns:true,pageSize:20,
			  loadMsg:'数据加载中...',
			  columns:[[
				  {
					  title:'标题',field:'title',width:200,formatter:function(value,row,index){
						  return '<span style="white-space:nowrap;" title='+value+'>'+(value?value:'')+'</span>';
					}},
				  {
					  title:'发布时间',field:'tjdata',width:100,formatter:function(value,row,index){
						  return(new Date(row.tjdate).Format("yyyy-MM-dd hh:mm"));
				  	}},
				  {
					  title:'操作',field:'hitnum',width:100,formatter:function(value,row,index){
						var p="<a href=\"javascript:editNews('"+row.id+"')\">修改</a>";
						p+="|<a href =\"javascript:delNews('"+row.id+"','"+row.title+"')\">删除</a>";
						return p;
				  }}
			  ]],
			  toolbar:'#tb'
		  });
	  }
	  function editNews(id){
		  parent.swNewTab("修改新闻信息","<%=basePath%>news/goEdit?id="+id);
	  }
	  function delNews(newsid,title0){
		  id = newsid;
		  title = title0;
		  parent.$.messager.confirm("系统提示","您确定要删除“"+title+"”吗？",function(r){
			  if(r){
				$.ajax({
					url:"<%=basePath%>news/doDell",
					data:{"id":id},
					type:"post",
					success:function(res){
						if(res.delflag){
							parent.$.messager.alert("系统提示","您已删除新闻："+title,"info");							
							id="";s_name="";
							loadGrid();
						}else{
							parent.$.messager.alert("系统提示",res,"error");
						}
						return false;
					},
					error:function(res){
						parent.$.messager.alert("系统提示","系统错误-newlist-delNews函数","error");
						}
			  })
			}
		});
	  }
	  $(function(){
		  loadGrid();
		  $("#s_name").click(function(){
			  s_name=$("#s_name").val();
			  loadGrid();
		  });
		  $("#tb").bind("keydown",function(e){
			  var theEvent = e||window.event;  //兼容FF IE Opera
			  var codee = theEvent.keyCode||theEvent.which||theEvent.charCode;
			  if(code == 13){
				  $("s_news").click();
			  }
		  });
	  });
  </script>
</html>
