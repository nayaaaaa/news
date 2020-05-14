<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="UTF-8"/>
    <title>修改新闻</title>

	<link rel="shortcut icon " type="images/x-icon" href="./include/img/logo1.ico"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="./include/js/jquery.min.js"></script>
	<script type="text/javascript" src="./include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./include/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" charset="UTF-8" src="./include/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="UTF-8" src="./include/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>var base="<%=basePath%>";</script>
	<script type="text/javascript" charset="UTF-8" src="./include/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="UTF-8" src="./include/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="UTF-8" src="./include/ueditor/lang/zh-cn/zh-cn.js"></script>
  </head>
  
  <body>
    <div class="easyui-panel" style="padding: 5px 2px;">
		<form>
			<table cellpadding="5">
				<tr><td style="width: 100px;">新闻标题：</td><td style="width: 880px;">
					<input id="title" class="easyui-textbox" data-options="prompt:'新闻标题',required:true" style="width: 90%;height: 32px;">
				</td></tr>
				<tr><td>新闻发布者：</td><td>
					<input id="cruser" class="easyui-textbox" data-options="prompt:'发布人',required:true" style="width: 90%;height: 32px;">
				</td></tr>
				<tr><td style="vertical-align:top;">新闻内容：</td><td>
					<script id="content" type="text/plain" style="width: 89%;height: 300px;"></script>
				</td></tr>
			</table>
		</form>
		<div style="text-align: center;">
			<a href="#" id="savenews" class="easyui-linkbutton" iconCls="icon-ok" style="width: 132px;height: 32px;">保存</a>
		</div>
		</div>
		<script type="text/javascript">
			var ue;
			$(function(){
				ue = UE.getEditor('content');
				$("#title").textbox("setValue","$(news.title)");
				ue.ready(function(){
					ue.setContent("");
					ue.execCommand('insertHtml','${news.content}');
				});
				$("#cruser").textbox("setValue","${news.cruser}");
				$('#savenews').click(function(){
					var a=$("#title").textbox("getValue");
					var b=ue.getContent();
					var c=$("#cruser").textbox("getValue");
						if(a.length<=0){$.messager.alert("系统提示","必须填写新闻标题","warning");
						return;
						}
						if(b.length<=0){$.messager.alert("系统提示","必须填写新闻内容","warning");
						return;
						}
						if(c.length<=0){$.messager.alert("系统提示","必须填写发布人姓名或发布机构名称","warning");
						return;
						}
						$ajax({
							type:'POST',
							url:"<%=basePath%>news/saveEdit",
							data:{"title":a,"content":b,"cruser":c},
							success:function(res){
								if(res.ok){
									parent.$.messager.alert("系统提示","你已修改新闻:"+$("#title").val(),"info");
								}else{
									parent.$.messager.alert("系统提示","修改失败！","error");
									}
								return false;
							},
							error:function(res){
								parent.$.messager.alert("系统提示","系统错误!newsadd-ajax","error");
							}
						});
				});
			});
			</script>
  </body>
</html>
