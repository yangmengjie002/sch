<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="../js/easyui/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="../js/easyui/themes/icon.css" type="text/css"></link>  
<script type="text/javascript" src="../js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="../js/bootstrap/css/bootstrap.min.css" type="text/css"></link>
<title>查询统计</title>
</head>
<body>
	<table id="dg"></table>  

	
</body>






	<script type="text/javascript">
		$('#dg').datagrid({    
		    url:'/schResource/wym/InfoListQuery.do',    
		    columns:[[  		        
		        {field:'RESOURCE_NAME',title:'资源名称',width:100},      
		        {field:'MAJOR_NAME',title:'资源所属专业',width:100},          
		        {field:'INSTITUTE_NAME',title:'资源所属院系',width:100},      
		        {field:'STUDENTNAME',title:'上传人',width:100},          
		        {field:'UPLOAD_DATE',title:'上传时间',width:100},         
		        {field:'CHECKNAME',title:'审核人',width:100},            
		        {field:'CHECK_DATA',title:'审核日期',width:100},          
		        {field:'TRNAME',title:'发布人',width:100},              
		        {field:'RELEASE_DATE',title:'发布日期',width:100},        
				{field:'TSNAME',title:'下架人',width:100},             		        
		        {field:'SOLDOUT_DATE',title:'下架日期',width:100},
				{field:'STATUS_NAME',title:'状态',width:100}
		    ]],
		    singleSelect:true,
		    fitColumns:true,
			striped:true,
			rownumbers:true,
			pagination:true
		});
	</script>

</html>










