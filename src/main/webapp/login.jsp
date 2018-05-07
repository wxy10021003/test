<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理登录模板 - </title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<!-- 引入EasyUI的样式文件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog-master/dist/dialog-plus.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jQuery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/fun.base.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<style type="text/css">
.code 
{
 /* background:url(code_bg.jpg); */
 font-family:Arial;
 font-style:italic;
 color:blue;
 font-size: 20px;
 border:0;
 padding:2px 3px;
 letter-spacing:3px;
 font-weight:bolder;
 float:left;
 cursor:pointer;
 width:80px;
 height:30px;
 margin-left: 5px;
 text-align:center;
 vertical-align:middle;
 line-height: 30px;
}
a 
{
 text-decoration:none;
 font-size:12px;
 color:#288bc4;
 line-height: 30px;
}
a:hover 
{
 text-decoration:underline;
}
</style>
</head>


<body>
<form id="zhuceForm"  style="display:none">
		<table border="1" cellspacing="0" align="center" bgcolor="#CCFFFF" bordercolor="#46B5F7">
			<tr>
				<td><label>登录名</label></td>
				<td><input type="text" class="text" placeholder="登录名" name="loginname" id="loginn"></td>
			</tr>
			<tr>
				<td><label>账     号</label></td>
				<td><input type="text" class="text" placeholder="账    号" name="username" id="usern"></td>
			</tr>
			<tr>
				<td><label>密     码</label></td>
				<td><input type="password" class="text" placeholder="密    码" name="userpwd" id="userp"></td>
			</tr>
			<tr>
				<td><label>确认密码</label></td>
				<td><input type="password" class="text" placeholder="确认密码" id="newPwd">
					<span id="pasp"></span>
				</td>
			</tr>
			</table>
	</form>
<form id="loginForm">
<div class="login">
    <div class="box png" >
		<div class="logo png" ></div>
		<div class="logo png">
			<div class="log" >
				<div class="name">
					<label>用户名</label><input type="text" class="text"  placeholder="用户名" name="username" >
				</div>
				<div class="pwd" >
					<label>密　码</label><input type="password" class="text"  placeholder="密码" name="userpwd" >
				 </div>
			     <div class="inputCode">
			    	<label>验证码</label><input type="text" class="text" style="width:120px" placeholder="输入验证码" id="inputCode" />
			    	
			    </div>
    				<div id="checkCode" onclick="createCode()" ></div>
    				<a href="#" onclick="createCode()"><font color="red">换一张</font></a>
    			
				<div class="div-btn">
					<input onclick="validateCode();" type="button" class="submit"  value="登录" id="value1">
					<input type="button" class="submit"  value="注册" id="zhuceButton">
					</div>	
    		</div>
	</div>
 </div>		
</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div> 
    <div class="footer"></div>
</form>


<div style="text-align:center;margin:100px 0; font:normal 15px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家"></a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></p>	
<a href="http://www.miitbeian.gov.cn/" style="font-size:13px" target="_blank">京ICP备05030002号</a>

</div>
<script type="text/javascript">
$(function(){
	createCode();
});


var code;
var codeChars="";
function createCode(){
 code = "";
 var codeLength = 4; //验证码的长度
  var checkCode = document.getElementById("checkCode");
  codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
	 for(var i = 0; i < codeLength; i++){
		  var charNum = Math.floor(Math.random() * 52);
		  code += codeChars[charNum];
	 }
	 if(checkCode){
	  checkCode.className = "code";
	  checkCode.innerHTML = code;
	 }
}
//登录方法
function validateCode(){
 	var inputCode=document.getElementById("inputCode").value;//获取验证码文本框值
 	//判断验证码文本框的 值是否为空
	 if(inputCode.length <= 0){
	  alert("请输入验证码！");
	 }else{
	//如果验证码相同，则调用登录后台方法
		if(code ==$("#inputCode").val()){
				$.ajax({
					url:"<%=request.getContextPath()%>/UserController/login.do",
					type:"post",
					data:$("#loginForm").serialize(),
					dataType:"text",
					success:function (loginFlag){
						if(loginFlag == 2){
							location.href="<%=request.getContextPath()%>/treeShow.jsp";
							
						}else{
							alert("用户名或密码不正确");
						}
					},
					error:function (){
                        location.href="<%=request.getContextPath()%>/treeShow.jsp";
						//alert("程序出错");
					}
				});
		}else{
			alert("验证码错误，请重新输入！");
			
		}
	
	 }
} 

$("#zhuceButton").click(function (){	
	
	var saveForm=dialog({
		title:"注册账号",
		content:$("#zhuceForm"),
		ok:function(){	
			var pwd= $("#userp").val();
			var newPwd= $("#newPwd").val();
			
			if(pwd != newPwd){
				alert("两次密码不一致");
				return false;
			}if(pwd ==null || pwd ==""){
				alert("密码不能为空");
				return false;
			}
			var newPa= $("#loginn").val();
			var use=$("#usern").val();
			if(use==null || use==""){
				alert("账号不能为空");
				return false;
			}if(newPa==null || newPa==""){
				alert("登录名不能为空");
				return false;
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/UserController/queryUserLoginByName.do",
				type:"post",
				data:$("#zhuceForm").serialize(),
				dataType:"text",
				success:function (log){
					if(log==2){	
						alert("注册成功！！！");
					}if(log==1){
						alert("注册失败！用户名已存在！！");
						location.reload();	
					}	
				},
				error:function(){
					alert("注册程序错误");
				}
			});
		},
		okValue:"注册"
	});
	saveForm.showModal();
})
</script>
</body>
</html>