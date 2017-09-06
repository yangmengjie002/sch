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

<link href="http://localhost:9088/schResource/js/fileinput/css/bootstrap.css" rel="stylesheet"
	media="screen"></link>
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/bootstrap.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/bootstrap/bootstrap-table/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/bootstrap/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/bootstrap/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" href="http://localhost:9088/schResource/js/fileinput/css/fileinput.css"
	type="text/css">
<link />
<script type="text/javascript" src="../../js/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="../../js/fileinput/js/locales/zh.js"></script>
<style>
body {
	background-color: #F0F0F0;
}

#colpadding {
	margin: 100px auto;
	padding: 100px;
	background-color: #FFFFFF;
	width: 900px;
}

#inputpadding {
	margin: 0 auto;
	width: 80%;
}

#filediv {
	width: 300px;
}
</style>
<script type="text/javascript">
	$(function(){
		//图片上传
		$(".myFile").fileinput({
			language : 'zh',
			uploadUrl : "http://localhost:9088/schResource/fileUpload/SaveFile.do",//上传地址
			uploadAsync : true,//异步上传
			autoReplace : true,//是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
			// showCaption:false,//是否显示简介
			showUpload : true, //是否显示上传按钮
			showRemove : true, //显示移除按钮
			dropZoneEnabled : false,//是否显示拖拽区域
			maxFileCount : 1,//上传数量
			allowedFileExtensions : [  
			 "bmp","jpg","png","tiff","gif","pcx","tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo","eps","ai","raw","WMF" 
			 ,"txt","doc","docx","wps"],
			browseClass : "btn btn-primary", //按钮样式 
			//previewFileIcon : ""
		}).on("filebatchselected", function(event, files) {
			$(this).fileinput("upload");
		}).on("fileuploaded", function(event, data) {
			$.each(data, function(index, value) {
				if (value.flag == 0) {
					alert("上传成功" + value.url);
					//加载一个div用于存储url
					var str="<div id='uploadSite' value='"+value.url+"'></div>";
					$("#aa").html(str);
				}

			})
		}); 
		
		/*  $("#submit").click(function(){
				var rn=$("#resourceName").val();
				var ri=$("#resourceInfo").val();
				var us=$("#uploadSite").html();
			if(rn!=" " && ri!=" " && us!=" "){
				upload();
			}else{
				alert("请填充完整");
			}		
		 });  */

		//文件上传
		function upload() {
			//alert($("#resourceName").val()+"  "+$("#resourceInfo").val()+"  "+$("#uploadSite").html());
			$.ajax({
				url : "/schResource/fileUpload/upload.do",
				type:"post",
				data : {"resourceName": $("#resourceName").val(),
						"resourceInfo":$("#resourceInfo").val(),
						"uploadSite":$("#uploadSite").html()
					
				},
				success : function(data) {
					if(data=="success"){
						
						alert("恭喜你上传成功");
					}
				},error:function(){
					alert("请重新填写您的请求");
				}
			});
		};
		
	}) 
	
</script>

</head>
<body>
	<div id="colpadding">
		<%-- <form class="form-horizontal" role="form" method="post"
			action="<%=basePath%>fileUpload/upload.do"
			enctype="multipart/form-data"> --%>
			<div>
				<h3>上传文件资料</h3>
				<br>
				<div id="inputpadding">
					资源名称：<input type="text" name="resourceName" class="" id="resourceName"
						placeholder="请输入文件名称">
					<div>
						资源简介：
						<textarea class="" rows="5"
							id="resourceInfo" name="resourceInfo" value="无">无</textarea>
					</div>
				</div>
				<br>
				<div id="projecttype"></div>
				<h3>上传相关资料</h3>
				<br>
				<div id="Relevantdata">
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">文件上传</label>
						<div class="col-sm-10">
							<input type="file" class="myFile" id="fileSite"
								style="position: absolute; top: 0; left: 0; font-size: 34px; opacity: 0; width: 92; height: 34">
								
							</br>
						</div>
					</div>
				</div>
				<!--用于显示得到的图片的地址  -->
				<div id="aa"></div>
				<div id="clickmebind">sdddd</div>
				<input class="btn btn-info" type="submit" value="上传" id="submit"
					style="position: relative; top: 150; left: 30%; width: 100px">
		<!-- </form> -->
	</div>

</body>
</html>
