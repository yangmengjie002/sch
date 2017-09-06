<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap.min.js"></script>
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<style type="text/css">
#headDiv {
	width: 90%;
	margin-left: 5%;
}
#er_div a:hover {
	background: #339900;
}
#er_div a{
	font-size:20px;
	line-height:50px;
}
#total_a{
	font-size:30px;
}
.navbar-header{
	padding:15px;	
}
#input_div{
	margin-top:15px;
}
</style>
</head>

<body>
	<div id="headDiv">
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/schResource/queryInformation.do" id="total_a">校园资源共享平台</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" id="er_div">
				<li><a href="/schResource/jsp/resourceInfo.jsp">文库专区</a></li>
				<li><a href="/schResource/jsp/teacherStyleHome.jsp">名师风采</a></li>
				<li><a href="/schResource/jsp/fileUpload/fileUpload.jsp">资源分享</a></li>
			</ul>
			<form class="navbar-form navbar-left">
			<div id="input_div">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="资源">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</div>
			</form>
			<ul class="nav navbar-nav navbar-right" id="input_div">
				<li><a href="/schResource/loginqian/index.html">您好,请登录</a></li>
				<li><a href="MyCenter.jsp">个人中心</a></li>
			</ul>
		</div>
	</div>
</nav>
</div>
</body>
</html>