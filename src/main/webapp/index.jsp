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
 
<body  bgcolor="#9a9a9a" >
 <!-- 内容改变加载 图片 -->
<!--  <select name="file" onchange="imglist()"></select> -->
	<form id="addForm" >
 <!-- 内容改变加载 图片 -->		
	 请选择<select name="fileid" onchange="imglist()"></select>
	<!--  <div id="dddd" style="display:none"> -->

	<input type="hidden" name="imgid">
	照片:
		  <input type="file" id="uploads">
		  <div id="fileQueue"></div>
		  <div id="showPhoto"></div>
		  <input  type="hidden" name="imgname" >
		<br/><!-- </div>	 -->
<!-- 	照片描述:<input  type="text" name="imgbewrite" > -->
	照片描述:<textarea rows="10" cols="80" ></textarea><br>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<input type="button"  value="提交照片"   onclick="getFrom()">
	<input type="button"  value="取消上传">
		 </form>
		<center>
		 <table >
				<thead>
					<tr>
						<td>海报 </td>  
					</tr>
				</thead>
				<tbody id="Show"></tbody>
			</table>
		</center> 	
<!-- 	<a href="javascript:toAdd()">新增</a> -->
<!-- <span id="imgli"></span> -->

<script type="text/javascript">

	function  getFrom(){
		//	alert($("#addForm").serialize())
	  $.ajax({
		  url:"<%=request.getContextPath()%>/controller/add.do",
		  type:"post",
		  data:$("#addForm").serialize(),
		  async:false,
		  
		//  dataType:"text",
		  success:function(addFlag){
				   if(addFlag=="add"){
					   location.reload();
				   }
			   },
			   error:function(){
				   alert("新增程序出错！！！");
			   }
	  })
		}	

		$("#uploads").uploadify({
		//插件自带  不可忽略的参数
	  	'swf': '${pageContext.request.contextPath}/uploadify/uploadify.swf',
		//前台请求后台上传文件的url  不可忽略的参数
		'uploader':'<%=request.getContextPath()%>/controller/uploadImage.do',
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
	    'onUploadSuccess' : function(file, data, response) {
	    	alert(data)    	
	    	var html = "<a href='<%=request.getContextPath()%>/controller/downloadImage.do?imageName='"+data+"><img src='"+data+"' width='100' height='100'></a>";
	    	$("#showPhoto").append(html);
	    	$("[name='imgname']").val(data);
	    }
	}) 
		function deleteMovieById(id){
					  $.ajax({
						  url:"<%=request.getContextPath()%>/controller/del.do",
						  type:"post",
						  data:{"id":id},
						  dataType:"text",
						  success:function(str){
							  alert(str);
								if(str=="del"){
									location.reload();
								}else{
										alert("删除失败!!");
									} 
						  },
						  error:function(){
							  alert("删除出错了,请联系程序员");
						  }
					  })
		}
			
		
		function imgdown(imgname){
			location.href="<%=request.getContextPath()%>/controller/downloadFile.do?imgname="+imgname
		}
	
		$(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/controller/fileList.do",
				type:"post",
				dataType:"json",
				success:function(result){
					var tr="<option value=0>-选择文件夹-</option>"
					//alert(eval("("+result+")"))
					$(result).each(function(){
						tr+="<option value='"+this.fileid+"'>"+this.filename+"</option>"
					})
					$("[name='fileid']").html(tr)
				}
			})
		})
		
		function imglist(){
			var fileid=$("[name='fileid']").val()
			alert(fileid)
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

</script>	
</body>
</html>