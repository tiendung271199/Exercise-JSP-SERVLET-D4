<%@page import="beans.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
	<%
		Account obj = (Account) session.getAttribute("account");
		if (obj.getUserName().equals("admin") && obj.getPassWord().equals("123456")) {
	%>
	<h3 style="color: red">Chào! admin</h3>
	<%
		} else {
	%>
	<h3 style="color: red">Sai username hoặc password</h3>
	<%
		}
	%>
</body>
</html>