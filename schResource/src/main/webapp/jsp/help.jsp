<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="../js/bootstrap/css/bootstrap.min.css"
	type="text/css"></link>

<title>资源求助</title>


<style type="text/css">
	form{
		margin-left:27%;
	}
	#inSelect{
		width:150px;
		display:inline;
	}
	#maSelect{
		width:150px;
		display:inline;
	}
	#span{
		color:red;
	}
	#inputdiv{
		width:270px;
		margin-top:10px;
		margin-bottom:10px;
	}
	#StateSelect{
		width:150px;
		display:inline;
	}
	#text{
		width:430px;
		height:130px;
	}
	#sumbtn{
		margin-top:80px;
		margin-left:190px;
	}
</style>

</head>
<body>
	<form>
		<select class="selectpicker show-tick form-control" id="inSelect">
			<option>请选择归类</option>
		</select>
		<select class="selectpicker show-tick form-control" id="maSelect"></select>
		<select class="selectpicker show-tick form-control" id="StateSelect">
			
		</select>
		<div class="input-group" id="inputdiv">
			<span class="input-group-addon" id="basic-addon1">标题:</span> <input
				type="text" class="form-control" placeholder="Username"
				aria-describedby="basic-addon1" id="ziname">
		</div>
		请输入需求简介：
		<div>
			<textarea id="text"></textarea>
			<span>还可以输入<span id="span">300</span>字数</span>
		</div>
		
		
		<button type="button" class="btn btn-success btn-lg" id="sumbtn">提交</button>
	</form>



</body>



<script type="text/javascript">	
	//剩余字数提示
	$("#text").keyup(function(){
		var name = $("#text").val();
		$("#span").html(300-name.length);
	});
	
	//类型下拉
	$.ajax({
		url:"/schResource/wym/stateQuery.do",
		dataType:"JSON",
		success:function(data){
			var str = "";
			for(var i=0;i<data.length;i++){
				str += "<option>"+data[i].TYPENAME+"</option>";
			}
			$("#StateSelect").html(str);
		}
	});
	
	//所属院系级联
	$.ajax({
		url:"/schResource/wym/instituteAllQuery.do",
		dataType:"JSON",
		success:function(data){
			var str = "";
			for(var i=0;i<data.length;i++){
				str += "<option>"+data[i].instituteName+"</option>";
			}
			$("#inSelect").append(str);
			$("#inSelect").change(function(){
				$.ajax({
					url:"/schResource/wym/checkMajQuery.do",
					data:{
						'institute_name':$("#inSelect").val()
					},
					dataType:'JSON',							
					success:function(data){
						var str = "";
						for(var i=0;i<data.length;i++){
							str += "<option>"+data[i].MAJOR_NAME+"</option>";
						}
						$("#maSelect").html(str);
					}
				});
			})
		}
	});
	
	//提交
	$("#sumbtn").click(function(){
		var majorname=$("#maSelect").val();
		var requestCause=$("#text").val();
		var ziname=$("#ziname").val();
		if(majorname.length==0||requestCause.length==0||ziname.length==0){
			alert("不能有非空项");
		}else{
			$.ajax({
				url:"/schResource/wym/helpInsert.do",
				data:{
					"majorname":$("#maSelect").val(),
					"typename":$("#StateSelect").val(),
					"requestCause":$("#text").val(),
					"ziname":$("#ziname").val(),
				},
				success:function(data){
					if(data==1){
						alert("提交成功");
					}
				}
			});
		}
	});
	
	</script>


</html>










