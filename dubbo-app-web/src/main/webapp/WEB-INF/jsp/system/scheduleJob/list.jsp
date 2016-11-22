<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User list</title>
<script type="text/javascript">
//删除
function del(){
	var row = $("#dg").datagrid('getSelections');
	if(row.length!=0) {
		 $.messager.confirm("确认", "确认删除吗？", function (r) {
		        if (r) {
		        	var myArray=new Array();
		        	var myArray2=new Array();
		        	for(var i=0;i<row.length;i++){
		        		myArray.push(row[i].name);
		        		myArray2.push(row[i].group);
		        	}
		        	$.ajax({   
					     url:'${pageContext.request.contextPath}/system/scheduleJob/delete.do',   
					     type:'post',   
					     data:"name="+myArray+"&group="+myArray2,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
		        }
		 });
	}else{
		$.messager.alert('提示','请选择一条');
	}
}

//弹窗修改
function upd(){
	var row =  $("#dg").datagrid('getSelections');
	if(row.length==1){
		window.location="${pageContext.request.contextPath}/system/scheduleJob/toUpdate.do?name="+row[0].name+"&group="+row[0].group+"&cronExpression="+row[0].cronExpression+"&className="+row[0].className;
	}else{
		$.messager.alert('提示','请选择一条');
	}
}

function startNow(){
	var row = $("#dg").datagrid('getSelections');
	if(row.length!=0) {
		 $.messager.confirm("确认", "确认操作吗？", function (r) {
		        if (r) {
		        	var myArray=new Array();
		        	var myArray2=new Array();
		        	for(var i=0;i<row.length;i++){
		        		myArray.push(row[i].name);
		        		myArray2.push(row[i].group);
		        	}
		        	$.ajax({   
					     url:'${pageContext.request.contextPath}/system/scheduleJob/startNow.do',   
					     type:'post',   
					     data:"name="+myArray+"&group="+myArray2,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
		        }
		 });
	}else{
		$.messager.alert('提示','请选择一条');
	}
}

function resume(){
	var row = $("#dg").datagrid('getSelections');
	if(row.length!=0) {
		 $.messager.confirm("确认", "确认操作吗？", function (r) {
		        if (r) {
		        	var myArray=new Array();
		        	var myArray2=new Array();
		        	for(var i=0;i<row.length;i++){
		        		myArray.push(row[i].name);
		        		myArray2.push(row[i].group);
		        	}
		        	$.ajax({   
					     url:'${pageContext.request.contextPath}/system/scheduleJob/resume.do',   
					     type:'post',   
					     data:"name="+myArray+"&group="+myArray2,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
		        }
		 });
	}else{
		$.messager.alert('提示','请选择一条');
	}
}

function stop(){
	var row = $("#dg").datagrid('getSelections');
	if(row.length!=0) {
		 $.messager.confirm("确认", "确认操作吗？", function (r) {
		        if (r) {
		        	var myArray=new Array();
		        	var myArray2=new Array();
		        	for(var i=0;i<row.length;i++){
		        		myArray.push(row[i].name);
		        		myArray2.push(row[i].group);
		        	}
		        	$.ajax({   
					     url:'${pageContext.request.contextPath}/system/scheduleJob/stop.do',   
					     type:'post',   
					     data:"name="+myArray+"&group="+myArray2,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
		        }
		 });
	}else{
		$.messager.alert('提示','请选择一条');
	}
}
function cron(){
	window.location="${pageContext.request.contextPath}/system/scheduleJob/cron.do";
}

</script>
</head>
<body>
  	
   <table id="dg"  class="easyui-datagrid"  fit="true" 
            url="${pageContext.request.contextPath}/system/scheduleJob/list.do"
            toolbar="#toolbar" 
            rownumbers="true" fitColumns="true" singleSelect="false" >
        <thead>
            <tr>
            	<th field=""  data-options="checkbox:true"></th>
                <th field="name"  width="50">name</th>
                <th field="group"  width="50">group</th>
                <th field="cronExpression"  width="50">cronExpression</th>
                <th field="status"  width="50">status</th>
                <th field="className"  width="50">className</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar" >
    	
			<a href="${pageContext.request.contextPath}/system/scheduleJob/toAdd.do" class="easyui-linkbutton" iconCls="icon-add" plain="true" >新增</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="upd()">编辑</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon-edit" plain="true" onclick="stop()">暂停</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon-edit" plain="true" onclick="resume()">恢复</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon-edit" plain="true" onclick="startNow()">执行一次</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon-edit" plain="true" onclick="cron()">表达器生成</a>
    </div>
</body>
</html>