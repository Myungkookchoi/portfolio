<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../include/Header.jsp"%>

<%-- <%@include file="../include/Navigation.jsp"%> --%>
<script type="text/javascript" src="/mk/resources/js/Board.js"></script>
<link rel="stylesheet" href="/mk/resources/css/Board.css">

<div id="content_div" class="container-fluid mt-3">
	<div class="modal-content animate">
		<div class="container">
			<form name="frmLogin" action="/mk/Notice/write" method="post">

				<label for="title"> <b>제목</b>
				</label> <br> <input type="text" placeholder="제목을 입력해주세요." name="title" required> <br> <label for="content"> <b>글 내용</b>
				</label>
				<textarea oninput="autoHeight();" style="overflow: hidden; resize: none;" placeholder="글 내용을 입력해주세요." name="content" required></textarea>
				<div class="text-lg-end">
					<button class="btn btn-primary" type="submit">등록</button>
				</div>
				<br>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/Footer.jsp"%>