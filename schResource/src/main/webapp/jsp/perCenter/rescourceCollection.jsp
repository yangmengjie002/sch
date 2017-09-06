<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/easyui/jquery.min.js"></script>

<link href="../../js/fileinput/css/bootstrap.css" rel="stylesheet"
	media="screen"></link>

<script type="text/javascript" src="../../js/bootstrap/bootstrap.js"></script>
<link rel="stylesheet"
	href="../../js/bootstrap/bootstrap-table/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" href="../../js/fileinput/css/fileinput.css"
	type="text/css">
<link />
<script type="text/javascript" src="../../js/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="../../js/fileinput/js/locales/zh.js"></script>
<style>
</style>
<script type="text/javascript">
	window.onload = function() {
		select();
	};
	function select(){
		alert("aa");
	 $.ajax({
		url : "/schResource/collection/select.do",
		type : "post",
		
		//data:{"foodname":$(this).val()},
		dataType : "json",
		success : function(data) {
			 alert(data.total);
			alert(data.rows[0].ADD_TIME);
			var str = "";
			str+="<div>共有"+data.total+"条记录</div>";
			str+="<table class='table table-bordered table-hover'>"
			str+="<tr><td>编号</td><td>加入收藏时间</td><td>资源名称</td><td>资源类型名称</td><td>删除资源</td><td>查看资源</td></tr>"	
			
			 //和for循环一样 i做计数
			  var i=0;
			var index=0; 
			for (var i; i < data.rows.length; i++) {
				index++;
			str+="<tr><td>"+index+"</td>";
			str+="<td>"+data.rows[i].ADD_TIME+"</td>";
			str+="<td>"+data.rows[i].RESOURCE_NAME+"</td>";
			str+="<td>"+data.rows[i].RESOURCE_TYPE_NAME+"</td>";
			str+="<td><button class='btn btn-danger btn-xs' onclick='check("+data.rows[i].RESOURCE_ID+")' name='consent'  value='"+data.rows[i].RESOURCE_ID+"'>删除此条记录</button></td>";
			str+="<td>查看资源</td></tr>"
				} 
			str+="</table>";
			$("#table").html(str); 
			} 
		} );
	};
	function check(id){
		alert(id);
		
		 $.ajax({
				url : "/schResource/collection/del.do",
				//async: false,  
				type : "post",
				data :{ "resourceId":id},
				dataType : "text",
				success : function(data) {
				//	alert(11);
				if (data == "success") {
					alert(1);
					select();
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
	</script>
<body>
	<input type="button" value="tijiao" id="aa" />
	<div id="table"></div>






	<!-- <div >data.total</div>
	<table class='table table-bordered table-hover'>
			<tr>
				<td>编号</td>
				<td>加入收藏时间</td>
				<td>资源名称</td>
				<td>资源类型名称</td>
				<td>删除资源</td>
				<td>查看资源</td>
			</tr>
		<tr>
			<td value='data.rows[i].COLLECT_ID'>index</td>
			<td >data.rows[i].ADD_TIME</td>
			<td>data.rows[i].RESOURCE_NAME</td>
			<td>data.rows[i].RESOURCE_TYPE_NAME</td>
			<td><input type='button' value='删除'/></td>
			<td>查看资源</td>
			
		</tr>
	</table>
	
	 -->
</body>
</head>
<script type="text/javascript">
$('#aa').click(function() {

	alert("aa");
});
</script>