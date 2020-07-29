<%@page import="com.toast.dto.ToastDto"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="boarddetail.css" />
</head>
<body>
 <div class="tydee__tips__title">
      <h1>TYDEE TIPs</h1>
      <div class="tydee__hashtag">
        <span>#tydee</span>
        <span>#tydee</span>
        <span>#tydee</span>
        <span>#tydee</span>
      </div>
    </div>
    
    
        <section id="tydee__tips__detail">
      <div class="contents__header">
        <div class="title">
          <p>${dto.title }</p>
        </div>
        <div class="date">
          <div class="writer">
            <p class="writer1">${dto.seq }</p>
            <p class="date1">date</p>
          </div>
          <div class="etc">
            <p>sns</p>
            <input
              type="button"
              class="bookmark"
              value="bookmark"
              name="bookmark"
            />
          </div>
        </div>
        <div class="line"></div>
      </div>
      <div class="contents">
        <div class="contents__detail">
          <img src="img/3.jpg" alt="" />
          <p id="viewer">

          </p>
        </div>
        <div class="button">
          <input type="button" value="detail" onclick="" />
          <input
            type="button"
            value="list"
            onclick="location.href='toast.do?command=list'"
          />
          <input
            type="button"
            value="back"
            onclick="location.href='toast.do?command=list'"
          />
        </div>
        <div class="comments">
          <div class="comments__box"></div>
        </div>
      </div>
    </section>
	
	<div class="list">
      <a href="#">
        <div class="modal__wrap">
          <img src="img/6.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="modal__wrap">
          <img src="img/7.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="modal__wrap">
          <img src="img/8.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
    </div>
	
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			viewer : true,
			height : '500px',
			initialValue : `${dto.content}`
		});
		viewer.getMarkdown();
	</script>
</body>
</html>