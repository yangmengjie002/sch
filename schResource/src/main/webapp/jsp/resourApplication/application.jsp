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

</head>
<script type="text/javascript">
	window.onload = function() {
		alert("aaa");
		$.ajax({
			url : "/schResource/majorSelect/selectmajor.do",
			type : "post",
			//data:{"foodname":$(this).val()},
			dataType : "json",
			success : function(data) {
				//alert(data.selectMajor[0].MAJOR_NAME);
				var str = "";
				var i = 0;//和for循环一样 i做计数
				for (var i; i < data.selectMajor.length; i++) {
					str += "<option value="+data.selectMajor[i].MAJOR_ID+">"
							+ data.selectMajor[i].MAJOR_NAME + "</option>";
				}
				$("#smShow").html(str);
			}
		});

		//alert(1);
		$.ajax({
			url : "/schResource/majorSelect/selectResourceType.do",
			type : "post",
			dataType : "json",
			success : function(data) {
			//alert(data.selectType[0].RESOURCE_TYPE_NAME);
				var str = "";
				var i = 0;//和for循环一样 i做计数
				for (var i; i < data.selectType.length; i++) {
					// alert(data.selectType[i].RESOURCE_TYPE_NAME)
				str += "<option value="+data.selectType[i].RESOURCE_TYPE_ID+">"
					+ data.selectType[i].RESOURCE_TYPE_NAME
					+ "</option>";
					}
					$("#stShow").html(str);
			}
		});
	}
</script>


<body>
	<table>
		<tr>
			<td>资源所属部门：</td>
			<td>
				<div id="sm">
					<select id="smShow"></select>
				</div>
			</td>
		</tr>
		<tr>
			<td>资源类型：</td>
			<td>
				<div id="st">
					<select id="stShow"></select>
				</div>
			</td>
		</tr>
		<tr>
			<td>资源名称:</td>
			<td><input type="text" id="resourceRequestName" /></td>
		</tr>
		<tr>

			<td colspan="2">
				<div class="form-group">
					<label for="name">意见</label>
					<textarea class="form-control base-textara" rows="5"
						id="requestCause"></textarea>
				</div>
			</td>
		</tr>
	</table>
	<input type="button" id="submit" value="提交" />


</body>
</html>

<script type="text/javascript">
 $("#submit").click(function() {
//	alert($("#smShow").val()+"  "+$("#stShow").val()+"  "+$("#resourceRequestName").val()+"  "+$("#requestCause").val());
	$.ajax({
		url : "/schResource/majorSelect/insert.do",
		type:"post",
		data : {"majorId": $("#smShow").val(),
				"resourceRequestTypeId":$("#stShow").val(),
				"requestCause":$("#requestCause").val(),
				"resourceRequestName":$("#resourceRequestName").val()
		},
		success : function(data) {
			if(data=="success"){
				alert("您的请求已经被接受");
			}
		},error:function(){
			alert("请重新填写您的请求");
		}
	});
}); 
</script>