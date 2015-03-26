$('#btn_search').click(function() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/searchBook",						// URL
		datatype:"xml",						// html, xml, json, jsonp, script, text
		data:{keyword:$('#keyword').val()},			// parameters as plain object
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr
			$('#image1').fadeOut();
			$('#image2').fadeOut();
			$('#searchResultArea').empty().append(data);
		}
	});
});

$('.board .btn').click(function() {
	$(this).parent().parent().find('.content').toggleClass('ellipsis');
});

$('#blackList').click(function() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/searchBlack",						// URL
		datatype:"xml",						// html, xml, json, jsonp, script, text
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr]
			$('#image3').fadeOut();
			$('#personResultArea').empty().append(data);
		}
	});
	
})

$('#late').click(function() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/searchLate",						// URL
		datatype:"xml",						// html, xml, json, jsonp, script, text
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr]
			$('#image3').fadeOut();
			$('#personResultArea').empty().append(data);
		}
	});
	
})

$('#register').click(function() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/selectboard",						// URL
		datatype:"xml",		
		data:{per:"register"},// html, xml, json, jsonp, script, text
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});
	
})

$('#title').click(function() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/selectboard",						// URL
		datatype:"xml",		
		data:{per:"title"},// html, xml, json, jsonp, script, text
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});
	
})