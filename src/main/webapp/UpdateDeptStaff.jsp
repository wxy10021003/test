<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="updateformzxt">
<input type="hidden" name="staffid" value="${deptstaff.staffid }">
<input type="hidden" id="sp" value="${deptstaff.deptid }">
<%-- <span  id="sp">${deptstaff.deptid }</span> --%>
姓名:<input class="easyui-textbox" name="staffname" value="${deptstaff.staffname }"> <br>
年龄:<input type="text" class="easyui-numberbox" name="staffage" value="${deptstaff.staffage }" data-options="min:0"></input> <br>
生日:<input  id="dd"  type= "text" class= "easyui-datebox" value="${deptstaff.staffbir }" required ="required" name="staffbir"> </input><br>
薪资:<input type="text" class="easyui-numberbox" name="staffsalary" data-options="min:0" value="${deptstaff.staffsalary }"><br>
职位:<input type="radio" name="staffpost" value="董事长" 
			<c:if test="${deptstaff.staffpost=='董事长' }">checked</c:if>/>董事长
	<input type="radio" name="staffpost" value="总经理"
			<c:if test="${deptstaff.staffpost=='总经理' }">checked</c:if>/>总经理
	<input type="radio" name="staffpost" value="主管"
			<c:if test="${deptstaff.staffpost=='主管' }">checked</c:if>/>主管

部门:<select id="dept" name="deptid" ></select>
</form>
<script type="text/javascript">
$(function(){

		$.ajax({
			url:"<%=request.getContextPath()%>/deptStaffController/getDeptName.do",
			type:"post",
			dataType:"json",
			success:function(result){
				var options="<option value=null >---请选择---</option>";
				var jsonobj=eval('('+result+')');
				//alert(typeof(jsonobj))
				$.each(jsonobj,function(){
					options+="<option value='"+this.deptid+"'>"+this.deptname+"</option>";
				})
				$("#dept").html(options)
				$("#dept").val(parseInt($("#sp").val()))
			},
			error:function(){
				alert("查询部门出错")
			}
		})
	}) 
</script>
</body>
</html>