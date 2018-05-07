<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 这是jquery的核心包  -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.min.js"></script>
<!-- 这是easyui的核心包  -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/util-js.js"></script>
<!-- jqeuy默认的css样式 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/default/easyui.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/icon.css">
<!-- 语言 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<body>
<table id="dg"></table>  

<div id="hjhj"></div>


<script type="text/javascript">

$('#dg').datagrid({    
	 url:'<%=request.getContextPath()%>/role/roleList.do', 
	 pagination:true,
	 singleSelect:true,
	 pageNumber:1,
	 pageSize:3,
	 pageList:[3,6,9,12],
	 columns:[[    
	    
	     {field:'id',title:'角色ID',width:300},    
	     {field:'name',title:'角色名称',width:300},    
	     {field:'description',title:'角色描述',width:300,align:'left'},
	     {field:'  ',title:'操作',width:400,align:'left',
	         formatter: function(value,row,index){
				   return   "<button  onclick='dell("+row.id+")'>分配权限</button>";
			 }
		 }
	     
	 ]]
});  
function  dell   (id){
	  $('#hjhj').dialog({    
		    title: '分配权限',    
		    width: 400,    
		    height: 200,    
		    closed: false,    
		    cache: false,    
		    href: 'addrolemenu.jsp',    
		    modal: true ,
		    buttons:[{
				text:'新增',
				handler:function(){
					var node=$("#roletree").tree("getChecked");
					var ids ="";
					 for (var i = 0; i < node.length; i++) {
						ids+=","+node[i].id;
					}
					idss=ids.substring(1);
					///alert(idss)
					$.ajax({
				   		 url:"<%=request.getContextPath()%>/role/updaterolemenulist.do",
				   			type:"post",                                         
				   		    data:{"ids":idss,"roid":id},
				   		    success:function(result){
				   		    	$('#hjhj').dialog("close");
						    	$('#dg').datagrid('reload')
				   		 }
				   		 
					}) 
				}
			},{
				text:'取消',
				handler:function(){
					$("#hjhj").dialog("close")
				}
			}]
		}); 
}




</script>

</body>
</html>