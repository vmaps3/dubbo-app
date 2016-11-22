<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<html>
	<head>
		<title>My JSP 'addUser.jsp' starting page</title>
		<script type="text/javascript">
			function submitForm(){
				if($("#ff").form('validate')){
					$.ajax({   
					     url:$("#ff").attr("action"),   
					     type:$("#ff").attr("method"),   
					     data:$("#ff").serializeArray(),
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
				}
			}
			
			function toList(){
				window.location="${pageContext.request.contextPath}/system/scheduleJob/toList.do";
			}
		</script>
	</head>
	<body>
		<form id="ff" action="${pageContext.request.contextPath}/system/scheduleJob/add.do" method="POST">
			<table>
			
				<tr>
					<td>name:</td>
					<td><input type="text" name="name" class="easyui-textbox" required="true" validType="length[1,25]"></td>
				</tr>
				<tr>
					<td>group:</td>
					<td><input type="text" name="group" class="easyui-textbox" required="true" validType="length[1,25]"></td>
				</tr>
				<tr>
					<td>cronExpression:</td>
					<td><input type="text" value="0/30 * * * * ?" name="cronExpression" class="easyui-textbox" required="true" validType="length[1,25]"></td>
				</tr>
				<tr>
					<td>className:</td>
					<td><input type="text" name="className" value="com.wangsong.job.TaskA"  class="easyui-textbox" required="true" validType="length[1,50]"></td>
				</tr>
				
				
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
	</body>
</html>
