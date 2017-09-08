<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html> 
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript" src="http://localhost:9088/schResource/js/bootstrap/jquery.form.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"/schResource/resourceType/typeInfo.do",
			type:"post",
			dataType:"json",
			success:function(data){
				console.info(data);
				var str = "";
				for(var i=0;i< data.length;i++){
					str += "<option value='"+data[i].RESOURCE_TYPE_ID+"'>"+data[i].RESOURCE_TYPE_NAME+"</option>";
				}
				$("#select").html(str);
			}
		});
		
		$('input[id=lefile]').change(function() {  
			$('#photoCover').val($(this).val());  
		});
		
		/* $("#dmd").click(function(){
			alert("aaaaaaaaaa");
			console.info($("#lefile"));
		}); */
		
		$("#submitBtn").click(function(){
			var data1 = {};
			data1["resourceTypeId"] = $("#select").val();
			data1["resourceName"] = $("#name").val();
			data1["resourceInfo"] = $("#info").val();
			var options = {
					url:'/schResource/file/upload.do',
					type:'post',
					dataType:'json',
					success:function(data){
						var filesize = $('#lefile')[0].files[0].size/1024;//获取上传文件大小kb
						alert(filesize);
						console.info(data);
						if(data.url.length == 1){
							alert("文件上传格式错误");
							return;
						}else if(filesize > data.RESOURCE_TYPE_SIZE){
							alert("上传文件大小超过了限制不能上传");
							return;
						}
						if(data.RESOURCE_TYPE_ID != data1["resourceTypeId"]){
							alert("分类选择错误");
							$("#se").html(data.RESOURCE_TYPE_NAME);
						}
						data1['resourceTypeId'] = data.RESOURCE_TYPE_ID
						data1["url"] = data.url;
						$("#name").val(data1["resourceName"]);
						$("#info").val(data1["resourceInfo"]);
						
						if(data.RESOURCE_TYPE_NAME = "图片"){
							var str = "<img src='/upload/"+data.url+"'/>";
							$("#imgShow").append(str);
						}
						setTimeout(function(){
							if(confirm("文件格式正确，是否立即上传")){
								$.ajax({
									url:'/schResource/file/uploadAll.do',
									data:data1,
									dataType:'text',
									success:function(data){
										alert(data);
									}
								});
							}		
						}, 2000);
								
					}
			}		
			$("#myform").ajaxSubmit(options);
		});
	})
</script>
<head>  
<title>用户上传图片页面</title>  
<base href="<%=basePath%>">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<style type="text/css">
	tr{
		height:80px;
		line-height:80px;
	}
	
	td{
		padding-left:20px;
	}
	table{
		margin:20px auto;
	}
	#imgShow{
		position:absolute;
		right:10px;
		top:50px;
		width:200px;
		border:1px solid red;
	}
</style>
</head>  
<body>   
    <form id="myform" enctype="multipart/form-data">  
            <table>
           		<tr>
           			<th>文件上传</th>
           			<td><input id="lefile" type="file" name="file"  style="display:none">  
						<div class="input-append">  
						    <input id="photoCover" class="input-large" type="text" style="height:30px;">  
						    <a class="btn btn-primary btn-sm" onclick="$('input[id=lefile]').click();">选择文件</a>  
						</div> </td>
           		</tr>
           		<tr>
           			<th>资源名称</th><td><input id='name' type="text" name="resourceName" class="form-control" placeholder="resourceName" aria-describedby="basic-addon1"></td>
           		</tr> 
           		<tr>
           			<th>资源分类</th><td id="se"><select id="select" name="resourceTypeId" class="selectpicker"></select></td>
           		</tr>
           		<tr>
           			<th>资源简介</th><td><textarea id='info' class="form-control" rows="5" name="resourceInfo"></textarea></td>
           		</tr>
           		<tr>
           			<td></td><td><input id="submitBtn" type="button" class="btn btn-primary" value="上 传" /></td>
           		</tr>   
            </table>
            <div id="imgShow">
            	
            </div>
          <!--  <input type="button" id="dmd" value="aaaaaaaaa"/> -->
            
            <hr style="height:1px;border:none;border-top:1px solid #555555;width:60%" />
            	<div style="width:50%;margin:10px auto;">
            		<p>温馨提示：
	            		上传文件的类型为：文本：txt、doc、wps；视频为：avi、rmvb、rm；音频：mp3、wav；
	            		数据表格：xls；课件：ppt；压缩文件：rar,zip。请正确上传。
	            	</p>
            	</div>
            	
                
    </form>  

    </center>  
</body>  
</html>  