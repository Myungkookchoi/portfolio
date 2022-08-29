<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="register" class="modal">
	<form class="modal-content animate" name="frmLogin"
		onsubmit="return register()">
		<div class="imgcontainer">
			<span onclick="closeFun();" class="close" title="Close Modal">&times;</span>
		</div>
		<div class="container">
			<label for="uid"><b>아이디</b>&ensp;<font id="resultID" size="2"></font>
			</label> <input oninput="registerId_check();" id="userId" type="text"
				placeholder="Enter ID" name="userId" required> <label
				for="upw"> <b>비밀번호</b>
			</label> <input id="userPassword" type="password"
				placeholder="Enter Password" name="userPassword" required> <label
				for="uname"> <b>이름</b>
			</label> <input id="userName" type="text" placeholder="Enter Name"
				name="userName" required> <label for="ubirth"> <b>생년월일</b>
			</label> <input id="userBirth" type="date" name="userBirth" required>
			<button id="registerbtn" type="submit" disabled="disabled">등록</button>
			<br>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" onclick="closeFun();" class="cancelbtn">Cancel</button>
		</div>
	</form>
</div>