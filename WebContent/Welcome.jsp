<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>13°盒子——主机安全可视化平台</title>
<link href="mycss/common.css" rel="stylesheet">
</head>
<body>

	<div class="content head">
		<div class="com" >
		</div>
		
		<div class="txt">
			<div class="txt_head">
			</div>
			<a href="<%=path %>/view.jsp">
			<div class="form button">
			</div>
			</a>
		</div>
	</div>
	<div class="content_paper">
	
	</div>
	<div class="bottom content">
		<div class="lo fi">
		</div>
		<div class="lo se">
		</div>
		<div class="lo th">
		</div>
	</div>
	<div class="bottom_paper">
	
	</div>


</body>
</html>