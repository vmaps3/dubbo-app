<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<html>
	<head>
		<title>My JSP 'updateUser.jsp' starting page</title>
		<script type="text/javascript">
			function submitForm(){
				if($("#ff").form('validate')==true){
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
			function toList(){
				window.location="${pageContext.request.contextPath}/system/user/toList.do";
			}
			$(function(){ 
				$.ajax({   
				     url:'${pageContext.request.contextPath}/system/user/selectByPrimaryKey.do',   
				     type:'post',   
				     data:'id=${id}',
				     success:function(data){   
				    	 $('#ff').form('load',data);
							$.ajax({   
							     	url:'${pageContext.request.contextPath}/system/user/findUserRoleByUser.do',   
							     	type:'post',   
							     	data:'id='+data.id,
							     	success:function(data){   
										var s= new Array();
								     	for(var i=0;i<data.length;i++){
								    	  	s.push(data[i].roleId);
								      	}
								      	$('#cc').combobox('setValues',s); 
							     	}
							});
				     }
				});
			})
		</script>
	</head>

	<body>
		<form id="ff" action="${pageContext.request.contextPath}/system/user/update.do" method="POST">
			<input type="hidden" id="id" name="id" value="">
			<table>
				<tr>
					<td>
						username: 
					</td>
					<td>
						<input type="text"  id="username" name="username"  readonly="true" class="easyui-textbox" required="true" validType="length[1,25]">
					</td>
				</tr>
				<tr>
					<td>
						password:
					</td>
					<td>
						<input type="password" name="password" id="password"   class="easyui-textbox"  validType="length[0,25]">
					</td>
				</tr>
				<tr>
					<td>role:</td>
					<td>
					
						<input id="cc" class="easyui-combobox" name="roleId"  multiple="multiple" required="true"
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
