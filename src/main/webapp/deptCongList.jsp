<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="dgg"></table>  

<div id="hjhjj"></div>


<script type="text/javascript">


$('#dgg').datagrid({    
	 url:'<%=request.getContextPath()%>/DeptCongController/queryDeptCount.do', 
	 pagination:true,
	 singleSelect:true,
	 pageNumber:1,
	 pageSize:3,
	 pageList:[3,6,9,12],
	 columns:[[ 
	           
	     {field:'deptid',title:'部门ID',width:300},    
	     {field:'deptname',title:'部门名称',width:300},    
	     {field:'countsums',title:'部门人数',width:300}
	 ]]
});  

 


 
</script>

</body>
</html>