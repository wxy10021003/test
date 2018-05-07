<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Hx/exporting.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Hx/highcharts.js"></script> --%>
</head>
<body>
<div id="cont" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto;"></div>

<script type="text/javascript">

$(function(){
	 $.ajax({
		   url:"<%=request.getContextPath()%>/wxyCategoryAction!queryEx.action",
		   type:"post",
		   dataType:"json",
		   success:function(msg){
			
			   Highcharts.chart('cont', {
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				        text: '产品合格统计',
				    },
				    tooltip: {
				        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				    },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
				                style: {
				                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                }
				            }
				        }
				    },
				    series: msg, 
				});
			   
		   },error:function(){
			   alert("报错");
		   }
		   
	   })
	
	
})


</script>



</body>
</html>