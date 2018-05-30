package jsp.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.notice.model.service.NoticeService;

@WebServlet(name = "NoticeCommentModify", urlPatterns = { "/noticeCommentModify" })
public class NoticeCommentModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeCommentModifyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String comment = request.getParameter("comment");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		int result = new NoticeService().noticeCommentModify(commentNo, comment);
		
		if(result > 0) {
			response.sendRedirect("/noticeSelect?noticeNo=" + noticeNo);
		} else {
			response.sendRedirect("/Views/error/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
