function addReply() {

}

function autoHeight() {
	var textEle = $('textarea');
	textEle[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
}

function autoHeight2() {
	var textEle = $('#textarea2');
	textEle[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
}

function rpDelete(bno, rno, replyer) {
	var bno = bno;
	var rno = rno;
	var replyer = replyer;
	var data = {
		'rno' : rno,
		'replyer' : replyer,
		'bno' : bno
	};
	var json = JSON.stringify(data);
	$.ajax({
		type : "delete",
		url : "/mk/restful/rpdelete",
		data : json,
		contentType : 'application/json; charset=UTF-8',
		dataType : 'text',
		success : function(result) {
			console.log(rno);
			if (result == "success") {
				$("div").remove("#" + rno);
			} else {
				alert("본인이 아닙니다.");
			}
		},
		error : function(result) {

		}
	})
}

function page(pageNum) {
	var page = pageNum;
	console.log(page);
	var data = {
		'page' : page
	}
	var json = JSON.stringify(data);
	$.ajax({
		type : "get",
		url : "/mk/restful/page/" + page,
		data : json,
		contentType : 'application/json; charset=UTF-8',
		dataType : 'text',
		success : function(result) {
			console.log(result);
		},
		error : function(result) {
			console.log(result);
		}
	})
}

window.onload = function() {
	var textEle = $('#textarea');
	textEle[0].style.height = "auto";
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
}