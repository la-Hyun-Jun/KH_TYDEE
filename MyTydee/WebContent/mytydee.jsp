<%@page import="java.util.ArrayList"%>
<%@page import="com.tydee.dto.MyTydeeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.tydee.dto.UserInfoDto"%>
<%
	response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-control", "no-store");
response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="https://kit.fontawesome.com/3914a9940d.js" crossorigin="anonymous"></script>
<!-- <script src="https://use.fontawesome.com/releases/v5.14.0/js/all.js" data-auto-replace-svg="nest"></script> -->
<link rel="stylesheet" type="text/css" href="css/mytydee.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
	if (loginuser == null) {
		pageContext.forward("index.jsp");
	}
	String mytydeejson = (String) request.getAttribute("mytydeejson");
	List<MyTydeeDto> options = new ArrayList<MyTydeeDto>();
	options = (List<MyTydeeDto>) request.getAttribute("options");
%>

<body>
	<section class="tydee__mytydee">
		<section class="tydee__mytydee__title">
			<h1><%=loginuser.getUser_nickname()%>님의 mytydee
			</h1>
		</section>
		<section class="modals">
			<article class="modal modal__left">
				<div id="mytydee" class="modal_wrap"></div>
			</article>
			<article class="modal modal__right">
				<input class="tiny__search" type="text" name="search" />
				<form action="mytydee.do" method="post" id="tiny-form">
					<div class="modal__wrap">
						<div class="tiny__buttons-left">
							<span id="editarea"><i class="fas fa-edit"></i></span>
							<span id="deletearea"><i class="far fa-trash-alt"></i></span>
						</div>
						<div class="tiny__buttons-right">
							<span id="addarea"><i class="fas fa-plus"></i></span>
						</div>
						<div class="tiny__img"></div>
						<div class="tiny__menu">
							<p><label for="type">type</label></p>
							<p><label for="name">name</label></p>
							<p><label for="location">location</label></p>
							<p><label for="description">description</label></p>
							<p><label for="regdate">date</label></p>
						</div>
						<div class="tiny__contents">
							<input type="hidden" name="tiny_no" />
							<input class="tiny__content" type="text" name="type" readonly="readonly" />
							<input class="tiny__content" type="text" name="name" readonly="readonly" />
							<input class="tiny__content" type="text" name="location" readonly="readonly" />
							<textarea class="tiny__content" name="content" readonly="readonly"></textarea>
							<input class="tiny__content" type="text" name="regdate" readonly="readonly" />
						</div>
					</div>
				</form>
			</article>
		</section>
	</section>
	<script>
        let mytydeejson = ${mytydeejson};
        let options = ${options};
        console.log(options);
    </script>
	<script type="text/javascript" src="js/d3maker.js"></script>
</body>

</html>