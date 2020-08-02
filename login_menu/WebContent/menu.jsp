<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Board List🧟‍♀️</h1>
	
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="300"/>
		<col width="100"/>
		<tr>
			<th>no</th>
			<th>writer</th>
			<th>title</th>
			<th>content</th>
		</tr>
		<c:choose>
			<c:when test ="${empty list }">
				<tr>	
					<td>------ no content ------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items = "${list }" var="dto">
					<tr>
						<td>${dto.seq }</td>
						<td>${dto.writer }</td>
						<td><a href="controller.do?command=detail&seq=${dto.seq }">${dto.title }</a></td>
						<td>${dto.regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="write🧟" onclick="location.href='controller.do?command=insertform'"/>
			</td>
		</tr>
	</table>

</body>
</html>