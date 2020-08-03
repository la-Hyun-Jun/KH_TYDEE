<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원정보 전체 조회</h1>
	<table border=1>
		<tr>
			<th>회원번호</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>등급</th>
		</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="4">---회원 정보 없음---</td>
			</tr>
		</c:when>
	<c:otherwise>
		<c:forEach items="${selectList }" var="dto">
				<tr>
					<td>${dto.user_no }</td>
					<td>${dto.user_nickname }</td>
					<td>${dto.user_id }</td>
					<td>${dto.user_role }</td>
				</tr>
			</c:forEach>
	     </c:otherwise>
	    	
	</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="메인" onclick="location.herf='index.jsp'">
			</td>
		</tr>
	</table>

</body>
</html>







