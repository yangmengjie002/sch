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
<!-- boostrap插件 -->
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap.min.js"></script>
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
 <script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap-datetimepicker.js"></script>
 <script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/locales/bootstrap-datetimepicker.fr.js"></script>
<style>
.panel-header, .panel-body {
	border-width: 0px;
	}
	.datagrid,.combo-p{
	border:solid 1px #D4D4D4;
	}
	.datagrid *{
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}
</style>
</head>

<body>
	<div>
		<table id="getTc"></table>
		
		<table id="tcInfo" ></table>
		<form action='/schResource/teacherStyle/insertTeacher.do' id="addTeacher" method="post" class="form-horizontal">
		</form>
	</div>
</body>
</html>
<script>
	$(function() {

		$('#getTc').datagrid({
			url : '${pageContext.request.contextPath}/teacherStyle/findTeacher.do',
			fitColumns : true,
			striped : true, //奇偶行是否使用不同的颜色
			loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
			pagination : true,//如果表格需要支持分页，必须设置该选项为true
			pageSize : 10, //表格中每页显示的行数
			rownumbers : true, //是否显示行号
			singleSelect : true, //选择一行
			toolbar : [ {
				text : "查看",
				iconCls : 'icon-search',
				handler : function() {
					var rowTeacher = $("#getTc").datagrid("getSelected");
					if(!rowTeacher){
						$.messager.alert("提示信息","请选择一行进行操作!","info");
					}else{
						$("#tcInfo").dialog({
							title: '教师详情',   
						 	iconCls : 'icon-search',
						    width: 800,    
						    height: 600,    
						    closed: false,    
						    cache: false,    
						    modal: true,
						    onOpen : function(){
						    	var str = "";
						    	str += "<h3>教师编号：</h3>"+rowTeacher.TEACHER_ID+"<br>";
						    	str += "<h3>教师名称：</h3>"+rowTeacher.TEACHER_NAME+"<br>";
						    	str += "<h3>教师性别：</h3>"+rowTeacher.TEACHER_SIX+"<br>";
						    	str += "<h3>教师年龄：</h3>"+rowTeacher.TEACHER_AGE+"<br>";
						    	str += "<h3>教师简介：</h3>"+rowTeacher.TEACHER_INFO+"<br>";
						    	str += "<h3>照片路径：</h3>"+rowTeacher.TEACHER_IMAGE+"<br>";
						    	str += "<h3>入职日期：</h3>"+rowTeacher.ENTRY_DATE+"<br>";
						    	$("#tcInfo").html(str);
						    	
						    },
						    buttons : [{
						    	text:'关闭',
						    	iconCls:"icon-no",
						    	handler:function(){
						    		$('#tcInfo').dialog('close');
						    	}
						    }]
							
						});
					}
				}
			}, '-', {
				text : "删除",
				iconCls : 'icon-cut',
				handler : function() {
					var rowTeacher = $("#getTc").datagrid("getSelected");
					if(!rowTeacher){
						$.messager.alert("提示信息","请选择一行进行操作!","info");
					}else{
						var teacher_id = rowTeacher.TEACHER_ID;
						$.messager.confirm('确认','您确认想要删除吗？',function(r){    
						    if (r){    
								$.ajax({
									url: "${pageContext.request.contextPath}/teacherStyle/deleteTeacher.do",
									type:"post",
									cache:false,
									data: {"teacher_id":teacher_id},
									dataType:"text",
									success:function(){
										$.messager.alert("提示信息","删除成功!","ok");
										$("#getTc").datagrid('reload');
									}
									
								});
							}    
						});  
					}
				}

			}, '-', {
				text : "添加",
				iconCls : 'icon-add',
				handler : function() {
					var rowTeacher = $("#getTc").datagrid("getSelected");
					$("#addTeacher").dialog({
							title: '添加名师',   
						 	iconCls : 'icon-add',
						    width: 800,    
						    height: 600,    
						    closed: false,    
						    cache: false,    
						    modal: true,
						    onOpen : function(){
						    	var str = "";
						    	str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>名师姓名：</label>"+
						        "<div class='col-sm-10'><input type='text' class='form-control' name='teacher_name' placeholder='请输入名师姓名'></div></div>";
						    	str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>名师年龄：</label>"+
						        "<div class='col-sm-3'><input type='text' class='form-control' name='teacher_age' placeholder='请输入名师年龄'></div></div>";
						        str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>名师性别：</label>"+
						        "<label class='radio-inline'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' value='男' name='teacher_six'>男</label><label class='radio-inline'><input type='radio' value='女' name='teacher_six'>女</label></div></div>";
						        str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>入职日期：</label>"+
						        "<div class='col-sm-3'><input type='text' class='form-control' name='entry_date' placeholder='请输入入职日期'></div></div>";
						       	str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>名师简介：</label>"+
						        "<div class='col-sm-10'><textarea class='form-control' name='teacher_info' rows='3'></textarea></div></div>";
						        str += "<div class='form-group'><label for='inputEmail3' class='col-sm-2 control-label'>名师照片：</label>"+
						        "<div class='col-sm-10'><input type='text' class='form-control' name='teacher_image' placeholder=''></div></div>";
						        $("#addTeacher").html(str);
						    		   
						    },
						    buttons:[{
								text:'添加',
								iconCls : 'icon-save',
								handler:function(){
									var tsix = $('input:radio:checked').val();
									//alert(tsix);
									$("#addTeacher").submit();
									
								}
							},{
								text:'关闭',
						    	iconCls:"icon-no",
						    	handler:function(){
						    		$('#addTeacher').dialog('close');
						    	}
							}]
					})
				}

			} ],
			columns : [ [ {
				field : 'TEACHER_ID',
				title : '名师编号',
				width : 100,
				align : 'center'
			}, {
				field : 'TEACHER_NAME',
				title : '名师姓名',
				width : 100,
				align : 'center'
			}, {
				field : 'TEACHER_AGE',
				title : '年龄',
				width : 100,
				align : 'center'
			}, {
				field : 'TEACHER_INFO',
				title : '名师简介',
				width : 250,
				align : 'center'
			}, {
				field : 'ENTRY_DATE',
				title : '入职日期',
				width : 100,
				align : 'center'
			} ] ]
		});
		//解决分页组件的中文乱码
		var p = $('#getTc').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10    
			pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表    
			beforePageText : '第',//页数文本框前显示的汉字    
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		});
		$("#getTc").datagrid('reload');
	});

	
</script>