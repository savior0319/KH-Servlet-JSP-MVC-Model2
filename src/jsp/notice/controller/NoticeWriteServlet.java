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

@WebServlet(name = "NoticeWrite", urlPatterns = { "/noticeWrite" })
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeWriteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");

		if (mv.getUserId().equals("admin")) {

			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			int result = new NoticeService().noticeWrite(subject, content);

			if (result > 0) {
				response.sendRedirect("/Views/notice/noticeWriteComplete.jsp");
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
