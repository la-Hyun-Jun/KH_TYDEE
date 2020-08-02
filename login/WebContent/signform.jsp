<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.login.dto.loginDto"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<!--tydee__sign.css-->
<link rel="stylesheet" href="tydee__sign.css" />
</head>

<body>

	<form action="login.do?command=signres" method="post">

		<div id="tydee__login">
			<div class="tydee__wrap">
				<h1>SIGN</h1>
				<div class="email">
					<span>email</span> <input class="title__inner" type="text"
						name="myemail" required="required" />
				</div>
				<div class="pw">
					<span>pw</span> <input class="title__inner" type="text" name="mypw"
						required="required" />
				</div>
				<div class="name">
					<span>name</span> <input class="title__inner" type="text"
						name="myname" required="required" />
				</div>
				<div class="input">
					<input type="submit" value="sign" onclick="" /> <input
						type="button" value="back" onclick="location.href='login.jsp'" />
				</div>
			</div>
		</div>
	</form>

</body>
</html>