<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/easyui/jquery.min.js"></script>
<link href="../../js/bootstrap/bootstrap.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript" src="../../js/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
window.onload = function() {
	/* var pageNo=1;
	var m=1;
	alert("dsf"); */
	$.ajax({
		url : "/schResource/personRecord/select.do",
		type : "post",
		
		//data:{"foodname":$(this).val()},
		dataType : "json",
		success : function(data) {
			alert(data.total);
			alert(data.rows[0].MAJOR_NAME);
			var str = "";
			var i = 0;//和for循环一样 i做计数
			for (var i; i < data.rows.length; i++) {
				
				
			str += "<table class='table table-bordered table-hover'>";
		
			str+=	"<tr class='success'><td>资源所属部门：</td><td>申请审批状态：</td><td>资源类型：</td><td>申请时间：</td></tr>";
			str+=	"<tr class='info'><td>"+data.rows[i].MAJOR_NAME+"</td>";
			str+=	"<td>"+data.rows[i].REQUEST_STATUS+"</td><td>"+data.rows[i].RESOURCE_TYPE_NAME+"</td><td>"+data.rows[i].REQUEST_TIME+"</td></tr>";
			str+=	"<tr class='success'><td>请求资源名称：</td><td colspan='3'> "+data.rows[i].RESOURCE_REQUEST_NAME+"</td></tr>" ;
			str+=	"<tr class='info'><td colspan='4'>请求资源详细信息:</td></tr>";
			str+    "<tr class='success'><td colspan='4'>"+data.rows[i].REQUEST_CAUSE+"</td></tr></table>";
			}
			$("#personRequestRecord").html(str);
		}
	});

	
}
</script>

</head>
<body>
	<input type="button" id="btn" value="按钮"/>
	<div id="personRequestRecord"></div>
	<!-- <table class="table table-bordered table-hover">
		<tr class="success">
			<td>资源所属部门：</td>
			<td>申请审批状态：</td>
			<td>资源类型：</td>
			<td>申请时间：</td>
		 </tr>
		 <tr class="info">
			<td>data.rows[i].MAJOR_NAME</td>
			<td>data.rows[i].REQUEST_STATUS</td>
			<td>data.rows[i].RESOURCE_TYPE_NAME</td>
			<td>data.rows[i].REQUEST_TIME</td>
		 </tr>
		 <tr class="success">
			<td >请求资源名称：</td>
			<td colspan="3"></td>
		 </tr>
		 <tr class="info">
			 <td colspan="4">请求资源详细信息:</td>
		 </tr>
		 <tr class="success">
		 	<td colspan="4">data.rows[i].REQUEST_CAUSE</td>
		 </tr>
	</table> -->
	
	
<div>
	<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>

</div>


	
</body>
<script type="text/javascript">
	$("#btn").click(function(){
		alert("aaa");
		
	});
</script>
</html>
