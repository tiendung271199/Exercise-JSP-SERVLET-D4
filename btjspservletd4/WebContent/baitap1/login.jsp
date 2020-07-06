<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resetcss/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/baitap1/style.css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<p>Login</p>
		</div>
		<div class="main">
			<form action="<%=request.getContextPath() %>/login" method="post" id="form">
				<%
					if (request.getParameter("err") != null) {
						int err = Integer.parseInt(request.getParameter("err"));
						if (err == 1) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập username</p>");
						} else {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập password</p>");
						}
					}
				%>
				<p>
					<label>Tên đăng nhập: </label>							
					<input type="text" name="name" id="name" />
				</p>
				<p>
					<label>Mật khẩu: </label>							
					<input type="password" name="password" id="password"/>
				</p>			
				<p id="button">
					<input type="submit" name="submit" id="submit" value="Đăng nhập">
				</p>																	
			</form>							
		</div>
	</div>
</body>
</html>