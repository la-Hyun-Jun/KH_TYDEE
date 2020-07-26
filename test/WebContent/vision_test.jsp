<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<style type="text/css">
	@-ms-viewport { width: device-width;}
	@-o-viewport { width: device-width;}
	@viewport { width: device-width;}
</style>
</head>
<body>
	<input type="file" accept="image/*" id="image"/>
	<img id="frame">
	<script>
	  var image = document.getElementById('image');
	  var frame = document.getElementById('frame');
	
	  image.addEventListener('change', function(e) {
		  console.log(e);
	    var file = e.target.files[0]; 
	    frame.src = URL.createObjectURL(file);
	  });
	</script>

</body>
</html>