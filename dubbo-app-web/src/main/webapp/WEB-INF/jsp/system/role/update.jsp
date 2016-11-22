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
					        	window.location="${pageContext.request.contextPath}/system/role/toList.do";
					        }else{
					        	$.messager.alert('提示',data.msg);
					        }
					     }
					});
				}
			}
			function toList(){
				window.location="${pageContext.request.contextPath}/system/role/toList.do";
			}
			$(function(){ 
				$.ajax({   
				     url:'${pageContext.request.contextPath}/system/role/selectByPrimaryKey.do',   
				     type:'post',   
				     data:'id=${id}',
				     success:function(data){   
				    	 $('#ff').form('load',data);
							$.ajax({   
							     	url:'${pageContext.request.contextPath}/system/role/findRoleResourcesByRole.do',   
							     	type:'post',   
							     	data:'id='+data.id,
							     	success:function(data){   
										var s= new Array();
								     	for(var i=0;i<data.length;i++){
								    	  	s.push(data[i].resourcesId);
								      	}
								     	$("#cc").combotree('setValues',s);
							     	}
							});
				     }
				});
				
			}); 
		</script>
	</head>

	<body>
		<form id="ff"  action="${pageContext.request.contextPath}/system/role/update.do" method="POST">
			<input type="hidden" name="id" >
			<table>
				<tr>
					<td>
						role: 
					</td>
					<td>
						<input type="text"   name="name" required="true" validType="length[1,25]" class="easyui-textbox">
					</td>
				</tr>
				<tr>
					<td>resources:</td>
					<td>
						<input name="resourcesId" id="cc"   cascadeCheck ="false" required="true"  class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/system/resources/list.do'" multiple >
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
