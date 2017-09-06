<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/icon.css"
	type="text/css"></link>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
		textarea{
			width:220px;
			height:160px;
		}
	</style>

</head>
<body>
	<div>
		<!-- 获取资讯表数据 -->
		<table id="dg"></table>
		<!-- 添加一条资讯 -->
		<form action=${pageContext.request.contextPath}/insertInfo.do id="addInfo" method="post"></form>
	</div>
</body>
</html>
<script>
$(function(){
	$('#dg').datagrid({
		url : '${pageContext.request.contextPath}/informationManage.do',
		fitColumns : true,
		striped : true, //奇偶行是否使用不同的颜色
		loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
		pagination : true,//如果表格需要支持分页，必须设置该选项为true
		pageSize : 10, //表格中每页显示的行数
		rownumbers : true, //是否显示行号
		singleSelect : true, //选择一行
		toolbar : [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				$('#addInfo').dialog({
					 	title: '添加资讯',   
					 	iconCls : 'icon-add',
					    width: 500,    
					    height: 300,    
					    closed: false,    
					    cache: false,    
					    modal: true,
					    onOpen : function(){
					    	var str = "";
					    	str += "资讯标题：<input name='informationTitles' id='informationTitles' type='text'/><br/>";
					    	str += "资讯内容：<textarea name='informationContents' id='informationContents'/><br/>";
					    	$('#addInfo').html(str);
					    	
					    } ,
					    buttons:[{
					    	text:'保存',
					    	iconCls:"icon-save",
					    	handler:function(){
					    		alert($("#informationTitles").val());
					    		alert($("#informationContents").val());
					    		$("#addInfo").submit();
					    	}
					    } ,{
					    	text:'关闭',
					    	iconCls:"icon-no",
					    	handler:function(){
					    		$('#addInfo').dialog('close');
					    	}
					    }]

				});
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-cut',
			handler : function() {
				var row = $('#dg').datagrid('getSelected');
				if(!row){
					$.messager.alert("提示信息","请选择一行进行删除!","info");
				}
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-save',
			handler : function() {
				var row = $('#dg').datagrid('getSelected');
				if(!row){
					$.messager.alert("提示信息","请选择一行进行修改!","info");
				}
			}
		} ],
		columns : [ [ {
			field : 'informationID',
			title : '资讯编号',
			width : 100,
			align : 'center'
		}, {
			field : 'informationTitle',
			title : '资讯标题',
			width : 100,
			align : 'center'
		}, {
			field : 'informationContent',
			title : '资讯内容',
			width : 100,
			align : 'center'
		}, {
			field : 'user_id',
			title : '撰写人',
			width : 100,
			align : 'center'
		} ] ]
	});
	//解决分页组件的中文乱码
	var p = $('#dg').datagrid('getPager'); 
	$(p).pagination({  
                pageSize: 10,//每页显示的记录条数，默认为10    
                pageList: [5, 10, 15],//可以设置每页记录条数的列表    
                beforePageText: '第',//页数文本框前显示的汉字    
                afterPageText: '页    共 {pages} 页',  
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
    }); 
	 
	
	//添加资讯信息

	$('#dg').datagrid('reload'); // 重新载入当前页面数据
});
</script>