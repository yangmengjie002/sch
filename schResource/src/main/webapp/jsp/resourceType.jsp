<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
  		    url:"${pageContext.request.contextPath}/resourceType/typeInfo.do",
  		  	fitColumns:true,
  		  	fit:true,
  		  	pagination:true,
  		    columns:[[    
  		        {field:'RESOURCE_TYPE_ID',title:'资源类型编号',width:100,checkbox:true},    
  		        {field:'RESOURCE_TYPE_NAME',title:'资源类型名',width:100},    
  		        {field:'RESOUTCE_TYPE_SIZE',title:'上传资源大小限制/KB',width:100},
  		        {field:'resourcePostfix',title:'上传资源后缀',width:200},
  		      	{field:'RESOURCE_TYPE_STATUS',title:'权限状态',width:100,formatter:function(value,row,index){
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
	 					$("#myform").form("load",{
	 						resourceTypeId:rows[0].RESOURCE_TYPE_ID,
	 						resourceTypeName:rows[0].RESOURCE_TYPE_NAME,
	 						resourceTypeSize:rows[0].RESOUTCE_TYPE_SIZE,
	 						resourcePostfix:rows[0].resourcePostfix
	 					});			
	 					var node = $('#tt').tree('getSelected');//获取根节点
						if (node){
							$('#tt').tree('expandAll', node.target);
						} else {
							$('#tt').tree('expandAll');
						}				
	 				}
	 			}
	 		},'-',{
	 			text:'禁用',
	 			iconCls: 'icon-remove',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length==0){
	 					alert("请先选择要禁用的资源类型");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].RESOURCE_TYPE_ID+";";
	 					}
	 					alert(arr);
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
	 		}]
  		});
  		
  		$('#dd').dialog({    
		    title: '添加资源类型',    
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
					    url:"${pageContext.request.contextPath}/resourceType/insertOrUpdate.do",    
					    onSubmit: function(param){
					    	param.resourceTypeName = $("#resourceTypeName").val();
					    	param.resourceTypeSize = $("#resourceTypeSize").val();
					    	param.resourcePostfix = $("#resourcePostfix").val();
					    	param.resourceTypeId = $("#resourceTypeId").val();
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
		
  		$.extend($.fn.validatebox.defaults.rules, {    
  			 numberId: {
  		        validator: function (value, param) {
  		            if(!/^[a-zA-Z,]+[,]$/.test(value)){
  		                $.fn.validatebox.defaults.rules.numberId.message = '输入后缀字符串以逗号分隔，以逗号结尾';
  		                return false;
  		            }else{
  		            	 $.fn.validatebox.defaults.rules.numberId.message = '格式正确';
  		           		return true;
  		            }
  		        },
  		        message: ''
  		    }

  		}); 
  		

  	});
  </script>
</head>
<body>
	<table id="dg"></table>
	<div id="dd">
		<form id="myform" method="post">
			<p>增加资源类型</p>
			<table id="table" style="width: 100%">
				<tr>
					<th>资源名</th>
					<td><input class="easyui-validatebox"
						data-options="required:true" name="resourceTypeName" id="resourceTypeName">
					</td>
				</tr>
				<tr>
					<th>资源类型大小限制</th>
					<td><input class="easyui-numberbox"
						data-options="required:true" name="resourceTypeSize"
						id="resourceTypeSize"></td>
				</tr>
				<tr>
					<th>资源类型后缀</th>
					<td><input class="easyui-validatebox" 
						data-options="validType:'numberId[6]'" name="resourcePostfix"
						id="resourcePostfix"></td>
				</tr>
				<tr>
					<th></th>
					<td><input id="resourceTypeId" name="resourceTypeId" type="hidden"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>