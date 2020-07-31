<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<!-- 카카오 sdk -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>


<style>
table {
	border: none;
}
</style>

<body>
	<h1>로그인</h1>

	<form action="login.do" method="post">
		<input type="hidden" name="command" value="login" />
		<table border="1">
			<col width="100" />
			<col width="100" />
			<tr>
				<th>ID💻</th>
				<td><input type="text" name="myemail" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="mypw" /></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="submit"
					value="login" /> <input type="button" value="sign"
					onclick="location.href='signform.jsp'" /></td>
			</tr>
		</table>
	</form>

	<%
	String clientId = "GUk01Uphrk1SGaYQZnul";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8787/login/callback.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>
	<div>
		<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	</div>
	
</body>
</html>