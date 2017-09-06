<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/datagrid-detailview.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/icon.css"
	type="text/css"></link>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	.yxTb{
		margin-left: 20%;
	}
</style>
</head>

<body>
	<div>
		<table id="dg">
		</table>
	</div>
	<div>
		<form action="/schResource/institute/insertInst.do" id="instLog" method="post">
		</form>
	</div>
</body>
</html>
<script>
	$(function() {
		
		var selectId = 0;
		var mj = {};
		$('#dg').datagrid({
			url : '/schResource/institute/queryInst.do',
			fitColumns : true,
			singleSelect : true,
			pagination : true,
			height : 520,
			toolbar : [ {
				iconCls : 'icon-add',
				text : '添加院系',
				handler : function() {
					$('#instLog').dialog({    
					    title: '添加院系',    
					    iconCls:'icon-add',
					    width: 500,    
					    height: 300,    
					    closed: false,   
					    sortOrder:'desc',
					    remoteSort: false,
					    cache: false,    
					    modal: true,
					    onOpen:function(){
					    	var yx = "";
					    	yx += "<h2>添加学院</h2>";
					    	yx += "<table class='yxTb' >";
					    	yx += "<tr><td><th>学院名称：<input type='text' name='instName' id='vvName'></th></td></tr>";
					    	yx += "<tr><td><th>现任院长：<input type='text' name='instDean' id='vvDean'></th></td></tr>";
					    	yx += "<tr><td><th>学院人数：<input type='text' name='instNo'   id='vvNo'></th></td></tr><hr/>";
					    	yx += "</table>";
					    	$('#instLog').html(yx);
					    	$('#vvName').validatebox({    
							    required: true,    
							    missingMessage :'请输入学院名称'
							});  
					    	$('#vvDean').validatebox({    
							    required: true,    
							    missingMessage :'请输入院长名称'
							}); 
					    	$('#vvNo').validatebox({    
							    required: true,    
							    missingMessage :'请输入人数'
							});  
					    },
					    buttons:[{
							text:'添加',
							handler:function(){
								$('#instLog').form('submit', {    
								    success:function(data){  
								    	$('#instLog').dialog('close');
								    	$('#dg').datagrid('reload');
								    	$.messager.show({
								    		title:'增加学院成功',
								    		msg:'消息将在5秒后关闭。',
								    		timeout:5000,
								    		showType:'slide'
								    	});
								    },error:function(){
								    	$.messager.alert("警告","添加失败");
								    }    
								});  
							}
						},{
							text:'关闭',
							handler:function(){
								$('#instLog').dialog('close');
							}
						}],
					});    
				}
			}, '-', {
				iconCls : 'icon-help',
				handler : function() {
					alert('帮助按钮')
				}
			} ],
			columns : [ [ {
				field : 'INSTITUTE_NAME',
				title : '学院',
				width : 100
			}, {
				field : 'INSTITUTE_ID',
				title : '学院编号',
				width : 100
			}, {
				field : 'INSTITUTE_DEAN',
				title : '院长',
				width : 100
			}, {
				field : 'INSTITUTE_PERSONNO',
				title : '学院人数',
				width : 100,
				align : 'right'
			} ] ],
			view : detailview,//注意1 
			detailFormatter : function(index, row, INSTITUTE_ID) {
				return '<div style="padding:50px"><table id="ddv-' + index + '"></table></div>';
			},
			onCheck :function(rowIndex, rowData){
				selectId = rowData.INSTITUTE_ID;
				
			},
			
			onExpandRow : function(index, row) {
				
				if(selectId){
					$.ajax({
						async:false,
						url:"${pageContext.request.contextPath}/major/findMj.do",
						type:"post",
						cache:false,
						data: {"selectId":selectId},
						dataType:"JSON",
						success:function(data){
							mj = data;
						}
					});
				}
				console.info(mj);
				//var getId = $("#dg").datagrid("getSelected");
				$('#ddv-' + index).datagrid({
					data:mj,
					singleSelect : true,
					fitColumns : true,
					striped : true ,
					columns : [ [ {
						field : 'MAJOR_ID',
						title : '专业编号',
						width : 100,
						align : 'center'
					}, {
						field : 'MAJOR_NAME',
						title : '专业名称',
						width : 100,
						align : 'center'
					} ] ] 
				});

			}
		});
		
	})
</script>