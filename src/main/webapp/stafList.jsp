<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
<table id="fff"></table>  
<!-- huangfuqiang 黄富强      2018/03/126-->
<script type="text/javascript">
$(function(){
	$('#fff').datagrid({    
	    url:'<%=request.getContextPath()%>/staffController/queryStaff.do',
	    columns:[[ 
			{field:'staffid',title:'员工编号',width:100},    
			{field:'staffname',title:'员工姓名',width:100},
			{field:'staffbir',title:'员工生日',width:100},
			{field:'staffage',title:'员工年龄',width:100},
			{field:'deptname',title:'员工部门',width:100},
			{field:'staffpost',title:'员工职位',width:100},
			{field:'staffsalary',title:'员工薪资',width:100},
			{field:'  ',title:'状态', width:80,
				formatter: function(value,row,index){
					if (row.louji==1){
						return '通过';
					} else if(row.louji==2){
						return '未通过';
					}
				}
			}

	    ]]    
	});  
	$("#fff").datagrid("reload");
})




</script>


</body>

</html>