<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
  <link rel="stylesheet" href="http://localhost:9088/schResource/js/easyui/themes/icon.css" type="text/css"></link>
  <link rel="stylesheet" href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css" type="text/css"></link>
  <script type="text/javascript">
  	$(function(){
  		$('#dg').datagrid({    
  		    url:'${pageContext.request.contextPath}/power/allUrl.do',
  		  	fitColumns:true,
  		  	pagination:true,
  		    columns:[[    
  		        {field:'POWER_ID',title:'权限编号',width:100,checkbox:true},    
  		        {field:'POWER_NAME',title:'权限名',width:100},    
  		        {field:'POWER_ROAD',title:'权限路径',width:100},
  		      	{field:'POWER_STATUS',title:'权限状态',width:100,formatter:function(value,row,index){
  		      		if(value == 1){
  		      			return "可用";
  		      		}else{
  		      			return "禁用";
  		      		}
  		      	}},
  		      	{field:'POWER_PID',title:'父级节点',width:100} 
  		    ]],
  		  	toolbar: [{
  		  		text:'增加',
	 			iconCls: 'icon-add',
	 			handler: function(){
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
	 					$("#myform").form("load",{
	 						powerId:rows[0].POWER_ID,
	 						powerKey:rows[0].POWER_KEY,
	 						powerName:rows[0].POWER_NAME,
	 						powerPid:rows[0].POWER_PID,
	 						powerPriority:rows[0].POWER_PRIORITY,
	 						powerRoad:rows[0].POWER_ROAD,
	 						powerView:rows[0].POWER_VIEW
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
	 					alert("请先选择要禁用的权限");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].POWER_ID+";";
	 					}
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/power/delete.do",
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
	 					alert("请先选择要禁用的权限");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].POWER_ID+";";
	 					}
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/power/up.do",
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
  		
  		
  		//父级节点
  		$('#cc').combobox({    
  		    url:'${pageContext.request.contextPath}/power/allUrl.do',
  		  	panelHeight:'auto',
  		    valueField:'POWER_ID',    
  		    textField:'POWER_NAME'   
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
					    url:"${pageContext.request.contextPath}/power/insertOrUpdate.do",    
					    onSubmit: function(param){
					    	
						        var isValid = $(this).form('validate');
						        if (!isValid){
									$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
								}
								return isValid;	// 返回false终止表单提交
					           
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
					        	parent.location.reload();
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
			<p>增加权限</p>
			<table id="table" style="width:100%">
				<tr>
					<th>权限名</th>
					<td><input class="easyui-validatebox"
						data-options="required:true" name="powerName" id="powerName">
					</td>
				</tr>
				<tr>
					<th>权限关键字</th>
					<td><input class="easyui-validatebox"
						data-options="required:true" name="powerKey" id="powerKey">
					</td>
				</tr>
				<tr>
					<th>权限路径</th>
					<td><input class="easyui-validatebox" 
					data-options="required:true" id="powerRoad" name="powerRoad">
					</td>
				</tr>
				<tr>
					<th>是否生成菜单</th>
					<td><select id="powerView" name="powerView">
						<option value="1">是</option>
						<option value="2">否</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>优先级</th>
					<td><input id="powerPriority" name="powerPriority" data-options="required:true" class="easyui-numberbox">
					</td>
				</tr>
				<tr>
					<th>父级节点</th>
					<td><input id="cc" name="powerPid">
					</td>
				</tr>
				<tr>
					<th></th>
					<td><input id="powerId" name="powerId"  type="hidden">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
