package jsp.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.notice.model.service.NoticeService;
import jsp.notice.model.vo.PageDataVo;

@WebServlet(name = "NoticeSearch", urlPatterns = { "/noticeSearch" })
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeSearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");

		int currentPage; // 현재 페이지 값을 저장하는 변수

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} // 첫 페이지는 1로 설정, 그 외 페이지는 해당 페이지의 값을 가져옴

		// 3. 비즈니스 로직
		PageDataVo pd = new NoticeService().noticeSearch(currentPage, title);

		// 4. 결과값 JSP 출력
		if (pd != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/notice/noticeSearch.jsp");
			request.setAttribute("pageData", pd);
			request.setAttribute("search", title);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("/Views/error/noticeListNotFound.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
