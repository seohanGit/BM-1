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
$('#bestBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/selectBestBook", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert('검색어를 입력하세요');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#container').empty().append(data);
			$('table.highchart').highchartTable();
		}
	});
});

$('#btn_bookList').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#goodPhrase').fadeOut();
			$('#image1').fadeOut();
			$('#image2').fadeOut();
			$('#searchResultArea').empty().append(data);
			$('#container').empty().append(data);
		}
	});
});

/*
 * $('#btn_search').click(function() { $.ajax({ type : "GET", // GET or POST url :
 * "/countBook", // URL datatype : "json", // html, xml, json, jsonp, script,
 * text data : { keyword : $('#keyword').val() }, success : function(data,
 * status) { // Ajax complete handelr goUrl(url); }, // parameters as plain
 * object error : function() { // Ajax error handler alert('ajax failed'); } });
 * });
 */