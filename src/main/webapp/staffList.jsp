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
  	关键字：<input id="staff"> <input type="button" value="搜索" onclick="search()">
</div>  

<table id="All-table"></table>
<div id="dialog_addRole"></div> 
<div id="showmsg-div1"></div>
<div id="add-div"></div>
<div id="dialog_add"></div>
<!-- huangfuqiang 黄富强      2018/03/126-->
<script type="text/javascript">
	$(function(){
		search()
		
	})
	
	function search(){
		$('#All-table').datagrid({    
		    url:'<%=request.getContextPath()%>/staffController/queryStaffPage.do',   
		    queryParams:{staffname:$("#staff").val()},
		    pagination:true,//开启分页
		    pageNumber:1,//初始化页码
		    pageSize:2,//每页条数
		    pageList:[2,5,8,10],
		  
		    toolbar: [{
				iconCls: 'icon-remove',
				handler: function(){
// 					获取被选中的选项
					var colArr = $('#All-table').datagrid('getChecked');

					if(colArr.length<1){
						$.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
// 						return false 时 函数不再继续执行
						return false;
					}
					var idsStr = "";
					for(var i=0;i<colArr.length;i++){
						idsStr += ","+colArr[i].staffid;
					}
					idsStr = idsStr.substring(1);
					$.ajax({
						url:"<%=request.getContextPath()%>/staffController/delStaffs.do?ids="+idsStr,
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
					    href: '<%=request.getContextPath()%>/staffController/toAdd.do',    
					    buttons:[{
							text:'保存',
							handler:function(){
								$('#add-form').form('submit', {    
								    url:"<%=request.getContextPath()%>/staffController/addStaff.do",    
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
							    	   $('#All-table').datagrid('reload')
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
		        {field:'staffid',title:'员工编号',width:100},    
		        {field:'staffname',title:'员工姓名',width:100},
		        {field:'staffbir',title:'员工生日',width:100},
		        {field:'staffage',title:'员工年龄',width:100},
		        {field:'deptname',title:'员工部门',width:100},
		        {field:'staffpost',title:'员工职位',width:100},
		        {field:'staffsalary',title:'员工薪资',width:100},
		        {field:'  ',title:'操作',width:100,

		        		formatter: function(value,row,index){
		 				   return   "<button  onclick='delStaf("+row.staffid+")'>通过</button>"+
		 				  			"<button  onclick='delSta("+row.staffid+")'>未通过</button>";
		 				  
		 			 
		        	}	
		        },
		    ]]    
		}); 
	}
	
	function delStaf(staffid){
// 		alert(staffid)
		$.ajax({
			url:"<%=request.getContextPath()%>/staffController/delStaf.do",
			type:"post",
			data:{"staffid":staffid},
			dataType:"text",
			success:function (delFlag){
					$("#All-table").datagrid("reload");
				
			},
			error:function (){
				alert("你没有此权限");
			}
		});
	}
	function delSta(staffid){
// 		alert(staffid)
		$.ajax({
			url:"<%=request.getContextPath()%>/staffController/delSta.do",
			type:"post",
			data:{"staffid":staffid},
			dataType:"text",
			success:function (delFlag){
					$("#All-table").datagrid("reload");
				
			},
			error:function (){
				alert("你没有此权限");
			}
		});
	}

</script>
</body>
</html>