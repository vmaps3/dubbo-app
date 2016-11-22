<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>
<html>
	<head>
		<title></title>
			<script type="text/javascript">
				function approval(value){
					$("#buttonValue").val(value);
					$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/activiti/leave/examine.do",
						   data: $('#ff').serializeArray(),
						   success: function(data){
								window.location="${pageContext.request.contextPath}/activiti/bpm/toList.do";
						   }
						});
				}
				function toList(){
					window.location="${pageContext.request.contextPath}/activiti/bpm/toList.do";
				}
				$(function(){ 
					$.ajax({   
					     url:'${pageContext.request.contextPath}/activiti/leave/selectByPrimaryKey.do',   
					     type:'post',   
					     data:'id=${id}',
					     success:function(data){   
					    	 $('#ff').form('load',data);
								
					     }
					});
				})
			</script>
		</head>
	<body>
		<form id="ff" action="" method="post" >
			<table  class="formTable">
				<tr>
					<td>天数：</td>
					<td>
						<input type="hidden" name="id" value="" />
						<input name="days" type="text" value=""   class="easyui-textbox"  required="required" />
					</td>
			
					<td>事由：</td>
					<td>
						<input name="reason" type="text"  value=""  class="easyui-textbox"  required="required" />
					</td>
				</tr>
				<tr>
					<td>批注：</td>
					<td><textarea name ="message" rows="" cols=""></textarea></td>
				</tr>
			</table>
			<input  type="hidden"  id="buttonValue" name="buttonValue" />
		</form>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="approval('同意')">同意</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="approval('不同意')">不同意</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
		<table id="dg"  class="easyui-datagrid"  fit="true"  title="批注信息"
           url="${pageContext.request.contextPath}/activiti/bpm/commentList.do?businessKey=${businessKey}"
           toolbar="#toolbar" 
           rownumbers="true" fitColumns="true" singleSelect="false" >
	       <thead>
	           <tr>
	           	<th field=""  data-options="checkbox:true"></th>
	               <th field="userName"  width="50">userName</th>
	               <th field="fullMessage"  width="50">fullMessage</th>
	               <th field="time"  width="50">time</th>
	           </tr>
	       </thead>
   		</table>
	</body>
</html>