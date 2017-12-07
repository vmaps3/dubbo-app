jQuery.prototype.serializeObject=function(){  
	var obj=new Object();  
	$.each(this.serializeArray(),function(index,param){  
		if(!(param.name in obj)){  
			obj[param.name]=param.value;  
		}  
	});  
	return obj;  
}; 
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 
$.ajaxSetup({ 
	complete: function (xhr, status) {
		try{
			if(xhr.responseJSON.result=="index"){
				if(window.parent!=window){
					parent.location.href=htmlURL+"/login.html";
				}else{
					location.href=htmlURL+"/login.html";
				}
			}
		}catch (e) {
			// TODO: handle exception
		}
	}
});