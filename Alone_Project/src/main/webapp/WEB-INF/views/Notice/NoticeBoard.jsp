<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/Header.jsp"%>

<%@include file="../include/Navigation.jsp"%>

<!-- <div id="content_div" class="container-fluid mt-3"></div> -->
<script type="text/javascript" src="/mk/resources/js/Board.js"></script>

<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="width: 16%">글번호</th>
				<th style="width: 50%">제목</th>
				<th style="width: 18%">작성자</th>
				<th style="width: 16%">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno }</td>
					<td><a href="/mk/Notice/NoticeBoard/${list.bno }">${list.title}</a></td>
					<td>${list.writer }</td>
					<td><fmt:formatDate value="${list.regdate }" pattern="yyyy/MM/dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr />

	<div class="text-lg-end">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<button class="btn btn-light">글 쓰기</button>
		</sec:authorize>
	</div>

	<div class="text-center">
		<ul class="pagination justify-content-center">
			<%-- 			<c:if test="${pageMaker.page !=1}"> --%>
			<%-- 				<li class="page-item"><a class="page-link" onclick="pagesearch(${pageMaker.makeSearch(1)})">prev</a></li> --%>
			<%-- 			</c:if> --%>
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link" href='list${pageMaker.makeSearch(pageMaker.startPage-1)}'>Prev</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
				<li class="page-item"><a class="page-link" onclick="page('${idx}');"/>${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link" href='list${pageMaker.makeSearch(pageMaker.endPage+1)}'>Next</a></li>
			</c:if>
		</ul>
	</div>

	<div class="text-lg-end">
		<button class="btn btn-secondary" onclick="location.href='/mk/Notice/write'">새 글 쓰기</button>
	</div>

	<div class="text-center">
		<select name="searchType">
			<option value="n" <c:out value="${pageMaker.searchType==null?'selected':'' }"/>>----</option>
			<option value="t" <c:out value="${pageMaker.searchType eq 't'?'selected':'' }"/>>제목</option>
			<option value="c" <c:out value="${pageMaker.searchType eq 'c'?'selected':'' }"/>>내용</option>
			<option value="w" <c:out value="${pageMaker.searchType eq 'w'?'selected':'' }"/>>작성자</option>
			<option value="tc" <c:out value="${pageMaker.searchType eq 'tc'?'selected':'' }"/>>제목 or 내용</option>
			<option value="cw" <c:out value="${pageMaker.searchType eq 'cw'?'selected':'' }"/>>내용 or 작성자</option>
			<option value="tcw" <c:out value="${pageMaker.searchType eq 'tcw'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
		</select> <input oninput="search();" type="text" name="keyword" id="keywordInput" value="${pageMaker.keyword}">
		<button class="btn btn-light" id="searchBtn">검색하기</button>
	</div>

</div>

${pageMaker.makeSearch(idx)} ${pageMaker.page==idx?' class=active ':'' }

<%@include file="../include/Footer.jsp"%>