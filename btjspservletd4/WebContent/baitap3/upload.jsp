<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Upload File</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resetcss/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/baitap3/style.css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<p>Upload ảnh</p>
		</div>
		<div class="main">
			<form action="<%=request.getContextPath() %>/up-load-image" method="post" id="form" enctype="multipart/form-data">
				<%
					if (request.getParameter("err") != null) {
						out.print("<p style='color: red; font-weight: bold'>Vui lòng chọn file hình ảnh</p>");
					}
				%>
				<p>
					<label>Hình ảnh: </label>
					<input type="file" name="images" id="images"/>
				</p>
				<p id="button">
					<input type="submit" name="submit" id="submit" value="Up hình">
				</p>																	
			</form>							
		</div>
	</div>
</body>
</html>