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
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <!--tydee__login.css-->
    <link rel="stylesheet" href="tydee__login.css" />
</head>
<body>

	<!-- naver login -->
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

    <form action="login.do" method="post">
      <input type="hidden" name="command" value="login" />
      <div id="tydee__login">
        <div class="tydee__wrap">
          <h1>LOGIN</h1>
          <div class="email">
            <span>email</span>
            <input class="title__inner" type="text" name="myemail" />
          </div>
          <div class="pw">
            <span>pw</span>
            <input class="title__inner" type="text" name="mypw" />
          </div>
          <div>
            <a href="<%=apiURL%>"
              ><img id="naver_id_login" height="40" src="img/naver__login.png"
            /></a>
          </div>
          <div class="input">
            <input
              type="button"
              value="sign"
              onclick="location.href='signform.jsp'"
            />
            <input type="submit" value="login" onclick="" />
          </div>
        </div>
      </div>
    </form>
	
</body>
</html>