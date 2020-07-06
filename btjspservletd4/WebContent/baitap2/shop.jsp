<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop mua hoa</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resetcss/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/baitap2/style.css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<p>Mua hoa</p>
		</div>
		<div class="main">
			<form action="<%=request.getContextPath() %>/mua-hoa" method="post" id="form">
				<%
					String id = (String) request.getAttribute("id");
					String name = (String) request.getAttribute("name");
					String soLuong = (String) request.getAttribute("soluong");
					String gia = (String) request.getAttribute("gia");
					if (request.getParameter("err") != null) {
						int err = Integer.parseInt(request.getParameter("err"));
						if (err == 1) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập ID</p>");
						} else if (err == 2) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập ID là số nguyên > 0</p>");
						} else if (err == 3) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập tên hoa</p>");
						} else if (err == 4) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập số lượng</p>");
						} else if (err == 5) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập số lượng là số nguyên > 0</p>");
						} else if (err == 6) {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập giá bán</p>");
						} else if (err == 8) {
							out.print("<p style='color: red; font-style: italic'>ID bạn nhập đã trùng, vui lòng nhập lại ID</p>");
						} else {
							out.print("<p style='color: red; font-style: italic'>Vui lòng nhập giá bán là số nguyên > 0</p>");
						}
					}
				%>
				<p>
					<label>ID hoa: </label>							
					<input type="text" name="id" id="id" value="<% if (id != null) out.print(id); %>" />
				</p>
				<p>
					<label>Tên hoa: </label>							
					<input type="text" name="name" id="name" value="<% if (name != null) out.print(name); %>" />
				</p>
				<p>
					<label>Số lượng: </label>							
					<input type="text" name="soluong" id="soluong" value="<% if (soLuong != null) out.print(soLuong); %>" />
				</p>
				<p>
					<label>Giá: </label>							
					<input type="text" name="gia" id="gia" value="<% if (gia != null) out.print(gia); %>" />
				</p>	
				<p id="button">
					<input type="submit" name="submit" id="submit" value="Mua hoa">
				</p>																	
			</form>							
		</div>
	</div>
</body>
</html>