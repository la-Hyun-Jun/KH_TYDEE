<%@page import="com.toast.dto.ToastDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>RESULT</title>
</head>

<body>
	<c:forEach items="${list }" var="dto">
		<table border='1'>
			<tr>
				<th>번호</th>
				<td>${dto.seq }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td onclick="loadDetail(${dto.seq })">${dto.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${dto.regdate }</td>
			</tr>
		</table>
		<hr />
	</c:forEach>
	<input type="button" value="뒤로가기" onclick="location.href='toast_editor.jsp'" />

</body>

</html>