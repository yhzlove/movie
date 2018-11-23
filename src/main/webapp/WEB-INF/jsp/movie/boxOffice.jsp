<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.common.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<title></title>

</head>

<body>

<!---------------右侧------------------>    
<div class="right"><!--right start-->

		<div class="search-bar overflowhidden">
		<c:if test="${dateType=='day' }">
		<form action='<%=request.getContextPath()%>/movie/back/boxOffice/${dateType}' method="post">
			<label>日期：</label><input type="text" name='dateStr'
				class="inputnormal inputlong mr10 bglightgrey Wdate" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" value='${dateStr}'/>
				
			 <input type="submit" class="btn btn-warning" value="搜索"  />
		</form>
		</c:if>
		<c:if test="${dateType=='mouth' }">
		<form action='<%=request.getContextPath()%>/movie/back/boxOffice/${dateType}' method="post">
			<label>日期：</label><input type="text" name='dateStr'
				class="inputnormal inputlong mr10 bglightgrey Wdate" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})" value='${dateStr}'/>
				
			 <input type="submit" class="btn btn-warning" value="搜索"  />
		</form>
		</c:if>
		<c:if test="${dateType=='year' }">
		<form action='<%=request.getContextPath()%>/movie/back/boxOffice/${dateType}' method="post">
			<label>日期：</label><input type="text" name='dateStr'
				class="inputnormal inputlong mr10 bglightgrey Wdate" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'})" value='${dateStr}'/>
				
			 <input type="submit" class="btn btn-warning" value="搜索"  />
		</form>
		</c:if>
		
		</div>
        
		<div style="height:30px; line-height:0;"></div>
                
        <div class="right-ctn">
<!--            <div class="aligncenter"><label class="labelnormal">2015年周边房租对比分析</label></div> -->
<!--            <div class="height20"></div> -->
<!--            <div class="bordernormal plr20 overflowhidden"> -->
           		<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    			<div id="main" style="width: 90%;height:90%;"></div>
           		<script type="text/javascript">
           			//定义两次数组
           			var data_yAxis = new Array();
           			var data_series = new Array();
           			//遍历后台数据
           			<c:forEach items="${movieList}" var="obj" varStatus="status">
           				data_yAxis[${status.index}] = '${obj[0]}';
           				data_series[${status.index}] = '${obj[1]}';
           			</c:forEach>
           			
			        // 基于准备好的dom，初始化echarts实例
			        var myChart = echarts.init(document.getElementById('main'));
			        //app.title = '世界人口总量 - 条形图';
					
			        // 指定图表的配置项和数据
			        var option = {
		        		    title: {
		        		        text: '${dateStr}票房',
// 		        		        subtext: '2014-03-12'
		        		    },
		        		    tooltip: {
		        		        trigger: 'axis',
		        		        axisPointer: {
		        		            type: 'shadow'
		        		        }
		        		    },
// 		        		    legend: {
// 		        		        data: ['2011年', '2012年']
// 		        		    },
		        		    grid: {
		        		        left: '3%',
		        		        right: '4%',
		        		        bottom: '3%',
		        		        containLabel: true
		        		    },
		        		    xAxis: {
		        		        type: 'value',
		        		        boundaryGap: [0, 0.01]
		        		    },
		        		    yAxis: {
		        		        type: 'category',
		        		        data: data_yAxis
		        		    },
		        		    series: [
		        		        {
		        		            name: '${dateStr}',
		        		            type: 'bar',
		        		            data: data_series
		        		        }
		        		    ]

			        };
			
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
			    </script>
           		
<!--            </div>--bordermal end-         -->
        </div><!--right-ctn end-->
        	
</div><!--right end-->
</body>
<script type="text/javascript">
	
</script>
</html>
