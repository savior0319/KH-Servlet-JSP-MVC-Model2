package jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.member.model.service.MemberService;

@WebServlet(name = "IdCheck", urlPatterns = { "/idcheck" })
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IdCheckServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("id");
		response.getWriter().write(String.valueOf(new MemberService().idCheck(userId)));

		// if (result == 1) {
		// response.sendRedirect("/Views/member/idAlreadyUsed.jsp");
		// } else {
		// RequestDispatcher view =
		// request.getRequestDispatcher("/Views/member/idCanUse.jsp");
		// request.setAttribute("userId", userId);
		// view.forward(request, response);
		// }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
