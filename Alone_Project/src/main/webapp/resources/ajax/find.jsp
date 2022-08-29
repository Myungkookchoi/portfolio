<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal">
	<div class="modal-content animate" id="login">
		<div id="findIdDiv">
			<form name="frmLogin" onsubmit="return findId()">
				<div class="imgcontainer">
					<span onclick="closeFun();" class="close" title="Close Modal">&times;</span>
				</div>
				<div class="container">
					<h3>아이디 찾기</h3>
					<label for="uname"> <b>이름</b> <font id="checkMessage"
						style="float: right;"></font>
					</label> <input type="text" oninput="clearMessage(checkMessage);"
						id="findId_Name" placeholder="Enter Name" name="userName" required>
					<label for="ubirthday"> <b>생년월일</b>
					</label> <input type="date" oninput="clearMessage(checkMessage);"
						id="findId_Birth" placeholder="Enter Birthday" name="userBirth"
						required>
					<button type="submit">아이디 찾기</button>
				</div>
			</form>
		</div>

		<div id="findPswDiv">
			<form name="frmLogin" onsubmit="return findPassword()">
				<div class="container">
					<h3>비밀번호 찾기</h3>
					<label for="uid"> <b>아이디</b> <font id="checkMessage2"
						style="float: right;"></font>
					</label> <input oninput="clearMessage(checkMessage2);" id="findPassword_Id"
						type="text" placeholder="Enter ID" name="userId" required>
					<label for="uname"> <b>이름</b>
					</label> <input oninput="clearMessage(checkMessage2);"
						id="findPassword_Name" type="text" placeholder="Enter Name"
						name="userName" required><label for="psw"> <b>생년월일</b>
					</label> <input oninput="clearMessage(checkMessage2);"
						id="findPassword_Birth" type="date" placeholder="Enter Birthday"
						name="userBirth" required>
					<button type="submit">비빌번호 찾기</button>
				</div>
			</form>
		</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="button" onclick="closeFun();" class="cancelbtn">Cancel</button>
		</div>
	</div>
</div>