<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop hoa</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resetcss/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/baitap2/style3.css">
</head>
<body>
	<div class="wrapper">
		<div class="title">
			<h2>Shop hoa</h2>
		</div>
		<div class="main">
			<%
				if (request.getParameter("msg") != null) {
					int msg = Integer.parseInt(request.getParameter("msg"));
					if (msg == 1) {
						out.print("<p style='color: blue; font-style: italic'>Mua hoa thành công!</p>");
					}
				}
			%>
			<ul>
				<li>
					<a href="<%=request.getContextPath() %>/mua-hoa?load=1" title="">Hiển thị danh sách hoa</a>
				</li>
				<li>
					<a href="<%=request.getContextPath() %>/mua-hoa?load=2" title="">Mua hoa</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>