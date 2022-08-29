<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@include file="../include/Header.jsp"%>
<style>
* {
	box-sizing: border-box
}

body {
	font-family: "Lato", sans-serif;
}

/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 20%;
	height: 600px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 80%;
	border-left: none;
	height: 600px;
}

/* table */
table {
	border-collapse: collapse;
	border: 1px solid #ddd;
	margin-left: 37%;
	margin-top: 10%;
}

th, td {
	text-align: left;
	padding: 16px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<div class="tab">
	<button class="tablinks" onclick="profile(); openCity(event, 'profile')" id="defaultOpen">유저 정보</button>
	<button class="tablinks" onclick="EditRead(); openCity(event, 'edit')">유저 정보 수정</button>
	<button class="tablinks" onclick="openCity(event, 'list')">유저 글 목록</button>
</div>

<div id="profile" class="tabcontent"></div>

<div id="edit" class="tabcontent"></div>

<div id="list" class="tabcontent">
	<h3>Tokyo</h3>
	<p>Tokyo is the capital of Japan.</p>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

	function profile() {
		var userId = "${userId}";
		var id, name, birth, authority;
		$.ajax({
			type : "GET",
			url : "/mk/restful/profile/" + userId,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			success : function(result) {
				id = result.detail.userId;
				name = result.detail.userName;
				birth = result.detail.userBirth;
				authority = result.detail.authority;
				birth = moment(birth).format("YYYY년 MM월 DD일");
				if (authority == "ROLE_ADMIN") {
					authority = "관리자";
				} else if (authority == "ROLE_MEMBER") {
					authority = "멤버";
				} else {
					authority = "일반유저";
				}
				$.ajax({
					url : "/mk/resources/ajax/Profile.jsp",
					success : function(data) {
						$("#profile").html(data);
						$("#userId").text(id);
						$("#userName").text(name);
						$("#userBirth").text(birth);
						$("#userauthority").text(authority);
						$("#edit").html(null);
					}
				})
			},
			error : function(result) {
				alert("error");
			}
		})
	}

	function EditRead() {
		var userId = "${userId}";
		var id, name, birth;
		$.ajax({
			type : "GET",
			url : "/mk/restful/profile/" + userId,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			success : function(result) {
				id = result.detail.userId;
				name = result.detail.userName;
				birth = result.detail.userBirth;
				birth = moment(birth).format("YYYY-MM-DD");
				$.ajax({
					url : "/mk/resources/ajax/Edit.html",
					success : function(data) {
						$("#edit").html(data);
						$("#editUserId").val(id);
						$("#editUserName").val(name);
						$("#editUserBirth").val(birth);
						$("#editUserPassword").text(null);
						$("#profile").html(null);
					}
				})
			},
			error : function(result) {
				alert("error");
			}
		})
	}

	function Edit() {
		var userId = "${userId}";
		var userName = $('#editUserName').val();
		var userPassword = $('#editUserPassword').val();
		var userPassword2 = $('#editUserPasswordCheck').val();
		var userBirth = $('#editUserBirth').val();
		if (userPassword != "") {
			if (userPassword2 != "") {
				$.ajax({
					type : "put",
					url : "/mk/restful/" + userId,
					data : JSON.stringify({
						userId : userId,
						userName : userName,
						userPassword : userPassword,
						userBirth : userBirth
					}),
					contentType : 'application/json; charset=UTF-8',
					dataType : 'text',
					success : function(result) {
						if (result == "SUCCESS") {
							profile();
							openCity(event, 'profile');
						} else {

						}
					},
					error : function(result) {
						alert("에러");
						console.log(result);
					}
				})
				return false;
			} else {
				$('#editUserPasswordCheck').focus();
				return false;
			}
		} else {
			$('#editUserPassword').focus();
			$('#checkMessage').text("비밀번호를 입력하지 않았습니다.");
			$('#checkMessage').attr('color', 'red');
			return false;
		}

	}
</script>
<%@include file="../include/Footer.jsp"%>