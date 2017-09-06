<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/icon.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css"
	type="text/css"></link>
<script type="text/javascript">
  	$(function(){
  		$('#dg').datagrid({    
  		    url:'${pageContext.request.contextPath}/role/allUrl.do',
  		  	fitColumns:true,
  		  	pagination:true,
  		    columns:[[    
  		        {field:'ROLE_ID',title:'角色编号',width:100,checkbox:true},    
  		        {field:'ROLE_NAME',title:'权限名',width:100},    
  		        {field:'USER_ROLE_KEYWORDS',title:'关键字',width:100},
  		      	{field:'USER_ROLE_STATUS',title:'权限状态',width:100,formatter:function(value,row,index){
  		      		if(value == 1){
  		      			return "可用";
  		      		}else{
  		      			return "禁用";
  		      		}
  		      	}}
  		    ]],
  		  	toolbar: [{
  		  		text:'增加',
	 			iconCls: 'icon-add',
	 			handler: function(){
	 				//授权------------------
	 				$('#tt').tree({    
	 				    url:'${pageContext.request.contextPath}/role/url.do',
	 				    lines:true,
	 				    checkbox:true 
	 				});
	 				$('#dd').dialog("open");
	 				$("#myform").form("clear");
	 			}
	 		},'-',{
	 			text:'编辑',
	 			iconCls: 'icon-edit',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length != 1){
	 					alert("只能对一行进行编辑，请重新选择");
	 					$('#dg').datagrid("clearChecked");
	 				}else{
	 					$("#dd").dialog("open");
	 					$("#myform").form("clear");
	 					//授权------------------
		 				$('#tt').tree({    
		 				    url:'${pageContext.request.contextPath}/role/url.do?roleId='+rows[0].ROLE_ID,
		 				   	cascadeCheck:false,
		 				    lines:true,
		 				    checkbox:true 
		 				});
		 				var node = $('#tt').tree('getSelected');//获取根节点
		 				console.info(node);
						if (node){
							$('#tt').tree('expandAll', node.target);
						} else {
							$('#tt').tree('expandAll');
						}	
	 					$("#myform").form("load",{
	 						roleId:rows[0].ROLE_ID,
	 						userRoleKeywords:rows[0].USER_ROLE_KEYWORDS,
	 						roleName:rows[0].ROLE_NAME,
	 						rolePid:rows[0].ROLE_PID
	 					});
	 					
	 								
	 				}
	 			}
	 		},'-',{
	 			text:'禁用',
	 			iconCls: 'icon-remove',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length==0){
	 					alert("请先选择要禁用的角色");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].ROLE_ID+";";
	 					}
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/role/delete.do",
	 						data:{"arr":arr},
	 						type:"post",
	 						success:function(data){
	 							if(data=="success"){
	 								alert("禁用成功");
	 								$('#dg').datagrid("reload");
	 							}
	 						}
	 					});
	 				}
	 			}
	 		},'-',{
	 			text:'启用',
	 			iconCls: 'icon-back',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length==0){
	 					alert("请先选择要启用的角色");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].ROLE_ID+";";
	 					}
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/role/up.do",
	 						data:{"arr":arr},
	 						type:"post",
	 						success:function(data){
	 							if(data=="success"){
	 								alert("启用成功");
	 								$('#dg').datagrid("reload");
	 							}
	 						}
	 					});
	 				}
	 			}
	 		}]
  		});
  		
  		
		$('#dd').dialog({    
		    title: '添加权限',    
		    width: 400,    
		    height: 300,    
		    closed: true,    
		    cache: false,      
		    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					$.messager.progress();
					$('#myform').form('submit', {    
					    url:"${pageContext.request.contextPath}/role/insertOrUpdate.do",    
					    onSubmit: function(param){
					    	var nodes = $('#tt').tree('getChecked', ['checked','indeterminate']);
							console.info(nodes);
							var arr="";
							for(var i=0;i<nodes.length;i++){
								arr += nodes[i].id + ";";
							}
				    		param.arr = arr;
				    		console.info(param);
					        var isValid = $(this).form('validate');
					        if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表提交      
					    },  
					    success:function(data){ 
					        if(data=="success1"){
					        	$('#dd').dialog("close");
					        	$('#classInfo').dialog("close");
					        	$.messager.progress('close');	// 如果提交成功则隐藏进度条
					        	alert("添加成功");
					        	$('#dg').datagrid("reload");  	
					        } 
					        
					        if(data=="success2"){
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
<body>
	<table id="dg"></table>
	<div id="dd">
		<form id="myform" method="post">
			<p>增加角色</p>
			<table id="table" style="width: 100%">
				<tr>
					<th>角色名</th>
					<td><input class="easyui-validatebox"
						data-options="required:true" name="roleName" id="roleName">
					</td>
				</tr>
				<tr>
					<th>角色关键字</th>
					<td><input class="easyui-validatebox"
						data-options="required:true" name="userRoleKeywords"
						id="userRoleKeywords"></td>
				</tr>
				<tr>
					<th>授权</th>
					<td>
						<ul id="tt"></ul>
					</td>
				</tr>
				<tr>
					<th></th>
					<td><input id="roleId" name="roleId" type="hidden"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>