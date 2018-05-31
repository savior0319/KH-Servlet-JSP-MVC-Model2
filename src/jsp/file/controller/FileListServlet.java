package jsp.file.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.file.model.service.FileService;
import jsp.file.model.vo.FileVo;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "FileList", urlPatterns = { "/fileList" })
public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");
		ArrayList<FileVo> aList = new ArrayList<FileVo>();
		aList = new FileService().fileList();

		if (mv != null) {
			RequestDispatcher view = request.getRequestDispatcher("/Views/upload/fileList.jsp");
			request.setAttribute("fileList", aList);
			view.forward(request, response);
		} else {
			response.sendRedirect("Views/error/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
