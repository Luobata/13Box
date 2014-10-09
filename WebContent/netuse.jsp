<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>13°盒子——主机安全可视化平台</title>
<!-- <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> -->
<script src="js/jquery-1.8.3.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="bootstrap/docs.min.js"></script>
<script src="myjs/net.js"></script>
<script src="js/esl.js"></script>
<script src="http://s1.bdstatic.com/r/www/cache/ecom/esl/1-6-10/esl.js"></script>
<!-- <script src="js/es1.js"></script>   -->
<!-- Bootstrap core CSS -->
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="bootstrap/dashboard.css" rel="stylesheet">
<link href="mycss/net.css" rel="stylesheet">
</head>
<body>
<script src="js/es.js"></script>
<script type="text/javascript">
//定义function 调用折线图


 require.config({
     paths:{
         echarts:'./js/echarts',
         'echarts/chart/bar' : './js/echarts',
         'echarts/chart/line': './js/echarts'
     }
 });

// Step:4 require echarts and use it in the callback.
// Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
 require(  
     [  
         'echarts',  
         'echarts/chart/bar',  
         'echarts/chart/line'  
     ], 
     
     function start(ec) {  
    	    
    	 
    	 //数据时间查询参数  
    	    var time =  200;  
    	    //数据生成路径  
    	    var url = 'DataList.action';  
    	    //图表容器div  
    	    var elem = "main1";  
    	    //自定义加载图表函数   echartsConfig.js  
    	    //setInterval(EconfigAPI(url,time,elem),500);
    	      var time=500;
  			var interval;
  			/* function run(){    

	 			 interval=setInterval(EconfigAPI('DataList.action',500,"main1"),500);
	  		} */
	  		$(function () {  
	            setInterval("EconfigAPI('DataList.action',5000,'main1')", 5000); //每隔5秒刷新点击量  
	        }); 
    	    EconfigAPI(url,time,elem);  
    	    //run();
    	    
    	} 
     
 );

 /**  
  * 构建动态图表  
  * @param url   获取后台数据地址  
  * @param time  图表查询时间  
  * @param elem  加载容器  
  */ 

 function EconfigAPI(url,time,elem){ 
	 
	$.ajaxSettings.async = false;  //同步才能获取数据  
	$.post(url,{time:time},function(result) {  
		dateList=result.dateList;
		
		/* totalListc = response.totalListc;  
        totalListd = response.totalListd;  
        newList = response.newList;  
        timeList = response.timeList;   */
    }, "json");   
   
   // Step:4 require echarts and use it in the callback.
   // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(  
        [  
            'echarts',  
            'echarts/chart/bar',  
            'echarts/chart/line'  
        ],  
        function(ec) {  
            //--- 折柱 ---  
            var myChart = ec.init(document.getElementById(elem));  
            myChart.setOption({  
            	title : {  
                    text: '流量统计视图',  
                    subtext: '数据来源：13°盒子'  
                }, 
            	tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['360','QQ']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : ['周一','周二','周三','周四','周五','周六','周日']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'360',
                        type:'line',
                        stack: '总量',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data:[120, 132, 101, 134, 90, 230, 210]
                    },
                    {
                        name:'QQ',
                        type:'line',
                        stack: '总量',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data:[( Math.random()+1)*20, ( Math.random()+1)*32, ( Math.random()+1)*11, ( Math.random()+1)*34, ( Math.random()+1)*90,( Math.random()+1)* 20, ( Math.random()+1)*36]
                    }
                    
                ]  
            });  
        }
    );  
    //setInterval("EconfigAPI('DataList.action',5000,'main1')", 5000);
}
 run();
</script>  

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
        <li><a href="/index.php/welcome">概览</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li class="active"><a href="/index.php/netuse">网络使用分析</a></li>
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
	  <h5 class="page-header">每一个电脑的背后都隐藏着一个灵魂，是时候看一看它的真面目了！</h5>
	  <h3>通过对网络的分析，我们判断它的灵魂属于</h3>
	  <div id="net1"><img src="img/dash1.png"></div>
      <h3 class="page-header">网络流量</h3>
      <div id="main1" style="height:300px;width:1000px"></div>
	  <button class="btn btn-mini btn-primary" type="button" id="trause">分析我的网络流量情况</button>
	  <a href="" style="padding-left:700px">这说明什么？</a><!--准备连接到使用说明的页面某一位置name-->
	  <div id="panel1">
	  <p>这是关于你网络流量使用情况的分析：</p>
	  </div>
	  <h3 class="page-header" style="padding-top:50px">文件树</h3>
      <div id="main2" style="height:300px;width:1000px"></div>
	  <button class="btn btn-mini btn-primary" type="button" id="conuse">分析我的网络连接情况</button>
	  <a href="" style="padding-left:700px">这说明什么？</a><!--准备连接到使用说明的页面某一位置name-->
	  <div id="panel2">
	  <p>这是关于你网络流量使用情况的分析：</p>
	  </div>


	
    </div>
  </div>
</div>

</body>
</html>