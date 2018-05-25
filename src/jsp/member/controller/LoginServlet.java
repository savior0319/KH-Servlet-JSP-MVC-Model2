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

@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberVo mv = new MemberVo();
	private MemberService mService = new MemberService();

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		mv = mService.memberLogin(userId, userPwd);
		HttpSession session = request.getSession();
		session.setAttribute("user", mv);

		if (!mv.getActivation().equals("y")) {
			response.sendRedirect("/Views/member/loginNoActivation.jsp");
		} else {
			if (mv != null) {
				response.sendRedirect("/Views/member/loginSuccess.jsp");
			} else {
				response.sendRedirect("/Views/member/loginFail.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
