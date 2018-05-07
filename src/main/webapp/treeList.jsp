<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div id="treeshow"></div>
<div id="mm" class="easyui-menu" style="width:120px;">
	<div onclick="appendTree()" data-options="iconCls:'icon-add'">追加</div>
	<div onclick="removeTree()" data-options="iconCls:'icon-remove'">移除</div>
	<div onclick="updateTree()" data-options="iconCls:'icon-edit'">修改</div>
</div>
<!-- 修改弹框 -->
<div id="qwwe"></div>  
<!-- 新增弹框 -->
<div id="add_tree"></div>
<script type="text/javascript">
//=====================修改=====================
		function updateTree(){
			var pp= $("#treeshow").tree("getSelected");
			alert(pp)
			$('#qwwe').dialog({    
			    //框框标题
				title: '修改系列',    
			    //面板宽度
				width: 400,    
			    //面板高度
				height: 200,    
				//定义是否在初始化的时候关闭面板
				closed: false,    
				//如果为true，在超链接载入时缓存面板内容
				cache: false,    
			    href: 'UpdateTree.jsp',    
			  //定义是否将窗体显示为模式化窗口
			    modal: true ,
			   // 在加载远程数据时触发     当加载成功的时候让我们通过ajax加载面板内容并显示一些消息
			    onLoad:function(){
			    },
			    //对话框窗口底部按钮
			    buttons:[{
					text:'修改',
					handler:function(){
						 $.ajax({
					   		 	url:"<%=request.getContextPath() %>/treeController/UpdateTree.do",
					   			type:"post",
					   		    data:$("#updatetree").serialize(),
					   		    success:function(result){
					   		    	if (result) {
					   		    		history.go(0)
									}
					   		 	}
						}) 
					}
				},{
					text:'取消',
					handler:function(){
					}
				}]
			}); 
			
		}


//===========================删除==================
	function removeTree(){
		var node=$("#treeshow").tree("getSelected");
		$.ajax({
    		url:"<%=request.getContextPath()%>/treeController/deleteTree.do?",
    		data:{"id":node.id},
    		type:"post",
    		success:function(){
    			$("#treeshow").tree("reload");
    			$("#aa").tree("reload");
    		},
    		error:function(){
    			 $.messager.alert('警告','删除报错'); 
    		}
    	})
	
	
	}

//=================新增==================
	function appendTree(){
		var node=$("#treeshow").tree("getSelected");
		$("#add_tree").dialog({
	 		//对话框窗口标题文本 	
	 			title: '新增',    
    		   //设置面板宽度
	 			width: 400,    
    		   //设置面板高度
	 			height: 200,    
    		   //定义是否在初始化的时候关闭面板
	 			closed: false,    
    		    //如果为true，在超链接载入时缓存面板内容
	 			cache: false,
    		    href:"<%=request.getContextPath()%>/treeController/tuTree.do?id="+node.id,
    		    //定义是否将窗体显示为模式化窗口
    		    modal: true ,
    		    //定义按钮的工具   保存按钮
    		    toolbar:[{
    				text:'保存',
    				//设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
    				iconCls:'icon-edit',
    				//面板头部  触发事件  点击按钮触发事件
    				handler:function(){
    					//新增的ajax
    					$.ajax({
    						url:"<%=request.getContextPath()%>/treeController/addTree.do",
    						//addform  addStudent.jsp中form的id   提交addStudent.jsp中form
    						data:$("#addtree").serialize(),
    						type:"post",
    						success:function(){
    							//关闭新增弹框
    							$("#add_tree").dialog("close");
    							//刷新展示表格
    							$("#treeshow").tree("reload");
    							$("#aa").tree("reload");
    							
    						},error:function(){
    							 $.messager.alert('警告','新增报错'); 
    						}
    					})
    					
    				}
    			},{
    				//点击取消关闭新增面板
    				text:'取消',
    				//设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
    				iconCls:'icon-cancel',
    				//面板头部  触发事件  点击按钮触发事件
    				handler:function(){
    					$("#add_tree").dialog("close");
    				}
    			}]
	 		
	 	})
		
		
	}
	





//===============展示树形菜单=======右击展开选项按钮=============	
	$("#treeshow").tree({
		  url:"<%=request.getContextPath()%>/treeController/selectTreeList.do",
	  	  method:"post",
	  	  	//每个节点前面是否显示复选框
	  	  	//checkbox:true,
	  	 	//定义树的父节点字段名
	  	  parentField:'pid',//实体类定义的pid一致
	  		//右击触发事件
	  	  onContextMenu: function(e, node){
				e.preventDefault();
				// 查找节点
				$('#treeshow').tree('select', node.target);
				// 显示快捷菜单
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			}

	})
	

</script>
</body>
</html>