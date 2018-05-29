package jsp.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.member.model.vo.MemberVo;
import jsp.notice.model.service.NoticeService;

@WebServlet(name = "NoticeModifyAfter", urlPatterns = { "/noticeModifyAfter" })
public class NoticeModifyAfterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeModifyAfterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");

		String admin = mv.getUserId();

		if (admin.equals("admin")) {
			request.setCharacterEncoding("utf-8");

			String content = request.getParameter("content");
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			String subject = request.getParameter("subject");

			int result = new NoticeService().noticeModify(noticeNo, subject, content);

			if (result > 0) {
				RequestDispatcher view = request.getRequestDispatcher("/Views/notice/noticeModifyComplete.jsp");
				request.setAttribute("noticeNo", noticeNo);
				view.forward(request, response);
			} else {
				response.sendRedirect("/Views/error/error.jsp");
			}
		} else {
			response.sendRedirect("/Views/error/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
