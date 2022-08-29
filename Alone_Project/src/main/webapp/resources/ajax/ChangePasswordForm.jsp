<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="frmLogin" onsubmit="return changePassword()">
	<div class="container">
		<h3>비밀번호 변경하기</h3>
		<label for="psw"> <b>변경 할 비밀번호</b><font id="checkMessage3"
			style="float: right;"></font>
		</label> <input id="password1" type="password" placeholder="Enter Password"
			name="userPassword" required> <label for="psw"> <b>비밀번호
				확인</b>
		</label> <input oninput="passwordCheck();" id="password2" type="password"
			placeholder="Enter Password" required>
		<button id="changePswBtn" type="submit" disabled="disabled">비빌번호
			변경</button>
	</div>
</form>