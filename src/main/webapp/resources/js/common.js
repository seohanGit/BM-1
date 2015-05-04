$('#btn_search').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/searchBook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			keyword : $('#keyword').val()
		},
		success : function(data, status) { // Ajax complete handelr
			goUrl(url);
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		}
	});
});

function del() {
	alert("삭제되었습니다.");
}
function rentStop() {
	alert("대출정지 되었습니다.");
}
function borrow() {
	alert("대출 요청되었습니다.");
}
function cancel() {
	alert("취소되었습니다.");
}
function ok() {
	alert("승인되었습니다.");
}
function re_turn() {
	alert("반납되었습니다.");
}

/* 버튼 클릭 */

$("#logout").click(function() {
	location.href = "/logout"
})

$('#btn_find').click(function() {
	if ($('#query').val() == "") {
		alert("검색어를 입력하세요");
		return false;
	}
})

$("#requestList").click(function() {
	location.href = "/requestList"
})
$("#request").click(function() {
	location.href = "/request"
})

$("#insertBook").click(function() {
	location.href = "/insertbookForm"
})
$("#recordListAll").click(function() {
	location.href = "/recordListAll"
})
$("#rentListAll").click(function() {
	location.href = "/rentListAll"
})
$("#reservationListAll").click(function() {
	location.href = "/reservationListAll"
})
$("#borrowList").click(function() {
	location.href = "/borrowList"
})
$("#borrowList2").click(function() {
	location.href = "/borrowList"
})
$("#logout").click(function() {
	location.href = "/logout"
})
$("#noticeListByAdmin").click(function() {
	location.href = "/noticeListByAdmin"
})
$("#borrowList").click(function() {
	location.href = "/borrowList"
})
$("#bookList").click(function() {
	location.href = "/bookList"
})
$("#memberList").click(function() {
	location.href = "/memberList"
})
$("#boardList").click(function() {
	location.href = "/boardList"
})
$("#boardList").click(function() {
	location.href = "/boardList"
})
$("#allCheck").click(function() {
	if ($("#allCheck").prop("checked")) {
		$("input[type=checkbox]").prop("checked", true);
	} else {
		$("input[type=checkbox]").prop("checked", false);
	}

})

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
$('.board .btn').click(function() {
	$(this).parent().parent().find('.content').toggleClass('ellipsis');
});

$('#blackList').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/searchBlack", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#image3').fadeOut();
			$('#personResultArea').empty().append(data);
		}
	});

})

$('#late').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/searchLate", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#image3').fadeOut();
			$('#personResultArea').empty().append(data);
		}
	});

})

$('#register').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/selectboard", // URL
		datatype : "xml",
		data : {
			per : "register"
		},// html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});

})

$('#title').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/selectboard", // URL
		datatype : "xml",
		data : {
			per : "title"
		},// html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});

})
/*
 * $('#btn_find').click(function() { $.ajax({
 * 
 * type : "GET", // GET or POST url : "/findBook", // URL datatype : "xml", //
 * html, xml, json, jsonp, script, text data : { keyword : $('#query').val() }, //
 * parameters as plain object error : function() { // Ajax error handler
 * 
 * alert('검색어를 입력하세요'); }, success : function(data, status) { // Ajax complete
 * handelr $('#goodPhrase').fadeOut(); $('#image1').fadeOut();
 * $('#image2').fadeOut(); $('#searchResultArea').empty().append(data); } });
 * });
 */

// ///////////////////////////////리스트
/*
 * $('#borrowList').click(function() { $.ajax({ type : "GET", // GET or POST url :
 * "/borrowList", // URL datatype : "xml", // html, xml, json, jsonp, script,
 * text // parameters as plain object error : function() { // Ajax error handler
 * alert('ajax failed'); }, success : function(data, status) { // Ajax complete
 * handelr $('#goodPhrase').fadeOut(); $('#image1').fadeOut();
 * $('#image2').fadeOut(); $('#searchResultArea').empty().append(data); } });
 * });
 * 
 * $('#borrowListAll').click(function() { $.ajax({ type : "GET", // GET or POST
 * url : "/borrowListAll", // URL datatype : "xml", // html, xml, json, jsonp,
 * script, text // parameters as plain object error : function() { // Ajax error
 * handler alert('ajax failed'); }, success : function(data, status) { // Ajax
 * complete handelr $('#image1').fadeOut(); $('#image2').fadeOut();
 * $('#searchResultArea').empty().append(data); } }); });
 * 
 * $('#returnListAll').click(function() { $.ajax({ type : "GET", // GET or POST
 * url : "/returnListAll", // URL datatype : "xml", // html, xml, json, jsonp,
 * script, text // parameters as plain object error : function() { // Ajax error
 * handler alert('ajax failed'); }, success : function(data, status) { // Ajax
 * complete handelr $('#image1').fadeOut(); $('#image2').fadeOut();
 * $('#searchResultArea').empty().append(data); } }); });
 */
/*
 * $('#rentListAll').click(function() { $.ajax({ type : "GET", // GET or POST
 * url : "/rentListAll", // URL datatype : "xml", // html, xml, json, jsonp,
 * script, text // parameters as plain object error : function() { // Ajax error
 * handler alert('ajax failed'); }, success : function(data, status) { // Ajax
 * complete handelr $('#image1').fadeOut(); $('#image2').fadeOut();
 * $('#searchResultArea').empty().append(data); } }); });
 *//*
	 * $('#requestList').click(function() { $.ajax({ type : "GET", // GET or
	 * POST url : "/requestList", // URL datatype : "xml", // html, xml, json,
	 * jsonp, script, text error : function() { // Ajax error handler
	 * alert('ajax failed'); }, success : function(data, status) { // Ajax
	 * complete handelr] $('#image1').fadeOut(); $('#image2').fadeOut();
	 * $('#searchResultArea').empty().append(data); } }); })
	 */
/*
 * $('#btn_bookList').click(function() { $.ajax({ type : "GET", // GET or POST
 * url : "/bookList", // URL datatype : "xml", // html, xml, json, jsonp,
 * script, text error : function() { // Ajax error handler alert('ajax failed'); },
 * success : function(data, status) { // Ajax complete handelr
 * $('#goodPhrase').fadeOut(); $('#image1').fadeOut(); $('#image2').fadeOut();
 * $('#searchResultArea').empty().append(data); } }); });
 */

/*
 * $('#btn_next').click(function() { $.ajax({ type : "GET", // GET or POST url :
 * "/findBook", // URL datatype : "xml", // html, xml, json, jsonp, script, text
 * data : { keyword : $('#pagenum').val() }, // parameters as plain object error :
 * function() { // Ajax error handler alert('에러'); }, success : function(data,
 * status) { // Ajax complete handelr $('#searchResultArea').fadeOut();
 * $('#searchResultArea').empty().append(data); } }); });
 */

