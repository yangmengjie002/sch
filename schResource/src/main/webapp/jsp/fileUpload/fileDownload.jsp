<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="../head.jsp"></jsp:include>
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
<body>
	<div id="aa">9fc720b0-b62d-4bd4-a951-deeb240e8bd8.jpg</div>
	<p>
		<button class="btn btn-mini btn-primary" type="button" id="button">下载
		</button>
		
	</p>
</body>
</head>
<script type="text/javascript">


		$("button").click(function(){
			$.ajax({
				url : "/schResource/download/upload.do",
				type:"post",
				data : {"fileName": $("#aa").html()	}
				
			});
		});

	
</script>
