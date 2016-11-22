function haha(){
	$.ajax({   
		 url:'/spring-app/haha/haha.do',   
		 type:'post',   
		 data:$("#ff").serializeArray(),
		 success:function(data){   
			 $("body").css('display','none'); 
			if(data.key=="1"){
				//$("#submitForm").append('<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>');
				//$.parser.parse($('#submitForm').parent());
				$("body").css('display','block'); 
				$.parser.parse($('body').parent());
			}
		 }
	});
}
