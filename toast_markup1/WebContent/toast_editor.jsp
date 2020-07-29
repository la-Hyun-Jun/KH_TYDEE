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
<meta charset="UTF-8" />
<title>TOAST UI EDITOR</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>
#editor {
	width: 50%;
}
</style>
</head>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="tydee__write.css" type="text/css" />
<body>

   <!-- <form action="toast_editor_result.jsp" method="POST"> -->
        <div id="write__modal">
        <form action="toast.do?command=write" method="POST">
            <input type="hidden" name="member_no" value=""/>
            <div class="title">
            <span>title</span><input class = "title__inner" type="text" name="title" />
            <span>price</span><input class = "title__inner" type="text" name="price" />
            </div>
            <div id="editor" name="content"></div>
          <div class="input__button">
            <input type="submit" value="submit" onclick="contentHidden()" />
            <input type="button" value="list" onclick="location.href='toast.do?command=list'" />
            <input type="button" value="back" onclick="location.href='index.jsp'" />
          </div>
        </form>
    </div>

	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			height : '400px',
			initialEditType : 'markdown',
			previewStyle : 'tab',
			toolbarItems : [ 'heading', 'bold', 'italic', 'strike', 'divider',
					'hr', 'quote', 'ul', 'ol', 'divider', 'task', 'indent',
					'outdent' ]
		});
		editor.getMarkdown();

		function contentHidden() {
			let form = document.getElementsByTagName("form")[0];
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "content")
			input.setAttribute("value", editor.getMarkdown());
			document.querySelector("#editor").append(input);
		}
	</script>
</body>

</html>