package jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.member.model.service.MemberService;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "UserDelete", urlPatterns = { "/userdelete" })
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession(false);
			MemberVo mv = (MemberVo) session.getAttribute("user");
			int result = new MemberService().userDel(mv.getUserId());

			if (result == 0) {
				response.sendRedirect("/Views/member/noMyinfo.jsp");
			} else {
				response.sendRedirect("/Views/member/deleteSuccess.jsp");
				session.invalidate();
			}
		} catch (Exception e) {
			response.sendRedirect("/Views/member/errorpage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
