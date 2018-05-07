<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="photo-show"></div>
<table border="5"   height="200px"  width="800px" cellspacing="10">
<tr id="xiangce-table" ></tr>
</table>
<script type="text/javascript">
$(function(){
	toSearch();
})
function toSearch(){
	$.ajax({
		   url:"<%=request.getContextPath()%>/upFile/queryXiangce.do",
		   dataType:"json",
		   success:function(data){
			   var tr = "";
			   			//JSON.parse() 方法用于将一个 JSON 字符串转换为对象。
			   $.each(JSON.parse(data), function (idx, obj){
				   //  alert("我是data"+data)//二位数组
				   //alert("我是idx"+idx)//  下标	
				   //alert("我是obj"+obj)	//  object
				   
				       // 写一个查询的方法 在回调函数中 拼接tr   定一个img标签 、给一个事件，把name 和id 传过去
					tr += "<td  class='tableStyleSolidLine' width='20%' style='text-align: center;'>"+
					"<img src='<%=request.getContextPath()%>/img/11.jpg' style='margin:5px;width:auto;height:90%;weight:90%;' border='0'"+
					" onclick='addPhotos(\""+obj.driectoryname+"\","+obj.driectoryid+")'><br><label style='padding:5px;'>"+obj.driectoryname+"</label></td>";
				});
				$("#xiangce-table").html(tr);
		   },error:function(){
			 $.messager.show({
				title:'提示',
				msg:'查询失败',
				timeout:1000,
				showType:'slide'
			});
		   }
	   })
}
function addPhotos(driectoryname,driectoryid){
	$("#photo-show").dialog({
	    title: driectoryname,    
	    width: 600,    
	    height: 400,    
	    closed: false,    
	    cache: false,
	    href:"<%=request.getContextPath()%>/upFile/toPhotoShow.do?driectoryid="+driectoryid,
	    modal: true 
 });
}
</script>
</body>
</html>