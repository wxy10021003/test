<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="addtree">
	节点名称:<input class="easyui-textbox" name="text"> <br>
	父节点id:<input class="easyui-textbox" name="pid" value="${tree.id }"> <br>
	父节点名称:<input class="easyui-textbox" value="${tree.text }"> <br>
	节点路径:<input class="easyui-textbox" name="url"> <br>
</form>
</body>
</html>