<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <input type="hidden" value="${userId }" id="userId">
     <form id="role_add"></form>
     <script type="text/javascript">
     
       $(function(){
    	   var userId=$("#userId").val();
    	
    	   $.ajax({
    		   url:"<%=request.getContextPath()%>/roleController/roles.do",
    		   data:{"userid":userId},
    		   type:"post",
    		   dataType:"json",
    		   success:function(data){
    			  // alert(data.list);
    			   //alert(data.roles);
    			  var htm="";
    			   for (var i = 0; i < data.list.length; i++) {
					 var count=0;
					 for (var j = 0; j < data.roles.length; j++) {
						if(data.roles[j].id==data.list[i].id){
							htm+="<input type='checkbox' checked name='roleId' value='"+data.roles[j].id+"'>"+data.roles[j].name
							count=1;
							break;
						}
					}
					 if(count!=1){
						 htm+="<input type='checkbox'  name='roleId' value='"+data.list[i].id+"'>"+data.list[i].name
					 }
				  }
    			  
    			   $("#role_add").html(htm);
    			   
    		   },error:function(){
    			   alert("报错");
    		   }
    		   
    	   })
       })
     
     
     
     </script>
</body>
</html>