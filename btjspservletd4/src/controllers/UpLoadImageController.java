package controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class UpLoadImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DIR_UPLOAD = "hinhanh";
	private ArrayList<String> listFileName = new ArrayList<String>();

	public UpLoadImageController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/baitap3/upload.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String fileName = "", dirUpLoad = "", fileReName = "";

		try {
			Part filePart = request.getPart("images");
			fileName = filePart.getSubmittedFileName();
			if (!fileName.endsWith(".jpg") && !fileName.endsWith(".jpeg") && !fileName.endsWith(".png")
					&& !fileName.endsWith(".gif")) {
				throw new Exception();
			}
			String contextRoot = request.getServletContext().getRealPath("");
			dirUpLoad = contextRoot + DIR_UPLOAD;
			File saveDir = new File(dirUpLoad);
			if (!saveDir.exists()) {
				saveDir.mkdir();
			}
			String filePath = dirUpLoad + File.separator + fileName;
			filePart.write(filePath);
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/baitap3/upload.jsp?err=1");
			rd.forward(request, response);
			return;
		}

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyhhmmss");
		String fname = sdf.format(date);
		fileReName = "images_" + fname + ".jpg";
		File oldFile = new File(dirUpLoad + "\\" + fileName);
		File newFile = new File(dirUpLoad + "\\" + fileReName);
		if (oldFile.renameTo(newFile)) {
			fileName = fileReName;
		}
		
		listFileName.add(fileName);

		HttpSession session = request.getSession();
		session.setAttribute("listfilename", listFileName);

		response.sendRedirect(request.getContextPath() + "/baitap3/showimage.jsp");
	}

}
