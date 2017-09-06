<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<link href="../js/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../js/bootstrap/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
	#div{
		margin-left:200px;
		margin-right:200px;
	}
	#accordion2 input{
		margin:20px;
	}
</style>
</head>
<body>

	<div id="div">
		<div class="container-fluid">
			<div class="accordion" id="accordion2">
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
</body>

<script type="text/javascript">
	
	window.onload=function(){
		major();		
	}
	var str="";
	var institute_id = 0;
	var major_id = 0; 
	function major(){
		$.ajax({
			async:false,
			url:"/schResource/wym/instituteAllQuery.do",			
			dataType:"JSON",	
			success:function(data){		
			 	for(var i=0;i<data.length;i++){
			 		institute_id=data[i].institute_id;
					str ="<div class='accordion-group'><div class='accordion-heading'><a class='accordion-toggle' data-toggle='collapse' data-parent='#accordion2' href='#collapseOne"+i+"'><h3>"+data[i].institute_name+"</h3></a></div><div id='collapseOne"+i+"' class='accordion-body collapse' style='height: 0px; '><div class='accordion-inner' id='context"+i+"'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div></div></div>";
					$("#accordion2").append(str);
					 $.ajax({
						 	async:false,
					 		url:"/schResource/wym/TbMajorQuery.do",
							dataType:"JSON",
							data:{
								"institute_id":institute_id
							},
							success:function(data){
								var maj = "";								
								for(var j=0;j<data.length;j++){
									major_id = data[j].MAJOR_ID;
									$.ajax({
										async:false,
										url:"/schResource/wym/queryTbResourceUploadId.do",
										dataType:"JSON",
										data:{
											"major_id":major_id
										},
										success:function(data1){
											maj += "<div class='btn-group' role='group' aria-label='...'><button type='button' class='btn btn-success'>"+data[j].MAJOR_NAME+"("+data1+")"+"</button></div>";
										}
									});	 
								}
								$("#context"+i).html(maj);
							}
						});
			 	
			 	} 
			    	 
			}
		})
	} 
	
</script>
</html>












