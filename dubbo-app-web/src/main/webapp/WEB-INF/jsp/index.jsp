<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title></title>
	<script type="text/javascript">
		function addTab(title, url){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			} else {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
		
		$(function(){ 
			$('#tree').tree({
				url: '${pageContext.request.contextPath}/system/resources/findResourcesEMUByResources.do',
			 	onClick: function(node){
			       if($('#tree').tree('isLeaf',node.target)){//判断是否是叶子节点
			    	   addTab(node.text,'${pageContext.request.contextPath}'+node.attributes.url)
			       }
			    }
			});
		}); 
		function logout(){
			  $.messager.confirm("确认", "确认注销吗？", function (r) {
			        if (r) {
			        	window.location="${pageContext.request.contextPath}/logout.do";
			        }
			    });
		}
	</script>
  </head>
  
 
    
   
  <body class="easyui-layout">
    <div data-options="region:'north',split:true" style="height:70px;">
    	<div style="margin-top: 20px;padding-left: 50px;">
	    	 <span style="font-size: 20px;">dubbo-app</span>
	    	  <a href="javascript:void(0)" class="easyui-linkbutton"  style="float: right;margin-right: 50px;" onclick="logout()">退出</a>
           </div>
    </div>
    
   
    <div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
    	<div id="tree"></div>
    </div>
    <div id="tt"   class="easyui-tabs" data-options="region:'center'" >
    	<div title="首页" style="padding:10px">
			<p style="font-size:14px">dubbo-app</p>
			
		</div>
	
    </div>
</body>
</html>
