<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Show Images</title>
</head>
<body>
	<h2>Danh sách Images</h2>
	<%
		String fileName = (String) session.getAttribute("filename");
	%>
	<img alt="" src="<%=request.getContextPath() %>/hinhanh/<%=fileName %>" />
	<p><%=fileName %></p>
</body>
</html>