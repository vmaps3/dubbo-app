<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User list</title>
<script type="text/javascript">
	function DateFormatter(value,row,index){
 		var unixTimestamp = new Date(value);
 		return unixTimestamp.toLocaleString();
	}
	function usernameFormatter(value,row,index){
		if(row.user==null){
			return "";
		}else{
			return row.user.username;
		}
		 
	}
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
						     url:'${pageContext.request.contextPath}/system/log/delete.do',   
						     type:'post',   
						     data:"id="+myArray,
						     success:function(data){   
						        if(data.msg==null){
						        	window.location="${pageContext.request.contextPath}/system/log/toList.do";
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
            url="${pageContext.request.contextPath}/system/log/list.do"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" pageList="[10,50,100,500,1000,5000]">
        <thead>
            <tr>
               <th field=""  data-options="checkbox:true"></th>
                <th field="url" width="50">url</th>
                <th field="parameter" width="50">parameter</th>
                <th field="remoteAddr" width="50">remoteAddr</th>
                <th field="agent" width="50">agent</th>
                <th field="user"  width="50"  formatter="usernameFormatter">username</th>
                <th field="beginTime" width="50" formatter="DateFormatter">begintime</th>
                <th field="endTime" width="50" formatter="DateFormatter">endtime</th>
             
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    	<shiro:hasPermission name="/system/log/delete">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a>
        </shiro:hasPermission>
    </div>

</body>
</html>