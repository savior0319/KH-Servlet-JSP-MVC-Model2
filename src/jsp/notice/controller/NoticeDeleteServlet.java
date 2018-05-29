package jsp.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.member.model.vo.MemberVo;
import jsp.notice.model.service.NoticeService;

@WebServlet(name = "NoticeDelete", urlPatterns = { "/noticeDelete" })
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeDeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");

		if (mv.getUserId().equals("admin")) {
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			int result = new NoticeService().noticeDelete(noticeNo);

			if (result > 0) {
				response.sendRedirect("/Views/notice/noticeDeleteSuccess.jsp");
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
