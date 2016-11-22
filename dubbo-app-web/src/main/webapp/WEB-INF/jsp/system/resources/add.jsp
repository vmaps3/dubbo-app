<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<html>
	<head>
		<title>My JSP 'addUser.jsp' starting page</title>
		<script type="text/javascript">
			function submitForm(){
				if($("#ff").form('validate')==true){
					$.ajax({   
					     url:$("#ff").attr("action"),   
					     type:$("#ff").attr("method"),   
					     data:$("#ff").serializeArray(),
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/resources/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
				}
			}
			function toList(){
				window.location="${pageContext.request.contextPath}/system/resources/toList.do";
			}
			
		</script>
	</head>

	<body>
		<form id="ff" action="${pageContext.request.contextPath}/system/resources/add.do" method="POST">
			<input type="hidden" name="pid" value="${pid}"/>
			<table>
				
				
				<tr>
					<td>name:</td>
					<td><input type="text" name="name" class="easyui-textbox" required="true" validType="length[1,25]"></td>
				</tr>
				<tr>
					<td>url:</td>
					<td><input type="text" name="url" class="easyui-textbox" validType="length[0,50]"></td>
				</tr>
				<tr>
					<td>type:</td>
					<td>
						<input class="easyui-combobox" name="type" required="true"
							data-options="
								url:'${pageContext.request.contextPath}/system/dict/findDictByDict.do?type=1',
								method:'get',
								valueField:'code',
								textField:'name',
								panelHeight:'auto'
							">
					</td>
				</tr>
				<tr>
					<td>sort:</td>
					<td><input type="text" name="sort" class="easyui-textbox" validType="length[0,25]"></td>
				</tr>
				
				
				
				
			
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
	</body>
</html>
