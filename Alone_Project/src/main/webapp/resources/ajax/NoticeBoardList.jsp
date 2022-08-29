<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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