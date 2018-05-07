<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <form id="add-form" method="post">
		<input type="hidden" name="userid" value="${user.userid}">
		<table border="1">
			<tr>
				<td>用户姓名</td>
				<td><input type="text" name="username" value="${user.username}"></td>
			</tr>
			<tr>
				<td>用户年龄</td>
				<td><input type="text" name="age" value="${user.age}"></td>
			</tr>
			<tr>
				<td>用户生日</td>
				<td><input type="text" name="birday" value="${user.birday}"></td>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="text" name="userpwd" value="${user.userpwd}"></td>
			</tr>
			<tr>
				<td>排序</td>
				<td><input type="text" name="userflag" value="${user.userflag}"></td>
			</tr>
			<tr>
				<td>用户部门</td>
				<td><input type="text" name="colorname" value="${user.deptid}"></td>
			</tr>
		</table>
	</form>

</body>
</html>