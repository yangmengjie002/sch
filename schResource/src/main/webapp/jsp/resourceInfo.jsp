<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="head.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	type="text/css"></link>

<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/bootstrap-table/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<title>资源下载详情</title>
<style type="text/css">
	.jumbotron{
		padding:1px;
		padding-left:50px;
	}
	#info{
		margin:40px 100px 100px 100px;
	}
</style>
</head>
<body>

	<h2 style="margin-left:100px;">资源列表</h2>
	
	<div id="info"></div>

</body>

<script type="text/javascript">
	$.ajax({
		url:"/schResource/wym/ResourceInfoQuery.do",
		success:function(data){
			var str = "";
			for(var i=0;i<data.length;i++){
				str += "<div class='jumbotron'><h3><span class='glyphicon glyphicon-circle-arrow-down'></span>"+data[i].RESOURCE_NAME+"</h3>"+"<p>上传人："+data[i].USER_NAME+"&nbsp;&nbsp;&nbsp;&nbsp;上传时间："+data[i].UPLOAD_DATE+"</p>";
				str += "<p>资源简介："+data[i].RESOURCE_INFO+"</p>";
				str += "<p><a class='btn btn-primary' href='/schResource/file/download.do' role='button' id='"+data[i].RESOURCE_ID+"'>下载</a>";
				str += "&nbsp;&nbsp;&nbsp;&nbsp;<a class='btn btn-primary' href='#' role='button' id='"+data[i].RESOURCE_ID+"'><span class='glyphicon glyphicon-heart'></span>收藏</a></p></div>";
			}
			$("#info").append(str);
		}
	});
</script>
</html>














