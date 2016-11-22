<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title></title>
	<script type="text/javascript">
		function submitForm(){
			if($("#ff").form('validate')==true){
				$.ajax({   
				     url:$("#ff").attr("action"),   
				     type:$("#ff").attr("method"),   
				     data:$("#ff").serializeArray(),
				     success:function(data){   
				        if(data.msg==null){
				        	window.location="${pageContext.request.contextPath}/";
				        }else{
				        	$.messager.alert('提示',data.msg);
				        }
				     }
				});
			}
			
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
  </head>
  
  <body>
 
   <div id="login-dialog" class="easyui-dialog" title="登录" style="width:auto;height:auto;"
     data-options="iconCls:'icon-login-user',resizable:false,modal:false,closable:false,draggable:false">
	<form id="ff" style="padding:10px 20px 10px 40px;" action="${pageContext.request.contextPath}/login.do" method="post">
		<p>账号: <input type="text" name="username" value="wangsong" class="easyui-textbox" required="true"></p>
		<p>密码: <input type="password"  name="password" value="wangsong" class="easyui-textbox" required="true"></p>
		<div style="padding:5px;text-align:center;">
			
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
		</div>
	</form>
</div>
  </body>
</html>
