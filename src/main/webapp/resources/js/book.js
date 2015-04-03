$('#btn_national').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/national", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text// parameters
							// as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#well').empty().append(data);
		}
	});
});

$('#btn_international').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/searchBook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			keyword : $('#keyword').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#image1').fadeOut();
			$('#image2').fadeOut();
			$('#searchResultArea').empty().append(data);
		}
	});
});
