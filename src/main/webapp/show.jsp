<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<!-- top  条件查询-->
	<div id="p" class="easyui-panel" title="搜索" style="width:700px;height:30px;padding:10px;background:#fafafa;"  data-options="iconCls:'icon-search',collapsible:true">
		<font color="black">
			日志名：<input id="methodname">&nbsp;&nbsp;&nbsp;

			区间查询：<input type="text" class="Wdate" id="kaishi" name="searchstarttime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'timeEnd\')}'})">
						至
				      <input type="text" class="Wdate" id="jieshu" name="searchendtime"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'timeStart\')}'})">
			&nbsp;&nbsp;&nbsp;<input type="button" value="搜索" onclick="search()">
		</font>
	</div>


<table id="logshow"></table>
<div id="add-div"></div>
<script type="text/javascript">
	$(function(){
		search();
	})
	//查询
	function search(){
		$('#logshow').datagrid({    
		    url:'<%=request.getContextPath()%>/rz/queryLogPojoPage.do',   
		    queryParams:{methodname:$("#methodname").val()},
		    pagination:true,//开启分页
		    pageNumber:1,//初始化页码
		    pageSize:3,//每页条数
		    pageList:[3,5,8,10],
		    columns:[[
				//{field:'che',checkbox:true},
		        //field:尽可能对应实体类中的属性名，必须保证唯一性    title：列标题   width：每列宽度
		        {field:'logid',title:'ID',width:100},
		        {field:'methodname',title:'跳转页面方法名',width:100},
		        {field:'urlstr',title:'service路径',width:100},
		        {field:'acttime',title:'保存时间',width:100},
		        {field:'act',title:'操作',width:100,
		        	formatter: function(value,row,index){
		        		console.info(row.logid);
		        		return "<input type='button' style='width:50px;height:30px;border:1px' class='icon-no' onclick='delButton("+row.logid+")'><input type='button' style='width:50px;height:30px;border:1px' class='icon-edit' onclick='updateButton("+row.logid+")'>";
		        	}
		        },
		    ]],
		});
	}
   // 时间
    $(function(){
        $("#kaishi").datetimepicker({
            format: "yyyy-mm-dd",//显示格式
            language: 'zh-CN',//显示中文
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });
        $("#jieshu").datetimepicker({
            format: "yyyy-mm-dd",//显示格式
            language: 'zh-CN',//显示中文
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });

    })
</script>
</body>
</html>