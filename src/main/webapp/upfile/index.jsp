<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/js/easyui/themes/icon.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uploadify/uploadify.css"/>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',title:'',split:true" style="height:100px;">
    	<center><h1> </h1> </center>   	
    </div>   	    	  
    <div data-options="region:'west',title:'菜单面板',split:true" style="width:150px;">
    	<a href="javascript:addTabs('upFile/toUpFile.do','查看相册')">查看相册</a><br><br>
    	<a href="javascript:addTabs('upFile/toPhotoAdd.do','新增照片')">新增照片</a><br><br>
    	<a href="javascript:addTabs('upFile/toUpFileAdd.do','新增相册')">新增相册</a><br><br>
    </div>   
    <div data-options="region:'center',title:''">
<!-- 		选项卡 -->
		<div id="tt"></div>
    </div>   

<!-- 引入JQuery -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>

<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 支持tree组件的使用 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/js/util-js.js"></script>
<script type="text/javascript" 
				src="<%=request.getContextPath()%>/uploadify/jquery.uploadify.js"></script>
                 
<script type="text/javascript">
$(function(){
	$('#tt').tabs({    
	    fit:true,
	}); 
})
function addTabs(urlStr,titleStr){
//		判断选项卡是否已经打开
	var flag = $("#tt").tabs('exists',titleStr);
	if(flag){//已打开：不添加   切换到此选项卡页面
		$('#tt').tabs('select',titleStr);
	}else{
		$('#tt').tabs('add',{    
		    title:titleStr,    
			href:"<%=request.getContextPath()%>/"+urlStr,
		    closable:true, //关闭按钮
		    tools:[{    
		        iconCls:'icon-mini-refresh',   
		        handler:function(){    
		            alert('refresh');    
		        }    
		    }]    
		});  
	}
}
</script>
</body>
</html>