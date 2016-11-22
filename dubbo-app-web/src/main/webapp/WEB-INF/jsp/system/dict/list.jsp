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
		        	for(var i=0;i<row.length;i++){
		        		myArray.push(row[i].id);
		        	}
		        	$.ajax({   
					     url:'${pageContext.request.contextPath}/system/dict/delete.do',   
					     type:'post',   
					     data:"id="+myArray,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/dict/toList.do";
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
function cx(){
	var obj=$("#searchFrom").serializeObject(); 
	$("#dg").datagrid('load',obj); 
}
//弹窗修改
function upd(){
	var row =  $("#dg").datagrid('getSelections');
	if(row.length==1){
		window.location="${pageContext.request.contextPath}/system/dict/toUpdate.do?id="+row[0].id;
	}else{
		$.messager.alert('提示','请选择一条');
	}
}

</script>
</head>
<body>
  	
   <table id="dg"  class="easyui-datagrid"  fit="true" 
            url="${pageContext.request.contextPath}/system/dict/list.do"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" >
        <thead>
            <tr>
               	<th field=""  data-options="checkbox:true"></th>
                <th field="code" width="50">code</th>
                <th field="name" width="50">name</th>
                <th field="type" width="50">type</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    	<form id="searchFrom" action="">
			name:<input type="text" name="name" class="easyui-validatebox" />
			type:<input type="text" name="type" class="easyui-validatebox" />
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="cx()">查询</a><br>
		</form>
    	<shiro:hasPermission name="/system/dict/add">
	        <a href="${pageContext.request.contextPath}/system/dict/toAdd.do" class="easyui-linkbutton" iconCls="icon-add" plain="true" >新增</a>
	    </shiro:hasPermission>
        <shiro:hasPermission name="/system/dict/update">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="upd()">编辑</a>
	    </shiro:hasPermission>
        <shiro:hasPermission name="/system/dict/delete">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a>
	    </shiro:hasPermission>
    </div>

</body>
</html>