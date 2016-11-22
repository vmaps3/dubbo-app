<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>
<html>
	<head>
	<title></title>
		<script type="text/javascript">
			function toList(){
				window.location="${pageContext.request.contextPath}/activiti/history/toList.do";
			}
		</script>
	</head>
	<body>
		<div >
			<img style="position: absolute;top: 0px;left: 0px;" src="${pageContext.request.contextPath}/activiti/history/viewImage.do?deploymentId=${deploymentId}&diagramResourceName=${diagramResourceName}">
			<div style="position: absolute;border:1px solid red;top:${acs.y}px;left: ${acs.x}px;width: ${acs.width}px;height:${acs.height}px;   "></div>
		</div>
		<div id="dlg-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="toList()">返回</a>
		</div>
	</body>
</html>