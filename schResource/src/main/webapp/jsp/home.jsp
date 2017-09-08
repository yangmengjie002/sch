<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
  <link rel="stylesheet" href="http://localhost:9088/schResource/js/easyui/themes/icon.css" type="text/css"></link>
  <link rel="stylesheet" href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css" type="text/css"></link>
  <!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="http://localhost:9088/schResource/js/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>
<script
	src="http://localhost:9088/schResource/js/ztree/outOfBounds.js"
	type="text/javascript"></script>
	  
	  <script type="text/javascript">
		$(function(){
			$('#tt').tree({    
			    url:'power/url.do',
			    lines:true,
			    onClick: function(node){
					var child = $(this).tree("getChildren",node.target);
					if(child.length==0){
						add(node.text,node.attributes.url);
					}
				}     
			});
			function add(title,url){
				var tab = $('#tab').tabs('getTab',title);
				if(tab){
					$('#tab').tabs("select",title);
				}else{
					$('#tab').tabs('add',{    
					    title:title,    
					    content:"<iframe src='jsp/"+url+"' width='100%' height='100%' frameborder=0>",    
					    closable:true,    
					    tools:[{    
					        iconCls:'icon-mini-refresh',    
					        handler:function(){    
					        	var current_tab = $('#tab').tabs('getSelected');
					        	$('#tab').tabs('update',{
					        	     tab:current_tab,
					        	     options : {
					        	          content : '<iframe scrolling="auto" frameborder="0"  src="jsp/'+url+'" style="width:100%;height:100%;"></iframe>',
					        	     }
					        	});    
					        }    
					    }]    
					}); 
				} 
			}	
			
		
		// 页面加载后 右下角 弹出窗口
		/**************/
		window.setTimeout(function(){
			$.messager.show({
				title:"消息提示",
				msg:'欢迎登录，${user.userName}！ <a href="javascript:void" onclick="top.showAbout();">联系管理员</a>',
				timeout:5000
			});
		},3000);
		/*************/
		
		$("#btnCancel").click(function(){
			$('#editPwdWindow').window('close');
		});
			
			
			
			
			
			// 退出登录
			$("#logoutFun").click(function(){
				$.messager.confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
					if (isConfirm) {
						location.href = '${pageContext.request.contextPath }/user/logout.do';
					}
				});
			});
			
			// 修改密码
			$("#editPassword").click(function(){
				$('#dd').dialog('open');
			});
			// 版权信息
			$("#showAbout").click(function(){
				$.messager.alert("共享平台 v1.0","管理员邮箱: 15030632531@163.com");
			});		
			$('#dd').dialog({    
			    title: '密码修改',    
			    width: 300,    
			    height: 250,    
			    closed: true,    
			    cache: false,      
			    modal: true,
			    buttons:[{
					text:'保存',
					handler:function(){
						$.messager.progress();
						$('#myform').form('submit', {    
						    url:"${pageContext.request.contextPath}/user/updatePwd.do",    
						    onSubmit: function(param){
						    	var v1 = $("#txtNewPass").val();
								var v2 = $("#txtRePass").val();
								if(v1 != v2){
									$.messager.alert("提示信息","两次输入密码不一致！","warning");
									$.messager.progress('close');
									return false;
								}
								param.pwd = v1;
								var isValid = $(this).form('validate');
						        if (!isValid){
									$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
								}
								return isValid;	// 返回false终止表提交 			             
						    },  
						    success:function(data){		        
						        if(data=="success"){
						        	$('#dd').dialog("close");
						        	$('#classInfo').dialog("close");
						        	$.messager.progress('close');	// 如果提交成功则隐藏进度条
						        	alert("编辑成功");
						        	$('#dg').datagrid("reload");  	
						        }         
						    }    
						});
					}
				},{
					text:'取消',
					handler:function(){
						if(confirm("确定取消吗？")){
							$('#dd').dialog("close");
						}
					}
				}] 
			});
		});
	</script>
  </head>
	 <body class="easyui-layout">   
	   <div data-options="region:'north',title:'',split:false" style="height:80px;padding:10px;background:url('/schResource/images/header_bg.png') no-repeat right;">
			<div>
				<img src="/schResource/images/logo1.png" height="60"  border="0">
				<img src="/schResource/images/log.png" height="60"  border="0">
			</div>
			<div id="sessionInfoDiv"
			style="position: absolute;right: 30px;top:10px;">
			[<strong>${user.userName}</strong>]，欢迎你！
		</div>
		<div style="position: absolute; right: 30px; bottom: 10px; ">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
		</div>
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div id ="editPassword">修改密码</div>
			<div id="showAbout">联系管理员</div>
			<div class="menu-sep"></div>
			<div id="logoutFun">退出系统</div>
		</div>
	   </div>   
	   <div data-options="region:'south',border:false"
		style="height:50px;padding:10px;background:url('/schResource/images/header_bg.png') no-repeat right;">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;">
							 Powered by 第二组
						</div>
					</td>
					<td style="width: *;" class="co1"><span id="online"
						style="background: url('/schResource/images/online.png') no-repeat left;padding-left:18px;margin-left:3px;font-size:8pt;color:#005590;">在线人数:1</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div> 
	   <div data-options="region:'west',title:'系统菜单',split:true" style="width:160px;">
	   	<div class="easyui-accordion" fit="true" border="false">
			<div title="基本功能" data-options="iconCls:'icon-mini-add'" style="overflow:auto">
				<ul id="tt"></ul>
			</div>
		</div>
	   			   		
	   </div>   
	   <div data-options="region:'center',title:''" style="padding:0px;background:#eee;">
	   		<div id="tab" class="easyui-tabs" fit="true" border="false">   
			    <div title="Tab1" style="padding:20px;display:none;">   
			        欢迎   ${user.userName}登录
			    </div>   
			</div> 
			<!--修改密码窗口-->
		    <div id="dd">
				<form id="myform" method="post">
					<p>密码修改</p>
					<table cellpadding=3>
	                    <tr>
	                        <td>新密码：</td>
	                        <td><input id="txtNewPass" type="Password" class="txt01 easyui-validatebox" 
	                        	required="true" data-options="validType:'length[4,8]'"
	                        /></td>
	                    </tr>
	                    <tr>
	                        <td>确认密码：</td>
	                        <td><input id="txtRePass" type="Password" class="txt01 easyui-validatebox" 
	                        	required="true" data-options="validType:'length[4,8]'"
	                        /></td>
	                    </tr>
	                </table>
				</form>
			</div> 
	   </div>
	</body>  
</html>

