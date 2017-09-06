<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="head.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	type="text/css"></link>

<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet"
	href="http://localhost:9088/schResource/bootstrap-table/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript"
	src="http://localhost:9088/schResource/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<title>个人中心</title>
<style type="text/css">
* {
	padding: 0 auto;
	margin: 0 auto;
}

#header_center {
	height: 11%;
	padding: 13px;
	margin-left: 12%;
}

#vessel {
	background-size: 100% auto;
	background:#D0FFD0;
	width:80%;
}

.content {
	
	border: 1px solid #E4E7E9;
	height: 490px;
	width: 80%;
	margin: 0 auto;
}

.content_top {
	height: 13%;
	width: 95%;
	margin: 0 auto;
	margin-top: 10px;
	border: 0px solid gray;
}

.detail {
	border: 1px solid #A3CFA4;
	height: 360px;
	width: 88%;
}

.detail_top {
	float: left;
	margin-left: 5%;
}
</style>


<!--我的项目  -->

		

</head>


<body>
	<div id="vessel">
		<div class="content">
			<div class="content_top">
				<div id="nav-tabs">
					<div>
						<!-- 导航选项卡 -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">我的上传</a></li>
							<li role="presentation"><a href="#messages"
								aria-controls="messages" role="tab" data-toggle="tab"
								id="project">我的下载</a></li>
							<li role="presentation"><a href="#money"
								aria-controls="messages" role="tab" data-toggle="tab"
								id="moneyApp">我的收藏</a></li>
						</ul>

						<!-- 标签页 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<div class="detail">
									<div class="detail_one">
										<table id="tb_upload" class="table table-hover">
										
										</table>
									</div>
								</div>
							</div>
							<!-- ---------------------- -->
							<div role="tabpanel" class="tab-pane" id="messages">
								<table id="tb1" class="table table-hover">
									
								</table>
								
							</div>
							<!-- ---------------------- -->
							<div role="tabpanel" class="tab-pane" id="money">
								<table id="tb1" class="table table-hover">
									
								</table>
							
							</div>

						</div>
					</div>
				</div>
			</div>
			<div></div>
		</div>

</div>
		
</body>
	<script type="text/javascript">
	$('#tb_upload').bootstrapTable({
		url : "/schResource/wym/myUploadQuery.do",
		striped : true, //是否显示行间隔色
		columns : [{
			field : 'RESOURCE_NAME',
			title : '资源名称'
		}, {
			field : 'UPLOAD_DATE',
			title : '上传时间'
		},
		{
			field : 'STATUS_NAME',
			title : '状态'
		},{
			field : 'CHECK_IDEA',
			title : '审核意见'
		}]
	});
	</script>

</html>











