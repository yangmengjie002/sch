<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<!-- 个人中心的个人收藏的查询与删除 -->
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
</head>
<body>
	<input type="button" value="tijiao" id="aa" />
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '/schResource/collection/select.do',
			onLoadSuccess : true,
			fitColumns : true,
			pagination : true,
			striped : true,
			idField : 'id',
			columns : [ [ {
				field : 'USER_ID',
				title : 'USER_ID',
				width : 100,
				hidden : 'boolean'
			}, {
				field : 'ADD_TIME',
				title : 'ADD_TIME',
				width : 100
			}, {
				field : 'RESOURCE_ID',
				title : 'RESOURCE_ID',
				width : 100,
				hidden : 'boolean'
			}, {
				field : 'RESOURCE_NAME',
				title : 'RESOURCE_NAME',
				width : 100,
			}, {
				field : 'RESOURCE_TYPE_NAME',
				title : 'RESOURCE_TYPE_NAME',
				width : 500
			}, {
				field : 'COLLECT_ID',
				title : 'COLLECT_ID',
				width : 100,
				hidden : 'boolean'
			}
			] ],toolbar: [{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					var rows = $('#dg').datagrid("getSelections");
					//alert(rows[0].RESOURCE_ID);
					if(rows.length>0){
						var resourceId="";
						for (var int = 0; int <rows.length; int++) {
							if(resourceId==""){
								
								resourceId=rows[int].RESOURCE_ID+resourceId;
							}else{
								resourceId=rows[int].RESOURCE_ID+","+resourceId;
							}
						};
					//	alert(resourceId.toString()+"aaa");
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){    
						       // alert('确认删除');
						       // alert(resourceId);
						        $.ajax({
									url : "/schResource/collection/del.do",
									//async: false,  
									type : "post",
									data :{ "resourceId":resourceId},
									dataType : "text",
									success : function(data) {
									//	alert(11);
									if (data == "success") {
										alert(1);
				                            $('#dg').datagrid('clearSelections');  
				                            $.messager.alert("提示", "恭喜您，信息删除成功！", "info");  
				                            $('#dg').datagrid('reload');  
				                        } else {  
				                            $.messager.alert("提示", "删除失败，请重新操作！", "info");  
				                            return;  
				                        }  
									},
									error : function() {
										alert("账号或密码错误，请重新输入");
									}
								});
						    }    
						});  
					}else{
						$.messager.alert('提示','请先选择要删除的记录！','error');
						return;
					} 
					
				}
				
			}]
			
		});
	});
	$('#aa').click(function() {

		alert("aa");
	});
</script>
</html>