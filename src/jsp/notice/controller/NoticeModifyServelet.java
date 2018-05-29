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

@WebServlet(name = "NoticeModify", urlPatterns = { "/noticeModifyBefore" })
public class NoticeModifyServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeModifyServelet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

			NoticeVo nv = new NoticeService().noticeSelect(noticeNo);

			if (nv != null) {
				RequestDispatcher view = request.getRequestDispatcher("/Views/notice/noticeModify.jsp");
				request.setAttribute("noticeUpdate", nv);
				view.forward(request, response);
			} else {
				response.sendRedirect("/Views/error/noticeListNotFound.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("/Views/error/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
