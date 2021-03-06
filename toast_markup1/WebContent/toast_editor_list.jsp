<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>RESULT</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="tydee__secondhandlist.css" />
</head>

<body>
    <div class="tydee__secondhand">
      <div class="tydee__secondhand__title">
        <h1>TYDEE SECOND HAND</h1>
        <div class="tydee__hashtag">
          <span>#tydee</span>
          <span>#tydee</span>
          <span>#tydee</span>
          <span>#tydee</span>
        </div>
        <a href="toast_editor.jsp"><p class="wrtie__secondhand"/>+</p></a>
      </div>
      
	<section class="modals">
		<c:forEach items="${list }" var="dto">
     <a href="toast.do?command=detail&seq=${dto.seq }">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/1.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name" onclick="location.href='toast.do?command=detail&seq=${dto.seq }'">
                  ${dto.title }
                </p>
                <p class="modal__explain">
                  ${dto.seq }
                </p>
              </div>
            </div>
          </div>
        </a>
		</c:forEach>
	<input type="button" value="뒤로가기"
		onclick="location.href='toast_editor.jsp'" />
	</section>

</body>

</html>