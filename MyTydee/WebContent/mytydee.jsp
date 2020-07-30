<%@page import="com.tydee.dto.UserInfoDto"%>
<%
	response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://d3js.org/d3.v5.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mytydee.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
	if (loginuser == null){
		pageContext.forward("index.jsp");
	}
	String mytydeejson = (String) request.getAttribute("mytydeejson");
%>
<body>
	<h3><%= loginuser.getUser_nickname() %>님의 mytydee</h3>
	<section>
		<div id="mytydee"></div>
		<div></div>
	</section>
	<script>
		let mytydeejson = ${mytydeejson};
	</script>
	<script type="text/javascript" src="js/d3maker.js"></script>
</body>
</html>