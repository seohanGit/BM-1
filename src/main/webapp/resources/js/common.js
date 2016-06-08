
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
function notifiReser() {
	alert("예약알림문자가 전송되었습니다.");
}


$("#request").click(function() {
	location.href = "/request"
}) 
$("#recordList").click(function() {
	location.href = "/recordList"
})
$("#statistic").click(function() {
	location.href = "/statistic"
})
$("#reserveList").click(function() {
	location.href = "/reserveList"
})
$("#borrowList").click(function() {
	location.href = "/borrowList"
})
$("#borrowReqList").click(function() {
	location.href = "/borrowReqList"
})
$("#noticeListByAdmin").click(function() {
	location.href = "/noticeListByAdmin"
})

$("#bookList").click(function() {
	location.href = "/bookList"
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
$('.board .btn').click(function() {
	$(this).parent().parent().find('.content').toggleClass('ellipsis');
});




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

