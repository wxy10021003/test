<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入JQuery -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/jquery.min.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/jquery.easyui.min.js"></script>

<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<!-- 支持tree组件的使用 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/util-js.js"></script>
            
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/default/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
</head>
<body>
  <form id="ff" >   
	    <div>   
	        <label for="name">关键字:</label>   
	        <input class="easyui-textbox" id="name"  type="text" name="deptname" data-options="required:true" />   
	    </div>   
	</form>  
    <div id="btn" class="easyui-linkbutton" onclick="whereSelect()" data-options="iconCls:'icon-search'">查询</div>    
   <table id="deptshow">
<!-- 按钮 -->
<div id="button">
		<div  class="easyui-linkbutton" onclick="addDept()" data-options="iconCls:'icon-add',plain:true">新增</div>
</div> 
</table>
<!-- 修改弹框 -->
<div id="updatestaff"></div>
<!-- 新增弹框 -->
<div id="addstaff"></div> 
    <script type="text/javascript">
//===========================页面加载事件=======所有script必须写到body里
$(function(){
	
	whereSelect()
})
function whereSelect(){
	var deptnam=$("[name='deptname']").val()
	
	$("#deptshow").datagrid({
		url:'<%=request.getContextPath()%>/departmentController/selectDeptList.do',
		striped:true,
		fitColumns:true,//宽度自适应
	    striped:true,
	    ctrlSelect:true,
	    pagination:true,//开启分页
	    pageNumber:1,//初始化页码
	    pageSize:3,//每页条数
	    pageList:[3,5,8,10],
	    queryParams:{
	    	deptnam:deptnam
	    },
	    columns:[[
	        {field:'deptid',title:'ID',width:100},    
	        {field:'deptname',title:'部门',width:100},      
	        {field:'     ',title:'操作',width:100,
	     	formatter: function(value,row,index){
			  return "<input type='button' onclick=updateDept('"+row.deptid+"') value='修改'/><input type='button' onclick=deleteDept('"+row.deptid+"') value='删除'/>";
			 } 
			}  
	    ]]    
	})
}

//================新增==============		
function addDept(){
	$("#addstaff").dialog({
 		//对话框窗口标题文本 	
 			title: '新增',    
		   //设置面板宽度
 			width: 400,    
		   //设置面板高度
 			height: 200,    
		   //定义是否在初始化的时候关闭面板
 			closed: false,    
		    //如果为true，在超链接载入时缓存面板内容
 			cache: false,
		    href:"<%=request.getContextPath()%>/departmentController/toAdddept.do",
		    //定义是否将窗体显示为模式化窗口
		    modal: true ,
		    //定义按钮的工具   保存按钮
		    toolbar:[{
				text:'保存',
				//设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
				iconCls:'icon-edit',
				//面板头部  触发事件  点击按钮触发事件
				handler:function(){
					//新增的ajax

					$.ajax({
						url:"<%=request.getContextPath()%>/departmentController/addDept.do",
						//addform  addStudent.jsp中form的id   提交addStudent.jsp中form
						data:$("#addform").serialize(),
						type:"post",
						success:function(){
							//关闭新增弹框
							$("#addstaff").dialog("close");
							//刷新展示表格
							$("#deptshow").datagrid("reload");
							
						},error:function(){
							 $.messager.alert('警告','新增报错'); 
						}
					})
					
				}
			},{
				//点击取消关闭新增面板
				text:'取消',
				//设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
				iconCls:'icon-cancel',
				//面板头部  触发事件  点击按钮触发事件
				handler:function(){
					$("#addstaff").dialog("close");
				}
			}]
 		
 	})



}

function deleteDept(deptid){
	// getSelections 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
	//var id=$("#deptshow").datagrid("getSelections");
	
		//显示一个包含“确定”和“取消”按钮的确认消息窗口
		//function(r)当用户点击“确定”按钮的时侯将传递一个true值给回调函数，否则传递一个false值

		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    
			if (r){ 
		    	//删除的ajax
		    	$.ajax({
		    		url:"<%=request.getContextPath()%>/departmentController/deleteDept.do",
		    		data:{"deptid":deptid},
		    		type:"post",
		    		success:function(){
		    			$("#deptshow").datagrid("reload");
		    		},
		    		error:function(){
		    			 $.messager.alert('警告','删除报错'); 
		    		}
		    	})
		    }else{
		      
		    }    
		});  
	}

//=======================修改==============
function updateDept(deptid){
 var pp= $("#deptshow").datagrid("getSelected");
	$('#updatestaff').dialog({    
	    //框框标题
		title: '修改系列',    
	    //面板宽度
		width: 400,    
	    //面板高度
		height: 200,    
		//定义是否在初始化的时候关闭面板
		closed: false,    
		//如果为true，在超链接载入时缓存面板内容
		cache: false,    
	    href: "UpdateDept.jsp",    
	  //定义是否将窗体显示为模式化窗口
	    modal: true ,
	   // 在加载远程数据时触发     当加载成功的时候让我们通过ajax加载面板内容并显示一些消息
	    onLoad:function(){
	    },
	    //对话框窗口底部按钮
	    buttons:[{
			text:'修改',
			handler:function(){
				 $.ajax({
			   		 	url:"<%=request.getContextPath() %>/departmentController/updateDept.do",
			   			type:"post",
			   		    data:$("#updateform").serialize(),
			   		    success:function(result){
			   		    	if (result) {
			   		    		$("#updatestaff").dialog("close");
			   		    		$("#deptshow").datagrid("reload");
							}
			   		    	
			   		    	
			   		 	}
				}) 
			}
		},{
			text:'取消',
			handler:function(){
				$("#updatestaff").dialog("close");
			}
		}]
	}); 
}



</script>      
</body>
</html>