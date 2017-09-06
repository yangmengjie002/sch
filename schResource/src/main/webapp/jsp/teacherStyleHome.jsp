<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap.min.js"></script>
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="http://localhost:9088/schResource/js/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
 <script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap-datetimepicker.js"></script>
 <script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/locales/bootstrap-datetimepicker.fr.js"></script>
<style type="text/css">
	.jumbotron{
		padding:1px;
		padding-left:50px;
	}
	#info{
		margin:50px auto;
		width:80%;
	}
</style>
</head>
<body>
	<div id="info"></div>
</body>

<script type="text/javascript">
	$.ajax({
		url:"/schResource/teacherStyle/findTeacher.do",
		dataType:'json',
		success:function(data){
			var str = "";
			for(var i=0;i<data.length;i++){
				str += "<div class='jumbotron'>";
				str += "<fieldset><legend style='background-color:#ffcc33'><h3>名师风采</h3></legend></fieldset>";
				str += "<p><font style='color:red'>名师：</font>"+data[i].TEACHER_NAME+"</p>";
				str += "<p>名师年龄："+data[i].TEACHER_AGE+"</p>";
				str += "<p>性别："+data[i].TEACHER_SIX+"</p>";
				str += "<p><font style='color:red'>名师简介：</font>"+data[i].TEACHER_INFO+"</p>";
				str += "&nbsp;&nbsp;&nbsp;&nbsp;</div>";
			}
			$("#info").append(str);
		}
	});
</script>
</html>
