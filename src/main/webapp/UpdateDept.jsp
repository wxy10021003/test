<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form id="updateform">
<input type="hidden" id="deptid"   name="deptid" value="${deptstaff.deptid }">

部门:<input   type="text"   name="deptname">
</form>
<script type="text/javascript">
var pp= $("#deptshow").datagrid("getSelected");
$("[name='deptid']").val(pp.deptid);
$("[name='deptname']").val(pp.deptname);

</script>
   
</body>
</html>