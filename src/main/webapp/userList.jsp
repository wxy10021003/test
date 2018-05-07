<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/default/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
</head>

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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<body>
<div id="p" class="easyui-panel" title="搜索"     
        style="width:500px;height:150px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-search',collapsible:true">   
  	关键字：<input id="user"> <input type="button" value="搜索" onclick="search()">
</div>  

<table id="userAll-table"></table>
<div id="dialog_addRole"></div> 
<div id="showmsg-div1"></div>
<div id="add-div"></div>
<div id="dialog_add"></div>

<script type="text/javascript">
	$(function(){
		search()
		
	})
	
	function search(){
		$('#userAll-table').datagrid({    
		    url:'<%=request.getContextPath()%>/userController/queryUserPage.do',   
		    queryParams:{username:$("#user").val()},
		    pagination:true,//开启分页
		    pageNumber:1,//初始化页码
		    pageSize:2,//每页条数
		    pageList:[2,5,8,10],
		  
		    toolbar: [{
				iconCls: 'icon-remove',
				handler: function(){
// 					获取被选中的选项
					var colArr = $('#userAll-table').datagrid('getChecked');

					if(colArr.length<1){
						$.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
// 						return false 时 函数不再继续执行
						return false;
					}
					var idsStr = "";
					for(var i=0;i<colArr.length;i++){
						idsStr += ","+colArr[i].userid;
					}
					idsStr = idsStr.substring(1);
					$.ajax({
						url:"<%=request.getContextPath()%>/userController/delUsers.do?ids="+idsStr,
						success:function(msg){
							$.messager.show({
								title:'提示消息',
								msg:'已成功删除'+colArr.length+'条数据',
								timeout:2000,
								showType:'slide',
							});
							search();
						}
					})
				}
			},'-',{
				iconCls: 'icon-add',
				handler: function(){
					
					$('#showmsg-div1').dialog({    
					    title: 'My Dialog',    
					    width: 400,    
					    height: 200,    
					    closed: false,    
					    href: '<%=request.getContextPath()%>/userController/toAdd.do',    
					    buttons:[{
							text:'保存',
							handler:function(){
								$('#add-form').form('submit', {    
								    url:"<%=request.getContextPath()%>/userController/addUser.do",    
								    onSubmit: function(){    
								    	return $('#add-form').form('validate');
								    },    
								    success:function(){ 
						    		 $.messager.show({
											title:'提示消息',
											msg:'新增成功',
											timeout:2000,
											showType:'slide',
											style:{
											}
										});
							    	   $('#showmsg-div1').dialog("close");
							    	   $('#userAll-table').datagrid('reload')
								    }    
								}); 
							}
						},{
							text:'关闭',
							handler:function(){
								$('#add-div').dialog("close");
							}
						}]
					});
				}
			}],
			
			
			

		    columns:[[   
		              //field:尽可能对应实体类中的属性名，必须保证唯一性    title：列标题   width：每列宽度
		        {field:'che',checkbox:true},
		        {field:'userid',title:'用户编号',width:100},    
		        {field:'username',title:'用户姓名',width:100},
		        {field:'age',title:'用户年龄',width:100},
		        {field:'birday',title:'用户日期',width:100},
		       /*  {field:'userpwd',title:'用户密码',width:100},
		        {field:'userflag',title:'排序',width:100},
		        {field:'deptid',title:'用户部门',width:100}, */
		        {field:'  ',title:'操作',width:100,

		        		formatter: function(value,row,index){
		 				   return   "<button  onclick='addRole("+row.userid+")'>分配角色</button>";
		 			 
		        	}	
		        },
		    ]]    
		}); 
	}
	
	 function delObject(userid){
		$.ajax({
			url:"<%=request.getContextPath()%>/userController/delUser.do",
			type:"post",
			data:{"userid":userid},
			dataType:"text",
			success:function (delFlag){
				if(delFlag == "delSuccess"){
					search();
				}
			},
			error:function (){
				alert("删除发生错误");
			}
		});
	}

	
	    function addRole(userid){
// 	    	alert(userid)
	    		$("#dialog_addRole").dialog({
	    			 title: '分配角色',    
	       		    width: 400,    
	       		    height: 200,    
	       		    closed: false,    
	       		    cache: false,
	       		    href:"<%=request.getContextPath()%>/roleController/toRole.do?userId="+userid,
	       		    modal: true ,
	       		    toolbar:[{
	       				text:'保存',
	       				iconCls:'icon-edit',
	       				handler:function(){
	       					var data=$("#role_add").serialize();
	       					$.ajax({
	       						url:"<%=request.getContextPath()%>/roleController/addRoleUserRelation.do",
	       						data:data+"&userId="+userid,
	       						dataType:"json",
	       						type:"post",
	       						success:function(data){
	       							$("#dialog_addRole").dialog("close");
	       							
	       						},error:function(){
	       							 $.messager.alert('警告','报错'); 
	       						}
	       					})
	       					
	       				}
	       			},{
	       				text:'取消',
	       				iconCls:'icon-cancel',
	       				handler:function(){
	       					$("#dialog_add").dialog("close");
	       				}
	       			}]
	    		})
	    	}
</script>
</body>
</html>