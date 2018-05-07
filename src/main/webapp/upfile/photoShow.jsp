<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${driectoryid}" id="driectoryid-show">
<table border="1">
<tr id="photo-tr"></tr>
</table>
<script type="text/javascript">
$(function(){
	$.ajax({
		   url:"<%=request.getContextPath()%>/upFile/queryPhoto.do",
		   data:{"driectoryid":$("#driectoryid-show").val()},
		   dataType:"json",
		   success:function(data){
			   var tr = "";
			   $.each(JSON.parse(data), function (idx, obj){
					tr += "<td  class='tableStyleSolidLine' width='20%' style='text-align: center;'>"+
					"<img src='<%=request.getContextPath()%>/"+obj.file_path+"' title='"+obj.imgbewrite+"' style='margin:5px;width:auto;height:64px;' border='0'"+
					" ><br><label style='padding:5px;'>"+obj.file_name+"</label></td>";
				});
				$("#photo-tr").html(tr);
		   },error:function(){
			 $.messager.show({
				title:'提示',
				msg:'查询失败',
				timeout:1000,
				showType:'slide'
			});
		   }
	   })
})
</script>
</body>
</html>