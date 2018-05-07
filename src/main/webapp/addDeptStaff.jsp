<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="addformzxt">
姓名:<input class="easyui-textbox" name="staffname"> <br>
年龄:<input type="text" class="easyui-numberbox" name="staffage" data-options="min:0"></input> <br>
生日:<input  id="dd"  type= "text" class= "easyui-datebox" required ="required" name="staffbir"> </input><br>
薪资:<input type="text" class="easyui-numberbox" name="staffsalary" data-options="min:0"><br>
职位:<input type="radio" name="staffpost" value="董事长"/>董事长
	<input type="radio" name="staffpost" value="总经理"/>总经理
	<input type="radio" name="staffpost" value="主管"/>主管
	<input type="radio" name="staffpost" value="员工"/>员工

部门:<select id="depp" name="deptid"></select>

</form>
<script type="text/javascript">
$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/deptStaffController/getDeptName.do",
			type:"post",
			dataType:"json",
			success:function(result){
				var options="<option value=null>---请选择---</option>";
				var jsonobj=eval('('+result+')');
				//alert(typeof(jsonobj))
				$.each(jsonobj,function(){
					options+="<option value='"+this.deptid+"'>"+this.deptname+"</option>";
				})
				$("#depp").html(options)
			},
			error:function(){
				alert("查询部门出错")
			}
		})
	}) 
</script>
</body>
</html>