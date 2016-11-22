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
					     url:'${pageContext.request.contextPath}/activiti/deployment/delete.do',   
					     type:'post',   
					     data:"id="+myArray,
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/activiti/deployment/toList.do";
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



</script>
</head>
<body>
  	
   <table id="dg"  class="easyui-datagrid"  fit="true" 
            url="${pageContext.request.contextPath}/activiti/deployment/list.do"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" >
        <thead>
            <tr>
               	<th field=""  data-options="checkbox:true"></th>
                <th field="id" width="50">id</th>
                <th field="name" width="50">name</th>
                <th field="deploymentTime" width="50">deploymentTime</th>
                <th field="category" width="50">category</th>
                <th field="tenantId" width="50">tenantId</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    
	        <a href="${pageContext.request.contextPath}/activiti/deployment/toAdd.do" class="easyui-linkbutton" iconCls="icon-add" plain="true" >新增</a>
        
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a>
    </div>

</body>
</html>