<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="xcForm">
<table>
	<tr>
		<td>新增相册名称:</td>
		<td>
			<input  type="text"    id="driectoryname">
		</td>
	</tr>
	<tr  align="center">
		<td colspan="2"><a href="#" class="easyui-linkbutton" id="xcForm-reset" >重置</a>
			<a href="#" class="easyui-linkbutton" id="xcForm-submit" >新增</a>
		 </td>
		
	</tr>
</table>
</form>
<script type="text/javascript">
$(function(){
	$('#xcForm-reset').bind('click', function(){    
		$('#xcForm').form("reset");    
    });
	$('#xcForm-submit').bind('click', function(){    
		$.ajax({
  		   url:"<%=request.getContextPath()%>/upFile/xiangceAdd.do",
  		   data:{"driectoryname":$("#driectoryname").val()},
  		   type:"post",
  		   dataType:"json",
  		   success:function(data){
  			 $.messager.show({
  				title:'提示',
  				msg:'新增成功',
  				timeout:1000,
  				showType:'slide'
  			});
  			addTabs('upFile/toUpFile.do','查看相册');
  		   },error:function(){
  			 $.messager.show({
   				title:'提示',
   				msg:'新增失败',
   				timeout:1000,
   				showType:'slide'
   			});
  		   }
  	   })
    });
});
</script>
</body>
</html>