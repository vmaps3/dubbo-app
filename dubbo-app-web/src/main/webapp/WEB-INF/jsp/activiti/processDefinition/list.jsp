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
		window.location='${pageContext.request.contextPath}/activiti/processDefinition/toViewImage.do?deploymentId='+row[0].deploymentId+"&diagramResourceName="+row[0].diagramResourceName;      
	}else{
		$.messager.alert('提示','请选择一条');
	}
}



</script>
</head>
<body>
  	
   <table id="dg"  class="easyui-datagrid"  fit="true" 
            url="${pageContext.request.contextPath}/activiti/processDefinition/list.do"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" >
        <thead>
            <tr>
               	<th field=""  data-options="checkbox:true"></th>
                <th field="id" width="50">id</th>
                <th field="name" width="50">name</th>
                <th field="key" width="50">key</th>
                <th field="deploymentId" width="50">deploymentId</th>
                <th field="description" width="50">description</th>
                <th field="diagramResourceName" width="50">diagramResourceName</th>
                <th field="resourceName" width="50">resourceName</th>
                <th field="tenantId" width="50">tenantId</th>
                <th field="version" width="50">version</th>
                <th field="category" width="50">category</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">        
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">查看</a>
    </div>

</body>
</html>