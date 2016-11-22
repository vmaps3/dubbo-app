<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>
<html>
<head>
<title></title>

</head>
<body>
	<form id="ff"  action="${pageContext.request.contextPath}/activiti/deployment/add.do" method="post" enctype="multipart/form-data">
		<table >
			<tr>
				<td>流程名称：</td>
				<td>
				<input name="filename" type="text"  class="easyui-textbox"  required="required"/>
				</td>
			</tr>
			<tr>
				<td>流程文件：</td>
				<td>  
					<input name="file" class="easyui-filebox" required="required"/>
                </td>
			</tr>
			
		</table>
	</form>
	<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
<script type="text/javascript">

function submitForm(){
	if($("#ff").form('validate')==true){
		 var formData = new FormData($( "#ff" )[0]);  
		$.ajax({   
		     url:$("#ff").attr("action"),   
		     type:$("#ff").attr("method"),   
		     data:formData,
		     async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
		     success:function(data){   
		        if(data.msg==null){
		        	window.location="${pageContext.request.contextPath}/activiti/deployment/toList.do";
		        }else{
		        	$.messager.alert('提示',data.msg);
		        }
		     }
		});
	}
}
function toList(){
	window.location="${pageContext.request.contextPath}/activiti/deployment/toList.do";
}

</script>
</body>
</html>