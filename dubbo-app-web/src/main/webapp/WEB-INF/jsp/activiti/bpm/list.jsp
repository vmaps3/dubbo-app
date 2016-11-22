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
		window.location='${pageContext.request.contextPath}/activiti/bpm/toViewImage.do?taskId='+row[0].id;
	}else{
		$.messager.alert('提示','请选择一条');
	}
}
function del2(){
	var row = $("#dg").datagrid('getSelections');
	if(row.length!=0) {
		window.location='${pageContext.request.contextPath}/activiti/bpm/toUpdate.do?id='+row[0].id;
	}else{
		$.messager.alert('提示','请选择一条');
	}
}


</script>
</head>
<body>
  	
   <table id="dg"  class="easyui-datagrid"  fit="true" 
            url="${pageContext.request.contextPath}/activiti/bpm/list.do"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" >
        <thead>
            <tr>
               	<th field=""  data-options="checkbox:true"></th>
                <th field="id" width="50">id</th>
                <th field="processDefinitionName" width="50">processDefinitionName</th>
                <th field="name" width="50">name</th>
                <th field="createTime" width="50">createTime</th>
             
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    
	        <a href="${pageContext.request.contextPath}/activiti/leave/toAdd.do" class="easyui-linkbutton" iconCls="icon-add" plain="true" >启动流程</a>
        
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del2()">办理</a>
    		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">查看流程图</a>
    		
    </div>

</body>
</html>