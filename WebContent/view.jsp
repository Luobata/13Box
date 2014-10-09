<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>13°盒子——主机安全可视化平台</title>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="bootstrap/docs.min.js"></script>
<script src="myjs/main.js"></script>
<!-- Bootstrap core CSS -->
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="bootstrap/dashboard.css" rel="stylesheet">
<link href="mycss/main.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="/index.php/welcome" >13°盒子</a> </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">登录</a></li>
        <li><a href="#">注册</a></li>
        <li><a href="#">个人设置</a></li>
        <li><a href="#">手动配置</a></li>
        <li><a href="#">帮助</a></li>
      </ul>
      <form class="navbar-form navbar-right">
        <input type="text" class="form-control" placeholder="Search...">
      </form>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a href="<%=path %>/netuse.jsp">概览</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="<%=path %>/netuse.jsp">网络使用分析</a></li>
        <li><a href="">软件与服务分析</a></li>
        <li><a href="">主机性能分析</a></li>
        <li><a href="">其他</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="">全局数据统计分析</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="">13°盒子主页</a></li>
        <li><a href="">使用说明</a></li>
        <li><a href="">下载</a></li>
        <li><a href="">关于</a></li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1 class="page-header">概览</h1>
      <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder"> 
		<a href="<%=path %>/netuse.jsp">
		<img src="img/dash1.png">
		</a>
          <h4>网络使用分析</h4>
          <span class="text-muted">网络状况与使用情况分析</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder"> 
		<img src="img/dash2.png">
          <h4>软件与服务分析</h4>
          <span class="text-muted">软件使用与服务工作情况分析</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder"> 
		<img src="img/dash3.png">
          <h4>主机性能分析</h4>
          <span class="text-muted">主机性能与使用情况分析</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder"> <img src="img/dash4.png">
          <h4>其他</h4>
          <span class="text-muted">文件透视镜,个性化安全以及你想要的</span> </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>