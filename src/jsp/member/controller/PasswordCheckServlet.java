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

@WebServlet(name = "PasswordCheck", urlPatterns = { "/pwdcheck" })
public class PasswordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PasswordCheckServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");
		String userPwd = request.getParameter("userPwd");

		if (mv != null) {
			String getPwd = new MemberService().chekPwd(mv.getUserId());
			if (getPwd == null) {
				response.sendRedirect("/Views/member/errorpage.jsp");
			} else {
				if (userPwd.equals(getPwd)) {
					response.sendRedirect("/mypage");
				} else {
					response.sendRedirect("/Views/member/wrongPwd.jsp");
				}
			}
		} else {
			response.sendRedirect("/Views/member/errorpage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
