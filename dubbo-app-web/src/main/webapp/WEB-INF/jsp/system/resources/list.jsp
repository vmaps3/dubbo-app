<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User list</title>
<script type="text/javascript">
function append(){
	var t = $('#tt');
	var node = t.tree('getSelected');
	window.location='${pageContext.request.contextPath}/system/resources/toAdd.do?pid='+node.id
}
function removeit(){
	var node = $('#tt').tree('getSelected');
	
	 $.messager.confirm("确认", "确认删除吗？", function (r) {
	        if (r) {
	        	$('#tt').tree('remove', node.target);
	        	$.ajax({   
				     url:'${pageContext.request.contextPath}/system/resources/delete.do',   
				     type:'post',   
				     data:"id="+node.id,
				     success:function(data){   
				        if(data.msg==null){
				        	window.location="${pageContext.request.contextPath}/system/resources/toList.do";
				        }else{
				        	$.messager.alert('提示',data.msg);
				        }
				     }
				});
	        }
	 });
}
function up(){
	var node = $('#tt').tree('getSelected');
	window.location='${pageContext.request.contextPath}/system/resources/toUpdate.do?id='+node.id;
	      
}


</script>
</head>
<body >
  	
   
	<ul id="tt" class="easyui-tree" data-options="
			url: '${pageContext.request.contextPath}/system/resources/list.do',
			method: 'get',
			animate: true,
			onContextMenu: function(e,node){
				e.preventDefault();
				$(this).tree('select',node.target);
				$('#mm').menu('show',{
					left: e.pageX,
					top: e.pageY
				});
			}
		"></ul>
    
   
    <div id="mm" class="easyui-menu" style="width:120px;">
    	<shiro:hasPermission name="/system/resources/add">
			<div onclick="append()" data-options="iconCls:'icon-add'">添加</div>
		 </shiro:hasPermission>
        <shiro:hasPermission name="/system/resources/update">
			<div onclick="up()" data-options="iconCls:'icon-edit'">更改</div>
		 </shiro:hasPermission>
        <shiro:hasPermission name="/system/resources/delete">
			<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>	
		</shiro:hasPermission>
	</div>
</body>
</html>