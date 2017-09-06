<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap.min.js"></script>
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

</head>
<style type="text/css">
body {
	width: 80%;
	margin-left: 10%;
}

/* Custom Styles */
ul.nav-tabs {
	width: 160px;
	margin-top: 20px;
	border-radius: 4px;
	border: 1px solid #ddd;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
}

ul.nav-tabs li {
	margin: 0;
	border-top: 1px solid #ddd;
}

ul.nav-tabs li:first-child {
	border-top: none;
}

ul.nav-tabs li a {
	margin: 0;
	padding: 8px 16px;
	border-radius: 0;
}

ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
	color: #fff;
	background: #0088cc;
	border: 1px solid #0088cc;
}

ul.nav-tabs li:first-child a {
	border-radius: 4px 4px 0 0;
}

ul.nav-tabs li:last-child a {
	border-radius: 0 0 4px 4px;
}

ul.nav-tabs.affix {
	top: 25%;
}
</style>

<body>
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
			<a class="navbar-brand" href="/schResource/queryInformation.do">校园资源共享平台</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/schResource/jsp/resourceInfo.jsp">文库专区 <span class="sr-only">(current)</span></a></li>
				<li><a href="/schResource/jsp/teacherStyleHome.jsp">名师风采</a></li>
				<li class="资源分享"><a href="" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">资源分享 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/schResource/jsp/fileUpload/fileUpload.jsp">分享</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="资源">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/schResource/jsp/resourceInfo.jsp">资料</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">我的<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/schResource/jsp/MyCenter.jsp">个人中心</a></li>
						<li><a href="#">Another action</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<!-- 图片滚动效果 -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="http://localhost:9088/schResource/images/jdt01b.jpg" alt="...">
				<div class="carousel-caption">1</div>
			</div>
			<div class="item">
				<img src="http://localhost:9088/schResource/images/jdt01b.jpg" alt="...">
				<div class="carousel-caption">2</div>
			</div>
			<div class="item">
				<img src="http://localhost:9088/schResource/images/jdt01b.jpg" alt="...">
				<div class="carousel-caption">3</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#carousel-example-generic"
			data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
			href="#carousel-example-generic" data-slide="next">&rsaquo;</a>

	</div>
	<!-- 附加导航 -->

	<div class="row">
		<div class="col-xs-3" id="myScrollspy">
			<ul class="nav nav-tabs nav-stacked" id="myNav">
				<li class="active"><a href="#section-1">资讯中心</a></li>
				<li><a href="/srcResource/jsp/resourceInfo.jsp">资源下载</a></li>
				<li><a href="#section-3">专业系院</a></li>
				<li><a href="#section-4">资源排行</a></li>
				<li><a href="#section-5">精品课程</a></li>
			</ul>
		</div>
		<div class="col-xs-9">
			<h2>
				<span class="glyphicon-envelope btn-warning">资讯中心</span>
			</h2>
			<div>
				<table>
					<c:forEach items="${getList }" var="queryZx">
						<tr>
							<td>
								<h4>
									<a href="#">${queryZx.informationTitle }</a>
								</h4>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<hr>
			<h2 id="section-2">
				<span class="glyphicon-plus btn-success">资源下载</span>
			</h2>
			<p>教程下载</p>
			<p>图片下载</p>
			<p>课本下载</p>
			<p>文章下载</p>
			<hr>

		</div>
	</div>
	</div>
</body>
</html>
<script>



	/* 附加导航（随屏幕滚动）
	  $(document).ready(function() {
		$("#myNav").affix({
			offset : {
				top : 125
			}
		});
	}); */
</script>