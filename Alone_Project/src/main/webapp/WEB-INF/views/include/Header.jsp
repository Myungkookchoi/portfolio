<%@page import="java.security.Principal"%>
<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="alone.study.dto.UserDto"%>
<%
	Authentication auth = (Authentication) request.getUserPrincipal();
	String name = "";
	if (auth != null) {
		name = auth.getName();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="/mk/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/mk/">Main Logo</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="/mk/Notice/NoticeBoard">공지사항</a></li>

					<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')">
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)">등급 신청하기</a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)">유저 게시판</a></li>
					</sec:authorize>

					<sec:authorize access="hasAnyRole('ROLE_MEMBER, ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)">멤버 게시판</a></li>
					</sec:authorize>

					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link" href="/mk/admin/admin">관리자 페이지</a></li>
					</sec:authorize>

				</ul>
				<sec:authorize access="isAnonymous()">
					<button class="btn btn-primary" type="button" onclick="location.href='/mk/login'">Login</button>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" style="display: inline;" href="/mk/user/userProfile"><%=name%></a>
					<h6 style="color: white; margin-top: 8px; display: inline;">님 반갑습니다.</h6>
					&ensp;
					<button class="btn btn-primary" type="button" onclick="location.href='/mk/logout'">Logout</button>
				</sec:authorize>
			</div>
		</div>
	</nav>