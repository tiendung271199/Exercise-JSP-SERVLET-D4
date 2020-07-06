<%@page import="beans.Hoa"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Danh sách hoa</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resetcss/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/baitap2/style2.css">
</head>
<body>
	<%
		ArrayList<Hoa> listHoa = (ArrayList<Hoa>) session.getAttribute("listhoa");
		if (listHoa.size() > 0) {
	%>
	<div class="wrapper">
		<div class="header">
			<h2>Danh sách hoa</h2>
		</div>
		<div class="tieude">
			<div class="left">
				<p class="th">Tên sản phẩm</p>
			</div>
			<div class="left">
				<p class="th">Giá</p>
			</div>
			<div class="left">
				<p class="th">Số lượng</p>
			</div>
			<div class="right">
				<p class="th">Tổng tiền</p>
			</div>
			<div class="clr"></div>
		</div>
		<%
			int thanhTien = 0;
			for(Hoa hoa : listHoa) {
				thanhTien += hoa.tongTien();
		%>
		<div class="thongtin">
			<div class="left">
				<p class="ten"><%=hoa.getTenHoa() %></p>
			</div>
			<div class="left2">
				<p><%=hoa.getGia() %></p>
			</div>
			<div class="left2">
				<p><input type="text" name="soluong" id="soluong" value="<%=hoa.getSoLuong() %>" /></p>
			</div>
			<div class="right">
				<p><%=hoa.tongTien() %></p>
			</div>
			<div class="clr"></div>
		</div>
		<%
			}
		%>
		<div class="tinhtien">
			<div class="left1">
				<p>Thành tiền:</p>
			</div>
			<div class="right">
				<p><%=thanhTien %></p>
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<%
		} else {
	%>
	<h3 style="color: red; font-style: italic">Chưa có danh sách mua hoa!</h3>
	<%
		}
	%>
</body>
</html>