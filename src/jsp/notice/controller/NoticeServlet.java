package jsp.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.notice.model.service.NoticeService;
import jsp.notice.model.vo.NoticeVo;

@WebServlet(name = "Notice", urlPatterns = { "/notice" })
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 인코딩
		// 2. 넘겨준 값 변수에 저장
		
		// 페이징 처리
		int currentPage; // 현재 페이지 값을 저장하는 변수
		
		if(request.getParameter("currentPage") == null) {
			 currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} // 첫 페이지는 1로 설정, 그 외 페이지는 해당 페이지의 값을 가져옴

		// 3. 비즈니스 로직
		ArrayList<NoticeVo> aList = new NoticeService().noticeAll(currentPage);

		// 4. 결과값 JSP 출력
		if (!aList.isEmpty()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/notice/noticeList.jsp");
			request.setAttribute("noticeList", aList);
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
