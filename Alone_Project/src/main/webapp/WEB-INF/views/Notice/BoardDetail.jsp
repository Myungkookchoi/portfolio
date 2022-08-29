<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="../include/Header.jsp"%>

<%-- <%@include file="../include/Navigation.jsp"%> --%>
<script type="text/javascript" src="/mk/resources/js/Board.js"></script>

<div id="content_div" class="container-fluid mt-3">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3>${dto.title }</h3>
			</div>
			<div class="col-sm-6 text-lg-end">글번호 : ${dto.bno }</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<b>작성자 : ${dto.writer }</b>
			</div>
			<div class="col-sm-6 text-lg-end">
				<fmt:formatDate value="${dto.regdate }" pattern="yyyy.MM.dd" />
				조회 ${dto.viewcnt }
			</div>
			<hr />
		</div>
		<div class="row">
			<textarea id="textarea" style="overflow: hidden; resize: none;" disabled="disabled">${dto.content }</textarea>
		</div>
		<hr />
		<b>댓글</b> <br> <br>
		<div class="row" id="replies">
			<c:forEach items="${reply}" var="list">
				<div class="row" id="${list.rno}">
					<div class="col-sm-9">
						<b>${list.replyer }</b>
						<p>${list.replytext }</p>
					</div>
					<div class="col-sm-1">
						<em><fmt:formatDate value="${list.regdate }" pattern="yy.MM.dd" /></em>
					</div>
					<div class="col-sm-2 text-lg-end">
						<button class="btn btn-light" onclick="rpDelete('${dto.bno}','${list.rno}', '${list.replyer }');">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row" id="totaltextarea">
			<div class='col-sm-11'>
				<strong><%=name%></strong><br>
				<textarea id="textarea2" oninput="autoHeight2();" name="replyConent" style="overflow: hidden; width: 100%; resize: none;"></textarea>
			</div>
			<div class="col-sm-1">
				<br>
				<button class="btn btn-ligth" onclick="addReply();">등록</button>
			</div>
		</div>
		<hr />
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<button class="btn btn-success">글 수정</button>
			<button class="btn btn-danger">글 삭제</button>
		</div>
		<sec:authorize access="isAuthenticated()">
			<div class="col-sm-6 text-lg-end">
				<button class="btn btn-secondary" onclick="location.href='/mk/Notice/write'">새 글 쓰기</button>
				<button class="btn btn-light" onclick="location.href='/mk/Notice/NoticeBoard'">글 목록</button>
			</div>
		</sec:authorize>
	</div>
</div>

<%@include file="../include/Footer.jsp"%>