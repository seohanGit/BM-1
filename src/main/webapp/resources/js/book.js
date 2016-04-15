$('.bestpicker').change(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			listType: 'best',
			year: $('#year').val(),
			month: $('#month').val(),
			keyword : $('#keyword').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr 
			$('#searchResultArea').empty().append(data);
		}
	});
});

$('.datepicker').change(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			listType: 'new',
			datepicker1: $('#datepicker1').val(),
			datepicker2: $('#datepicker2').val(),
			keyword : $('#keyword').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr 
			$('#searchResultArea').empty().append(data);
		}
	});
});

// 
$('#bestBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month: $('#month').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
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


 $('#btn_search').click(function() { 
	 $.ajax({ 
		 type : "get", // get or post 
		 url : "/searchBook",
		 datatype : "json", // html, xml, json, jsonp, script,
		 data : { 
			 keyword : $('#keyword').val(),
			 datepicker1 : $('#datepicker1').val(),
			 datepicker2 : $('#datepicker2').val(),
			 }, 
		 success : function(data,status) {
			 $('#dataTable_wrapper').empty().append(data);
		 }// ajax complete handelr gourl(url); 
	 }); // parameters as plain
 });

 $('#datepicker1').click(function() { 
	 $.ajax({ 
		 type : "get", // get or post 
		 url : "/searchBook",
		 datatype : "json", // html, xml, json, jsonp, script,
		 data : { 
			 keyword : $('#keyword').val(),
			 datepicker1 : $('#datepicker1').val(),
			 datepicker2 : $('#datepicker2').val(),
			 }, 
		 success : function(data,status) {
			 $('#dataTable_wrapper').empty().append(data);
		 }// ajax complete handelr gourl(url); 
	 }); // parameters as plain
 });
 $('#datepicker2').click(function() { 
	 $.ajax({ 
		 type : "get", // get or post 
		 url : "/searchBook",
		 datatype : "json", // html, xml, json, jsonp, script,
		 data : { 
			 keyword : $('#keyword').val(),
			 datepicker1 : $('#datepicker1').val(),
			 datepicker2 : $('#datepicker2').val(),
			 }, 
		 success : function(data,status) {
			 $('#dataTable_wrapper').empty().append(data);
		 }// ajax complete handelr gourl(url); 
	 }); // parameters as plain
 });
 $('#getBookInfo').click(function() {
 	$.ajax({
 		type : "GET", // GET or POST
 		url : "/findBook", // URL
 		datatype : "json", // html, xml, json, jsonp, script, text
 		data : { 
			 keyword : $('#keyword').val(),
			 type : $('#type').val()
			 }, 
 		error : function() { // Ajax error handler
 			alert('ajax failed');
 		},
 		success : function(data, status) { // Ajax complete handelr]
 			$('#insertForm').fadeOut();
 			$('#insertForm').empty();
 			$('#searchResultArea').empty().append(data);
 		}
 	});

 })