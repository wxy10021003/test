<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog-master/dist/dialog-plus.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/uploadify/jquery.uploadify.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/uploadify/uploadify.css"/>
	
<body>
 <select name="file" onchange="imglist()"></select>
 <span id='imgli'></span>
</body>
<script type="text/javascript">
function imglist(){
	var fileid=$("[name='file']").val()
	$.ajax({
		url:"<%=request.getContextPath()%>/controller/imglist.do",
		type:"post",
		data:{fileid:fileid},
		dataType:"json",
		success:function(result){
			var  img=""
			$(result).each(function(){
				img+="<img src='"+this.imgname+"' width='50' height='50'>"
			})
			$("#imgli").html(img)
		}
	})
}
$(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/controller/fileList.do",
		type:"post",
		dataType:"json",
		success:function(result){
			var file="<option value=0>-选择文件夹-</option>"
			//alert(eval("("+result+")"))
			$(result).each(function(){
				file+="<option value='"+this.fileid+"'>"+this.filename+"</option>"
			})
			$("[name='file']").html(file)
		}
	})
})
</script>
</html>