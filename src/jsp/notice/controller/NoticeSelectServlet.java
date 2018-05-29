package jsp.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.notice.model.service.NoticeService;
import jsp.notice.model.vo.NoticeVo;

@WebServlet(name = "NoticeSelect", urlPatterns = { "/noticeSelect" })
public class NoticeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeSelectServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

		NoticeVo nv = new NoticeService().noticeSelect(noticeNo);

		if (nv != null) {
			RequestDispatcher view = request.getRequestDispatcher("/Views/notice/noticeSelect.jsp");
			request.setAttribute("nv", nv);
			view.forward(request, response);
		} else {
			response.sendRedirect("/Views/error/noticeListNotFound.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
