 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/icon.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/js/easyui/themes/default/easyui.css"
	type="text/css"></link>
<script type="text/javascript">
  	$(function(){
  		$('#dg').datagrid({    
  		    url:'${pageContext.request.contextPath}/user/info.do',
  		  	fitColumns:true,
  		  	pagination:true,
  		  	pageSize:'5',
  		  	pageList:'[5,10,15,20,25,30]',
  		    columns:[[    
  		        {field:'USER_ID',title:'用户编号',width:100,checkbox:true},    
  		        {field:'USER_NAME',title:'用户名',width:100},    
  		        {field:'ROLE_NAME',title:'角色名',width:100},
  		      	{field:'USER_REAL_NAME',title:'真实姓名',width:100},
  		      	{field:'USER_STATUS',title:'用户状态',width:100,formatter:function(value,row,index){
  		      		if(value == 1){
  		      			return "可用";
  		      		}else{
  		      			return "禁用";
  		      		}
  		      	}},
  		      	{field:'MAJOR_NAME',title:'专业名',width:100},
  		      	{field:'INSTITUTE_NAME',title:'学院',width:100}
  		    ]],
  		  	toolbar: [{
  		  		text:'增加',
	 			iconCls: 'icon-add',
	 			handler: function(){
	 				$('#dd').dialog("open");
	 				$("#myform").form("clear");
	 			}
	 		},'-',{
	 			text:'编辑',
	 			iconCls: 'icon-edit',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows[0]);
	 				if(rows.length != 1){
	 					alert("只能对一行进行编辑，请重新选择");
	 					$('#dg').datagrid("clearChecked");
	 				}else{
	 					$("#dd").dialog("open");
	 					$("#myform").form("clear");
	 					$("#myform").form("load",{
	 						userId:rows[0].user_ID,
	 						userName:rows[0].USER_NAME,
	 						userRealName:rows[0].USER_REAL_NAME,
	 						instituteId:rows[0].INSTITUTE_NAME,
	 						majorId:rows[0].MAJOR_NAME
	 					});
	 					var checkboxs = $("input[type='checkbox'][name='roleInfo']");
	 					if(rows[0].ROLE_ID != null){
	 						console.info(checkboxs[0]);
		 					for(var i=0;i<checkboxs.length;i++){
		 						console.info(checkboxs[i]);
		 						if(checkboxs[i].value == rows[0].ROLE_ID){
		 							checkboxs[i].checked = true;
		 						}
		 					}
	 					}
	 				}
	 			}
	 		},'-',{
	 			text:'禁用',
	 			iconCls: 'icon-remove',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length==0){
	 					alert("请先选择要禁用的用户");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
 							arr += rows[i].USER_ID+";";
	 					}
	 					alert(arr);
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/role/delete.do",
	 						data:{"arr":arr},
	 						type:"post",
	 						success:function(data){
	 							if(data=="success"){
	 								alert("禁用成功");
	 								$('#dg').datagrid("reload");
	 							}
	 						}
	 					});
	 				}
	 			}
	 		},'-',{
	 			text:'启用',
	 			iconCls: 'icon-back',
	 			handler: function(){
	 				var rows = $('#dg').datagrid("getChecked");
	 				console.info(rows);
	 				if(rows.length==0){
	 					alert("请先选择要启用的用户");
	 				}else{
	 					var arr = "";
	 					for(var i=0;i<rows.length;i++){
	 						arr += rows[i].USER_ID+";";
	 					}
	 					alert(arr);
	 					$.ajax({
	 						url:"${pageContext.request.contextPath}/role/up.do",
	 						data:{"arr":arr},
	 						type:"post",
	 						success:function(data){
	 							if(data=="success"){
	 								alert("启用成功");
	 								$('#dg').datagrid("reload");
	 							}
	 						}
	 					});
	 				}
	 			}
	 		}]
  		});
  		
  	//授角色------------------
			$.ajax({
				url:'${pageContext.request.contextPath}/role/allUrl.do',
				dataType:'json',
				success:function(data){
					var str="";
					for(var i=0;i<data.length;i++){
						str += "<input id='check' type='checkbox' value='"+data[i].ROLE_ID+"' name='roleInfo'/>"+data[i].ROLE_NAME+"<br/>";
					}
					$("#roleInfo").html(str);
				}
			});
  		
  		
		$('#dd').dialog({    
		    title: '添加用户',    
		    width: 400,    
		    height: 300,    
		    closed: true,    
		    cache: false,      
		    modal: true,
		    onOpen:function(){	    	
		    	var mm = 0;
			     $("#instituteId").combobox({    
					    url:'${pageContext.request.contextPath}/school/getInstitute.do',
					    panelHeight:'auto',
					    valueField:'INSTITUTE_ID',    
					    textField:'INSTITUTE_NAME',
					    onSelect:function(record){
					    	console.info(record);
					    	mm = record.INSTITUTE_ID;
					    	/* var url = '${pageContext.request.contextPath}/school/getMajor.do?instituteId='+mm;
					    	$("#majorId").combobox('reload',url); */
					    	$("#majorId").combobox({
					    		url:'${pageContext.request.contextPath}/school/getMajor.do?instituteId='+mm,
							    panelHeight:'auto',
						    	valueField:'MAJOR_ID',    
							    textField:'MAJOR_NAME'   
							});
					    }
					}); 	
					
		    },
		    buttons:[{
				text:'保存',
				handler:function(){
					$.messager.progress();
					$('#myform').form('submit', {    
					    url:"${pageContext.request.contextPath}/user/insertOrUpdate.do",    
					    onSubmit: function(param){
					    	var checkboxs = $("input[type='checkbox'][name='roleInfo']:checked");
					    	console.info(checkboxs);
					    	var arr = "";
					    	for(var i=0;i<checkboxs.length;i++){
					    		arr += checkboxs[i].value + ";";
					    	}
					    	param.arr = arr;
					        var isValid = $(this).form('validate');
					        if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表提交      
					    },  
					    success:function(data){   
					        if(data=="success1"){
					        	$('#dd').dialog("close");
					        	$('#classInfo').dialog("close");
					        	$.messager.progress('close');	// 如果提交成功则隐藏进度条
					        	alert("添加成功");
					        	$('#dg').datagrid("reload");  	
					        } 				        
					        if(data=="success2"){
					        	$('#dd').dialog("close");
					        	$('#classInfo').dialog("close");
					        	$.messager.progress('close');	// 如果提交成功则隐藏进度条
					        	alert("编辑成功");
					        	$('#dg').datagrid("reload");  	
					        }         
					    }    
					});
				}
			},{
				text:'取消',
				handler:function(){
					if(confirm("确定取消吗？")){
						$('#dd').dialog("close");
					}
				}
			}] 
		});
		
		
		//搜索查询--------------------------------------	
		$("#roleId1").combobox({    
		    url:'${pageContext.request.contextPath}/role/allUrl.do',
		    panelHeight:'auto',
		    valueField:'ROLE_ID',    
		    textField:'ROLE_NAME'   
		});
		
		$("#instituteId1").combobox({    
		    url:'${pageContext.request.contextPath}/school/getInstitute.do',
		    panelHeight:'auto',
		    valueField:'INSTITUTE_ID',    
		    textField:'INSTITUTE_NAME',
		    onSelect:function(record){
		    	console.info(record);
		    	var url = '${pageContext.request.contextPath}/school/getMajor.do?instituteId='+record.INSTITUTE_ID;
		    	$("#majorId1").combobox('reload',url);
		    }
		}); 
		
		$("#majorId1").combobox({    
		    panelHeight:'auto',
	    	valueField:'MAJOR_ID',    
		    textField:'MAJOR_NAME'   
		});
		//分页查询搜索
		$("#selectBtn").click(function(){
			var data={};
	     	data["userName"] = $("#userId1").val()
	     	if($("#roleId1").val() == "请选择角色"){
	     		data["roleId"] = null;
	     	}else{
	     		data["roleId"] = $("#roleId1").val();
	     	}
	     	
	     	if($("#instituteId1").val() == '请选择学院'){
	     		data["instituteId"] = null;
	     	}else{
	     		data["instituteId"] = $("#instituteId1").val();
	     	}
	     	
	     	if($("#majorId1").val() == '请选择专业'){
	     		data["majorId"] = null;
	     	}else{
	     		data["majorId"] = $("#majorId1").val();
	     	}
	     	console.info(data);
	     	$('#dg').datagrid('load',data);
	     })
	     
	     $("#clearBtn").click(function(){
	    	 $('#dg').datagrid('load',{});
	    	 $('#dform').form().find('#userId1').val('');
	    	 $('#dform').form().find('#roleId1').val('请选择角色');
	    	 $('#dform').form().find('#instituteId1').val('请选择学院');
	    	 $('#dform').form().find('#majorId1').val('请选择专业');
	     })
	     
	     
  	});
  </script>
</head>

<body class="easyui-layout" border="false">   
    <div data-options="region:'north',title:'过滤',split:true" border="false" style="height:80px;">
    	<form id="dform" method="post">
    		<p style="margin-left:10px;">用户名：<input class="easyui-validatebox"  name="userName" id="userId1">
    		        角色名：<input id="roleId1" name="roleName" value="请选择角色" data-options="editable:false"> 
    		        学院名：<input id="instituteId1" name="instituteName" value="请选择学院" data-options="editable:false"> 
    		        专业名： <input id="majorId1" name="majorName" value="请选择专业" data-options="editable:false">
    		        <a  href="javascript:void(0)" id="selectBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查找</a>
    		        <a  href="javascript:void(0)" id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">清空</a>     		
    		</p>
    	</form>
    </div>     
    <div data-options="region:'center',title:'',border:'false'" style="padding:0px;background:#eee;">
    	<table id="dg"></table>
			<div id="dd">
				<form id="myform" method="post">
					<p>增加用户</p>
					<table id="table" style="width: 100%">
						<tr>
							<th>用户名</th>
							<td><input class="easyui-validatebox"
								data-options="required:true" name="userName" id="userName">
							</td>
						</tr>
						<tr>
							<th>用户密码</th>
							<td><input class="easyui-validatebox"
								data-options="required:true" name="userPwd"
								id="userPwd"></td>
						</tr>
						<tr>
							<th>用户真实姓名</th>
							<td><input class="easyui-validatebox"
								data-options="required:true" name="userRealName"
								id="userRealName"></td>
						</tr>
						<tr>
							<th>学院</th>
							<td>
								<input id="instituteId"   name="instituteId"  data-options="editable:false" >  
							</td>
						</tr>
						<tr>
							<th>专业</th>
							<td>
								<input id="majorId" class="easyui-combobox"  name="majorId"  data-options="editable:false">  
							</td>
						</tr>
						<tr>
							<th>授角色</th>
							<td id="roleInfo">
							</td>
						</tr>
						<tr>
							<th></th>
							<td><input id="userId" name="userId" type="hidden"></td>
						</tr>
					</table>
				</form>
			</div>
    </div>   
</body>  
	


</html>