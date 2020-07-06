package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Hoa;

public class MuaHoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Hoa> listHoa = new ArrayList<Hoa>();

	public MuaHoaController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		if (request.getParameter("load") != null) {
			int load = Integer.parseInt(request.getParameter("load"));
			if (load == 1) {
				response.sendRedirect(request.getContextPath() + "/baitap2/basket.jsp");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/baitap2/shop.jsp");
				return;
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String tenHoa = request.getParameter("name");
		String soL = request.getParameter("soluong");
		String giaBan = request.getParameter("gia");

		request.setAttribute("id", id);
		request.setAttribute("name", tenHoa);
		request.setAttribute("soluong", soL);
		request.setAttribute("gia", giaBan);

		if (id.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=1");
			rd.forward(request, response);
			return;
		}

		int idHoa = 0, soLuong = 0, gia = 0;
		try {
			idHoa = Integer.parseInt(id);
			if (idHoa <= 0) {
				throw new Exception();
			}
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=2");
			rd.forward(request, response);
			return;
		}

		if (tenHoa.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=3");
			rd.forward(request, response);
			return;
		}

		if (soL.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=4");
			rd.forward(request, response);
			return;
		}

		try {
			soLuong = Integer.parseInt(soL);
			if (soLuong <= 0) {
				throw new Exception();
			}
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=5");
			rd.forward(request, response);
			return;
		}

		if (giaBan.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=6");
			rd.forward(request, response);
			return;
		}

		try {
			gia = Integer.parseInt(giaBan);
			if (gia <= 0) {
				throw new Exception();
			}
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=7");
			rd.forward(request, response);
			return;
		}

		Hoa objHoa = new Hoa(idHoa, tenHoa, soLuong, gia);
		boolean check = true;
		if (listHoa.size() > 0) {
			for (Hoa hoa : listHoa) {
				if (hoa.getIdHoa() == idHoa && hoa.getTenHoa().equals(tenHoa) && hoa.getGia() == gia) {
					hoa.setSoLuong(soLuong + hoa.getSoLuong());
					check = true;
					break;
				} else if (hoa.getIdHoa() == idHoa && (!hoa.getTenHoa().equals(tenHoa) || hoa.getGia() != gia)) {
					RequestDispatcher rd = request.getRequestDispatcher("/baitap2/shop.jsp?err=8");
					rd.forward(request, response);
					return;
				} else {
					check = false;
				}
			}
		}

		if (!check || listHoa.size() == 0) {
			listHoa.add(objHoa);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("listhoa", listHoa);

		response.sendRedirect(request.getContextPath() + "/baitap2/choose.jsp?msg=1");
	}

}
