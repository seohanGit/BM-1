$('.bestpicker').change(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			listType : 'best',
			year : $('#year').val(),
			month : $('#month').val(),
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
			listType : 'new',
			datepicker1 : $('#datepicker1').val(),
			datepicker2 : $('#datepicker2').val(),
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

$('.rcmdChk').on(
		'click',
		function() {
			var $row = $(this).closest('tr');
			var $tds = $row.find('td');

			var rcmdChk = "";
			var bookcd = "";
			var bookcd = $(this).closest('tr').children('td.book_cd').text();
			var td_rcmdChk = $(this).closest('tr').children('td.rcmdChk').find(
					'input:checkbox').is(':checked');
			if (td_rcmdChk == true) {
				td_rcmdChk = '1';
			} else {
				td_rcmdChk = '0';
			}
			$.ajax({
				type : "GET", // GET or POST
				url : "/setRecommend", // URL
				datatype : "xml", // html, xml, json, jsonp, script, text
				data : {
					book_cd : bookcd,
					rcmdChk : td_rcmdChk
				}, // parameters as plain object
				success : function(data, status) { // Ajax complete handelr
					alert('설정 완료');
				}
			});
		});
$('.borrow').on(
		'click',
		function() {
			var $row = $(this).closest('tr');
			var $tds = $row.find('td');

			var listType = $('#listType').val();
			var keyword = $('#keyword').val();
			var bookcd = "";
			var bookcd = $(this).val();
			if (bookcd == '') {
				bookcd = $('#book_cd').text();
			}
			var enckeyword = encodeURI(keyword);
			$.ajax({
				type : "GET", // GET or POST
				url : "/borrowbook", // URL
				datatype : "xml", // html, xml, json, jsonp, script, text
				data : {
					book_cd : bookcd,
					listType : listType,
					keyword : enckeyword
				}, // parameters as plain object
				success : function(data, status) { // Ajax complete handelr
					if (data == 'fail') {
						alert('대출이 불가합니다.');
					} else {
						alert('대출승인요청되었습니다.');
					}
					top.location.href = '/searchBook?listType=' + listType
							+ '&keyword=' + enckeyword;
				}
			});

		});
$('.borrow1')
		.on(
				'click',
				function() {

					var listType = $('#listType').val();
					var keyword = $('#keyword').val();
					var bookcd = $('#book_cd').text();
					$
							.ajax({
								type : "GET", // GET or POST
								url : "/borrowbook", // URL
								datatype : "xml", // html, xml, json, jsonp,
													// script, text
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								data : {
									book_cd : bookcd,
									listType : listType,
									keyword : keyword
								}, // parameters as plain object
								success : function(data, status) { // Ajax
																	// complete
																	// handelr
									if (data == 'fail') {
										alert('대출이 불가합니다.');
									} else {
										alert('대출승인요청되었습니다.');
										opener.location.href = '/searchBook?listType='
												+ listType
												+ '&keyword='
												+ keyword;
										self.close();
									}
								}
							});
				});
$('.borrow2').on('click', function() {

	var listType = $('#listType').val();
	var keyword = $('#keyword').val();
	var bookcd = $('#book_cd').text();
	$.ajax({
		type : "GET", // GET or POST
		url : "/borrowbook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		data : {
			book_cd : bookcd,
			listType : listType,
			keyword : keyword
		}, // parameters as plain object
		success : function(data, status) { // Ajax complete handelr
			if (data == 'fail') {
				alert('대출이 불가합니다.');
			} else {
				alert('대출승인요청되었습니다.');
				self.close();
			}
		}
	});
});
$('#bestBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
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
		success : function(data, status) {
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
		success : function(data, status) {
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
		success : function(data, status) {
			$('#dataTable_wrapper').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
});
$("#b_group").change(function() {
	var options = $(this).val(); 
	$.ajax({
		type : "get", // get or post
		url : "/bookList",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			listType : '',
			keyword : $('#keyword').val(),
			c_group : $('#c_group').val(),
			b_group : options
		},
		success : function(data, status) {
			$('#searchResultArea').empty().append(data);			
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
	 
});

$("#c_group").change(function() {
	var options = $(this).val(); 
	$.ajax({
		type : "get", // get or post
		url : "/bookList",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			listType : '',
			keyword : $('#keyword').val(),
			b_group : $('#b_group').val(),
			c_group : options
		},
		success : function(data, status) {
			$('#searchResultArea').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
	 
}); 

$('#getBookFromISBN').click(function() {
	getBookFromISBN();
})
 


function getBookFromISBN(){
	$.ajax({
		type : "GET", // GET or POST
		url : "/getBookFromISBN", // URL
		datatype : "json", // html, xml, json, jsonp, script, text
		data : {
			keyword : $('#isbn').val(),
			type : $('#type').val()
		},
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$(data).each(function(index,item){                
                $('#title').val(item.title);                
                $('#b_group').val(item.b_group);
                $('#c_group').val(item.c_group);
                $('#publish').val(item.publish);
                $('#author').val(item.author);
                $('#summary').val(item.summary);
                $('#price').val(item.price);
            });
		}
	});
}

$('#c_group').change(function() {
	var book_cd = $('#b_group').val().substr(0, 1)
				+ this.value.substr(0, 3) + '-';
		$('#book_cd').val(book_cd);
		$('#book_cd').focus();
		
		$.ajax({
			type : "GET", // GET or POST
			url : "/getMaxSer", // URL
			datatype : "json", // html, xml, json, jsonp, script, text
			data : {
				b_group : $('#b_group').val(),
				c_group : $('#c_group').val()
			},
			error : function() { // Ajax error handler
				alert('ajax failed');
			},
			success : function(data, status) { // Ajax complete handelr]
				$(data).each(function(index,item){
					$('#book_cd').val(item.book_cd); 
                });
			}
		}); 
});