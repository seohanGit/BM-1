$('#purchaseMonth').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/selectSumPurchase", // URL
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
$('#rentByPerson').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rentByPerson", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
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

$('#rentByMonth').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rentByMonth", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),month : $('#month').val()
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

$('#bookTeamCount').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookTeamCount", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
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
$('#teamCount').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/teamCount", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
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
$('#selectGroupByB').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/selectGroupByB", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()

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