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
<table id="deptshowzxt">
<!-- 按钮 -->
<div id="buttonss">
		<div  class="easyui-linkbutton" onclick="addDeptstaff()" data-options="iconCls:'icon-add',plain:true">新增</div>
	<button  type="button" id="baobiao" class="btn red  btn-xs btn-danger"   class="btn btn-primary">查看报表</button>
	</div> 
</table>
<!-- 修改弹框 -->
<div id="updatestaffzxt"></div>
<!-- 新增弹框 -->
<div id="addstaffzxt"></div>


<script type="text/javascript">
//===========================页面加载事件=======所有script必须写到body里
$(function(){
	$("#deptshowzxt").datagrid({
		url:'<%=request.getContextPath()%>/deptStaffController/selectDeptStaffList.do',
		striped:true,
		fitColumns:true,//宽度自适应
	    striped:true,
	    ctrlSelect:true,
	    pagination:true,//开启分页
	    pageNumber:1,//初始化页码
	    pageSize:3,//每页条数
	    pageList:[3,5,8,10],
	    columns:[[
	        {field:'staffid',title:'ID',width:100},    
	        {field:'staffname',title:'姓名',width:100},    
	        {field:'deptname',title:'部门',width:100},    
	        {field:'staffbir',title:'生日',width:100},    
	        {field:'staffage',title:'年龄',width:100},   
	        {field:'staffsalary',title:'薪资',width:100},   
	        {field:'staffpost',title:'职位',width:100},   
	        {field:'     ',title:'操作',width:100,
	     	formatter: function(value,row,index){
			  return "<input type='button' onclick=updateDeptstaff('"+row.staffid+"') value='修改'/><input type='button' onclick=deleteDeptstaff('"+row.staffid+"') value='删除'/>";
			 
	     	} 
			}  
	    ]]    
	})
})
//=======================修改==============
	function updateDeptstaff(staffid){
	 var pp= $("#deptshowzxt").datagrid("getSelected");
		$('#updatestaffzxt').dialog({    
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
		    href: '<%=request.getContextPath()%>/deptStaffController/queryDeptStaffById.do?staffid='+staffid,    
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
				   		 	url:"<%=request.getContextPath() %>/deptStaffController/updateDeptStaff.do",
				   			type:"post",
				   		    data:$("#updateformzxt").serialize(),
				   		    success:function(result){
				   		    	if (result) {
				   		    		$("#updatestaffzxt").dialog("close");
				   		    		$("#deptshowzxt").datagrid("reload");
								}
				   		    	
				   		    	
				   		 	}
					}) 
				}
			},{
				text:'取消',
				handler:function(){
					$("#updatestaffzxt").dialog("close");
				}
			}]
		}); 
	}
//===========================删除====================	
	function deleteDeptstaff(staffid){
		// getSelections 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
		//var id=$("#deptshow").datagrid("getSelections");
		
			//显示一个包含“确定”和“取消”按钮的确认消息窗口
			//function(r)当用户点击“确定”按钮的时侯将传递一个true值给回调函数，否则传递一个false值

			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    
				if (r){ 
			    	//删除的ajax
			    	$.ajax({
			    		url:"<%=request.getContextPath()%>/deptStaffController/deleteDeptStaff.do",
			    		data:{"staffid":staffid},
			    		type:"post",
			    		success:function(){
			    			$("#deptshowzxt").datagrid("reload");
			    		},
			    		error:function(){
			    			 $.messager.alert('警告','删除报错'); 
			    		}
			    	})
			    }else{
			    	$.messager.alert('警告','请选择要删除的数据');    
			    }    
			});  
		}
//================新增==============		
		function addDeptstaff(){
			$("#addstaffzxt").dialog({
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
        		    href:"<%=request.getContextPath()%>/deptStaffController/toAdddeptStaff.do",
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
        						url:"<%=request.getContextPath()%>/deptStaffController/addDeptStaff.do",
        						//addform  addStudent.jsp中form的id   提交addStudent.jsp中form
        						data:$("#addformzxt").serialize(),
        						type:"post",
        						success:function(){
        							//关闭新增弹框
        							$("#addstaffzxt").dialog("close");
        							//刷新展示表格
        							$("#deptshowzxt").datagrid("reload");
        							
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
        					$("#addstaffzxt").dialog("close");
        				}
        			}]
		 		
		 	})
	
	
	
		}
	
</script>
</body>
</html>