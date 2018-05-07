<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head> 
	
<body>

<form id="photo-add-form" enctype="multipart/form-data">
<table id="deptshow" >
	<tr>
		<td>
			选择上传相册:
		</td>
		<td>
			<select id="driectoryid-photo">
				<c:forEach items="${driectory}" var="x">
					<option value="${x.driectoryid}">${x.driectoryname}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			更改相册名字:
		</td>
		<td>
			<input type="text" id="file-name-photo"  >
		</td>
	</tr>
	<tr>
		<td>
			选择上传图片:
		</td>
		<td>
			<input type="file" id="uploads"/>
			<input type="hidden" id="file-path-photo"  name="driectoryname">
			
			<div id="fileQueue"></div>
			<div id="photoAdd-show"></div>
		</td>
	</tr>
	<tr>
		<td>
			介绍:
		</td>
		<td>
			<textarea rows="10" cols="80" name="product" ></textarea>
		</td>
	</tr>
	<!-- <tr  align="center">
		<td colspan="2"><a href="#" class="easyui-linkbutton" id="photo-add-form-reset" >重置</a> 
			<a href="#" class="easyui-linkbutton" id="photo-add-form-submit" >新增</a> </td>
	</tr> -->
	<tr  align="center">
		<td colspan="2">
		 <button type="button" class="btn btn-primary btn-lg " id="photo-add-form-submit" >新增</button>
		
		 <button type="button" class="btn btn-primary btn-lg " id="photo-add-form-reset" >重置</button>
<!-- 		<a href="#" class="easyui-linkbutton" id="photo-add-form-reset" >重置</a>  -->
<!-- 			<a href="#" class="easyui-linkbutton" id="photo-add-form-submit" >新增</a> </td> -->
	</tr>
</table>


<script type="text/javascript">


$('#photo-add-form-reset').bind('click', function(){    
	$('#photo-add-form').form("reset");    
});
//被选元素添加一个或多个事件处理程序，并规定事件发生时运行的函数。
$('#photo-add-form-submit').bind('click', function(){  
	alert();
	$.ajax({
	
		   url:"<%=request.getContextPath()%>/upFile/photoAdd.do",
		   data:{"driectoryid":$("#driectoryid-photo").val(),"file_path":$("#file-path-photo").val(),"file_name":$("#file-name-photo").val()},
		   type:"post",
		   dataType:"json",
		   success:function(data){
			 $.messager.show({
				title:'提示',
				msg:'新增成功',
				timeout:1000,   //超时
				showType:'slide'			
			});
			addTabs('upFile/toUpFile.do','查看相册'); 
			 location.reload();
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
$("#uploads").uploadify({
	//插件自带  不可忽略的参数
  	'swf': '${pageContext.request.contextPath}/uploadify/uploadify.swf',
	//前台请求后台上传文件的url  不可忽略的参数
	'uploader': '<%=request.getContextPath()%>/upFile/uploadImage.do',
    //给div的进度条加背景  参数为<div>id属性值  不可忽略
    'queueID': 'fileQueue',
    //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
    'fileObjName' : 'uploadFile',
    //给上传按钮设置文字
    'buttonText': '上传',
    //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
    'auto': true,
    //可以同时选择多个文件 默认为true  不可忽略
    'multi': true,
    //上传后队列是否消失
    'removeCompleted': true,
    //队列消失时间
    'removeTimeout' : 1,
    //最大上传文件数量
    'uploadLimit':  10,
    //制定可以文件上传
    'fileExt': '*.jpg;*.jpeg;*.gif;*.png;*.doc;*.docx;*.xls;*.xlsx;*.pdf;*.txt',
    'onUploadSuccess' : function(file,data,response) {
    	var html = '<img src='+data+' width="100" height="100">';
    	
    	//如何使用 match() 来检索一个字符串。
    	tr = data.match(/\"(\S*)\"/)[1];
    	alert(tr)
    	$("#photoAdd-show").html(html);
    	$("#file-path-photo").val(tr);
    }
})
</script>
</form>
</body>
</html>