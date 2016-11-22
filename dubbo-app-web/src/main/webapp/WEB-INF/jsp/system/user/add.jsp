<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<html>
	<head>
		<title>My JSP 'addUser.jsp' starting page</title>
		<script type="text/javascript">
			function submitForm(){
				if($("#ff").form('validate')&&findUserByUser()){
					$.ajax({   
					     url:$("#ff").attr("action"),   
					     type:$("#ff").attr("method"),   
					     data:$("#ff").serializeArray(),
					     success:function(data){   
					        if(data.msg==null){
					        	window.location="${pageContext.request.contextPath}/system/user/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
				}
			}
			
			
			function findUserByUser(){
				var a=false;
				$.ajax({   
					     url:'${pageContext.request.contextPath}/system/user/findUserByUser.do',   
					     type:'post',   
					     async : false,
					     data:'username='+$("#username").val(), 
					     success:function(data){   
					        if(data==""){
					        	a= true;
					        }else{
					        	$.messager.alert('提示','用户名重名');
					        	a= false;
					        }
					     }
				});
				return a;
			}
			
			function toList(){
				window.location="${pageContext.request.contextPath}/system/user/toList.do";
			}
		</script>
	</head>
	<body>
		<form id="ff" action="${pageContext.request.contextPath}/system/user/add.do" method="POST">
			<table>
				<tr>
					<td>username:</td>
					<td><input type="text" id="username" name="username" class="easyui-textbox" required="true" validType="length[1,25]"></td>
				</tr>
				<tr>
					<td>password:</td>
					<td><input type="password" name="password" class="easyui-textbox" required="true" validType="length[0,25]"></td>
				</tr>
				<tr>
					<td>role:</td>
					<td>
						
						<input class="easyui-combobox" name="roleId"  multiple="multiple" required="true"
							data-options="
								url:'${pageContext.request.contextPath}/system/role/listAll.do',
								method:'get',
								valueField:'id',
								textField:'name',
								panelHeight:'auto'
							">
					</td>
				</tr>
				
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
	</body>
</html>
