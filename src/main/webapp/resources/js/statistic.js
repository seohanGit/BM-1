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
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
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
			$('#full').empty().append(data);
			$('#table').empty();
			$('#chart').empty();
			$('#chart').empty();
			$('table.highchart').highchartTable();
			$('#table').empty();
			$('#table').show("slow");
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
			year : $('#year').val(),
			month : $('#month').val(),
			which : 'table'
		},
		// parameters as plain object
		error : function() { // Ajax error handler
			alert('검색어를 입력하세요');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty().append(data);
			//$('#table').empty();
			$('#chart').empty();
			$('table.highchart').highchartTable();
		}
	});
	$('.highcharts-container').css('display','inline');
	
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
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			
		}
	});
});

$('#bookCount').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookCount", // URL
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
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			
		}
	});
});

$('#rankGroupByB').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rankGroupByB", // URL
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
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
		}
	});
});
$('#rankGroupByBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rankGroupByBook", // URL
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
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
		}
	});
});
