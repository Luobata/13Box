 require.config({
     paths:{
         echarts:'./js/echarts',
         'echarts/chart/bar' : './js/echarts',
         'echarts/chart/line': './js/echarts',
         
     }
 });

// Step:4 require echarts and use it in the callback.
// Step:4 ��̬����echartsȻ���ڻص������п�ʼʹ�ã�ע�Ᵽ�ְ�����ؽṹ����ͼ��·��
 require(  
     [  
         'echarts',  
         'echarts/chart/bar' ,
         'echarts/chart/line'
         
     ], 
     function(ec) {  
    	    //���ʱ���ѯ����  
    	    var time =  200;  
    	    //������·��  
    	    var url = 'DataList.action';  
    	    //ͼ������div  
    	    var elem = "main2";  
    	    //�Զ������ͼ�?��   echartsConfig.js  
    	    Econfig(url,time,elem);  
    	} 
     
 );
 
 function Econfig(url,time,elem){ 
	 
		/*$.ajaxSettings.async = false;  //ͬ�����ܻ�ȡ���  
		$.post(url,{time:time},function(result) {  
			dateList=result.dateList;
			
			 totalListc = response.totalListc;  
	        totalListd = response.totalListd;  
	        newList = response.newList;  
	        timeList = response.timeList;   
	    }, "json");  */ 
	   
	   // Step:4 require echarts and use it in the callback.
	   // Step:4 ��̬����echartsȻ���ڻص������п�ʼʹ�ã�ע�Ᵽ�ְ�����ؽṹ����ͼ��·��
	    require(  
	        [  
	            'echarts',  
	            'echarts/chart/bar' ,
	            'echarts/chart/line'
	        ],  
	        
	        function(ec) {  
	            var myChart = ec.init(document.getElementById(elem)); 
	            var nodes = [];
	            var links = [];
	            var constMaxDepth = 3;
	            var constMaxChildren = 7;
	            var constMinChildren = 4;
	            var constMaxRadius = 10;
	            var constMinRadius = 2;

	            function rangeRandom(min, max) {
	                return Math.random() * (max - min) + min;
	            }

	            function createRandomNode(depth) {
	                var node = {
	                    name : '进程数：' + nodes.length,
	                    value : rangeRandom(constMinRadius, constMaxRadius),
	                    // Custom properties
	                    id : nodes.length,
	                    depth : depth,
	                    category : depth === constMaxDepth ? 0 : 1
	                }
	                nodes.push(node);

	                return node;
	            }

	            function forceMockThreeData() {
	                var depth = 0;
	                var rootNode = {
	                    name : '我的电脑',
	                    value : rangeRandom(constMinRadius, constMaxRadius),
	                    // Custom properties
	                    id : 0,
	                    depth : 0,
	                    category : 2
	                }
	                nodes.push(rootNode);

	                function mock(parentNode, depth) {
	                    var nChildren = Math.round(rangeRandom(constMinChildren, constMaxChildren));
	                    
	                    for (var i = 0; i < nChildren; i++) {
	                        var childNode = createRandomNode(depth);
	                        links.push({
	                            source : parentNode.id,
	                            target : childNode.id,
	                            weight : 1 
	                        });
	                        if (depth < constMaxDepth) {
	                            mock(childNode, depth + 1);
	                        }
	                    }
	                }

	                mock(rootNode, 1);
	            }

	            forceMockThreeData();
	            myChart.setOption({  
	            	 title : {
	            	        text: 'Force',
	            	        subtext: 'Force-directed tree',
	            	        x:'right',
	            	        y:'bottom'
	            	    },
	            	    tooltip : {
	            	        trigger: 'item',
	            	        formatter: '{a} : {b}'
	            	    },
	            	    toolbox: {
	            	        show : true,
	            	        feature : {
	            	            restore : {show: true},
	            	            saveAsImage : {show: true}
	            	        }
	            	    },
	            	    legend: {
	            	        x: 'left',
	            	        data:['叶子节点','非叶子节点', '根节点']
	            	    },
	            	    series : [
	            	        {
	            	            type:'force',
	            	            name : "Force tree",
	            	            categories : [
	            	                {
	            	                    name: '叶子节点'
	            	                },
	            	                {
	            	                    name: '非叶子节点'
	            	                },
	            	                {
	            	                    name: '根节点'
	            	                }
	            	            ],
	            	            itemStyle: {
	            	                normal: {
	            	                    label: {
	            	                        show: false
	            	                    },
	            	                    nodeStyle : {
	            	                        brushType : 'both',
	            	                        strokeColor : 'rgba(255,215,0,0.6)',
	            	                        lineWidth : 1
	            	                    }
	            	                }
	            	            },
	            	            minRadius : constMinRadius,
	            	            maxRadius : constMaxRadius,
	            	            coolDown: 0.995,
	            	            steps: 10,
	            	            nodes : nodes,
	            	            links : links,
	            	            steps: 1
	            	        }
	            	    ]  
	            });  
	        }
	    );  
	}