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

<title>审核上传页面</title>
</head>
<body>
		
	<!-- <input type="button" id="pizhun" class="btn btn-default btn-success" value="批准" />
	<input type="button" id="bohui" class="btn btn-default btn-danger" value="驳回" /> -->
	
	
	<a id="pizhun" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">批准</a>
	<a id="bohui" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no'">驳回</a>
	
	
	<table id="dg">
		<div id="dd">
			
		</div> 
		
		<div id="dd1">
			
		</div> 
	</table>
	
	
		
</body>



<script type="text/javascript">
	//表格list
	$('#dg').datagrid({    
	    url:'/schResource/wym/checkQuery.do',    
	    columns:[[    
	        {field:'RESOURCE_NAME',title:'文件名称',width:200},    
	        {field:'USER_NAME',title:'上传人',width:120},    
	        {field:'MAJOR_NAME',title:'上传人所属系',width:120},
	        {field:'INSTITUTE_NAME',title:'上传人所属院',width:120},
	        {field:'UPLOAD_DATE',title:'上传时间',width:120},
	        {field:'RESOURCE_ID',title:'资源ID',width:120,hidden:true}
	    ]], 
		singleSelect:true,
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		pageSize:3,
		pageList:[3,6,9,12]
	}); 
	
	
	//批准按钮点击事件
	$('#pizhun').click(function(){
		var rowData = $("#dg").datagrid("getSelected");
		if(rowData){
			$("#dd").dialog('open');
		}else{
			alert("请选中一条数据");
		}	
	});
 	//批准按钮模态框
	$('#dd').dialog({    
	    title: '批准操作',    
	    width: 700,    
	    height: 400,    
	    closed: true,    
	    cache: false,     
	    modal: true,
	    onOpen:function(){
	    	var rowData = $("#dg").datagrid("getSelected");
	    	var index =$("#dg").datagrid("getRowIndex",rowData);
	    	var str = "";
	    	str += "<table class='table table-hover table-striped'><tr><td>文件名称:</td><td>"+rowData.RESOURCE_NAME+"</td></tr>";
	    	str += "<tr><td>上传人:</td><td>"+rowData.USER_NAME+"</td></tr>";
	    	str += "<tr><td>上传人所属专业:</td><td>"+rowData.INSTITUTE_NAME+"</td></tr>";
	    	str += "<tr><td>上传人所属院系:</td><td>"+rowData.MAJOR_NAME+"</td></tr>";   	
	    	str += "<tr><td>上传时间:</td><td>"+rowData.UPLOAD_DATE+"</td></tr>";
	    	str += "<tr><td>选择资源归类:</td><td><select id='inSelect'><option>请选择院</option></select></td></tr>";
	    	str += "<tr><td>选择资源归类:</td><td><select id='maSelect'></select></td></tr>";
	    	str += "<tr><td>同意原因:</td><td><textarea id='checkIdea'></textarea></td></tr></table>";
	    	select();
	    	$('#dd').html(str);
	    },
	    buttons:[{
	        text : '同意',
		        handler :function(){
		        	var rowData = $("#dg").datagrid("getSelected");
		        	if (confirm("确认同意么吗？")) {
		    			$.ajax({
							url:"/schResource/wym/checkInsert.do",
							data:{
								"resourceId":rowData.RESOURCE_ID,
								"checkIdea":$("#checkIdea").val(),
								"checkStatuId":1,
								"major_name":$("#maSelect").val()
							}
						});
		    		$("#dd").dialog('close');								
					var index =$("#dg").datagrid("getRowIndex",rowData);//获得当前行的索引
					$('#dg').datagrid('deleteRow',index); // 删除一行
		        	}
		        	
		        } 
	    },
		    	{
		    text : '关闭',
		    	handler :function(){
		        	$("#dd").dialog('close');
		        }
	    }]
	});
	
		//下拉框级联函数
		function select(){
			$.ajax({
				url:"/schResource/wym/instituteAllQuery.do",
				dataType:"JSON",
				success:function(data){
					var str = "";
					for(var i=0;i<data.length;i++){
						str += "<option>"+data[i].institute_name+"</option>";
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
		}
		
	 
	
	
	
	
	//驳回按钮点击事件
	$('#bohui').click(function(){
		var rowData = $("#dg").datagrid("getSelected");
		if(rowData){
			$("#dd1").dialog('open');
		}else{
			alert("请选中一条数据");
		}	
	});
	//批准按钮模态框
	$('#dd1').dialog({    
	    title: '批准操作',    
	    width: 700,    
	    height: 400,    
	    closed: true,    
	    cache: false,     
	    modal: true,
	    onOpen:function(){
	    	var rowData = $("#dg").datagrid("getSelected");
	    	var str = "";
	    	str += "<table class='table table-hover table-striped'><tr><td>文件名称:</td><td>"+rowData.RESOURCE_NAME+"</td></tr>";
	    	str += "<tr><td>上传人:</td><td>"+rowData.USER_NAME+"</td></tr>";
	    	str += "<tr><td>上传人所属院系:</td><td>"+rowData.INSTITUTE_NAME+"</td></tr>";
	    	str += "<tr><td>上传人所属专业:</td><td>"+rowData.MAJOR_NAME+"</td></tr>";
	    	str += "<tr><td>上传时间:</td><td>"+rowData.UPLOAD_DATE+"</td></tr>";
	    	str += "<tr><td>驳回原因:</td><td><textarea id='checkIdea'></textarea></td></tr>";
	    	$('#dd1').html(str);
	    },
	    buttons:[{
	        text : '驳回',
		        handler :function(){
		        	var rowData = $("#dg").datagrid("getSelected");
		        	if (confirm("确认驳回么吗？")) {
						$.ajax({
							url:"/schResource/wym/checkInsert.do",
							data:{
								"resourceId":rowData.RESOURCE_ID,
								"checkIdea":$("#checkIdea").val(),
								"checkStatuId":$(this).prop("name")
							}
						});
						$("#dd1").dialog('close');
						var index =$("#dg").datagrid("getRowIndex",rowData);//获得当前行的索引
						$('#dg').datagrid('deleteRow',index); // 删除一行
		        	}
		        } 
	    },
		    	{
		    text : '关闭',
		    	handler :function(){
		        	$("#dd").dialog('close');
		        }
	    }]
	});
	
	
	
	
	
</script>
</html>






