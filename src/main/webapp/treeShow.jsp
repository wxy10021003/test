<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入JQuery -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/jquery.min.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/jquery.easyui.min.js"></script>

<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<!-- 支持tree组件的使用 -->
<script type="text/javascript"
                 src="<%=request.getContextPath()%>/EasyUI/util-js.js"></script>
            
<script type="text/javascript" src="<%=request.getContextPath()%>/uploadify/jquery.uploadify.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/uploadify/uploadify.css"/>


<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/black/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
                 href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
</head>
<body class="easyui-layout">  
<div data-options="region:'north',title:'头版'" style="height:100px;"><br>
<table align="right">
 <tr>
<td>
<%--<font color="white" size="3px">欢迎 ${loginN}&nbsp;&nbsp;&nbsp;&nbsp;
 </font>--%>
</td>
</tr>
<tr>
<td>
<%--<font color="white" size="3px">
    注销请点击<a href="login.jsp">这里</a>
    </font>--%>
</td>
</tr> 
</table>

</div>   
    <div data-options="region:'west',title:'导航'" style="width:200px;">
	    <div id="aa" data-options="fit:true" class="easyui-accordion" style="width:300px;height:200px;">   
	    <div title="一" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">   
	          <div id="tt" class="easyui-tree">   
              </div>  
	    </div>   
	</div>  
    </div>   
    <div data-options="region:'center',title:'显示'" style="padding:5px">
    		<div id="aatabs" class="easyui-tabs">   
			    <div title="一">   
			       
			    </div>   
			</div>  
			
        </div>  
    </div>
  
    <script type="text/javascript">
    
  //展示树形
      $("#aa").tree({
    	  
    	  url:"<%=request.getContextPath()%>/treeController/selectTreeList.do",
    	  method:"post",
    	  //每个节点前面是否显示复选框
    	 checkbox:true,
    	 //定义树的父节点字段名
    	  parentField:'pid',//实体类定义的pid一致
    	  //用户选择节点的时候触发的事件
    	  onSelect:function(node){
    		 // alert(node)
    		  //判断对象是否有触发事件
    		  if(node.url!="" || node.url!=null){
	    		 //查看子节点是否存在
	    		 var flag=$("#aatabs").tabs('exists',node.text);
	    		//如果存在则直接打开已打开的
	    		 if(flag){
	    			 $("#aatabs").tabs('select',node.text);
	    		 }else{//如果不存在则重新打开
	    		  $('#aatabs').tabs('add',{ 
	    			  //打开一个新的选项卡，选项卡的标题
	    			    title:node.text, 
	    			    //触发的事件
	    			    href:"<%=request.getContextPath()%>/"+node.url,
	    			    //是否显示关闭按钮
	    			    closable:true,    
	    			   //通过数组定义工具菜单
	    			    tools:[{ 
	    			    	//设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
	    			        iconCls:'icon-mini-refresh',    
	    			       //面板头部  触发事件  点击按钮触发事件
	    			        handler:function(){    
	    			            alert('refresh');    
	    			        }    
	    			    }]    
	    			}); 
	    		 }
	    	  }
    	  }
      })
    </script>
</body>
</html>