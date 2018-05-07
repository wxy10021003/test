<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- huangfuqiang 黄富强      2018/03/126-->
<form id="add-form" method="post">
		<input type="hidden" name="staffid" value="${staff.staffid}">
		<table border="1">
			<tr>
				<td>员工姓名</td>
				<td><input type="text" name="staffname" value="${staff.staffname}"></td>
			</tr>
			<tr>
				<td>员工生日</td>
				<td>
				<input type="text"  class= "easyui-datebox" required ="required"  name="staffbir">
				</td>
			</tr>
			<tr>
				<td>员工年龄</td>
				<td><input type="text" name="staffage" value="${staff.staffage}"></td>
			</tr>
			<tr>
				<td>员工部门</td>
				<td><select id="ggg" name="deptid"></select></td>
			</tr>
			<tr>
				<td>员工职位</td>
				<td><input type="text" name="staffpost" value="${staff.staffpost}"></td>
			</tr>
			<tr>
				<td>员工薪资</td>
				<td><input type="text" name="staffsalary" value="${staff.staffsalary}"></td>
			</tr>
		</table>
	

</form>
<script type="text/javascript">
$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/staffController/deptName.do",
			type:"post",
			dataType:"json",
			success:function(result){
				var options="<option value=null>---请选择---</option>";
				var jsonobj=eval('('+result+')');
				//alert(typeof(jsonobj))
				$.each(jsonobj,function(){
					options+="<option value='"+this.deptid+"'>"+this.deptname+"</option>";
				})
				$("#ggg").html(options)
			},
			error:function(){
				alert("查询部门出错")
			}
		})
	}) 
</script>
	
</body>
</html>