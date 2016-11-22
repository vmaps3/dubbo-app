<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>
<html>
<head>
<title></title>

</head>
<body>
<div>
	<form id="mainform" action="" method="post" >
		<table  class="formTable">
			<tr>
				<td>天数：</td>
				<td>
					<input name="days" type="text" value=""   class="easyui-textbox"  required="required"/>
				</td>
			</tr>
			<tr>
				<td>事由：</td>
				<td>
					<input name="reason" type="text"  value=""  class="easyui-textbox"  required="required"/>
				</td>
			</tr>
			
		</table>
		
	</form>
	
	
	<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="approval()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
	</div>
</div>

<script type="text/javascript">
function approval(){
		$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/activiti/leave/add.do",
			   data: $('#mainform').serializeArray(),
			   success: function(data){
					window.location="${pageContext.request.contextPath}/activiti/bpm/toList.do";
			   }
			});

}
function toList(){
	window.location="${pageContext.request.contextPath}/activiti/bpm/toList.do";
}
</script>
</body>
</html>