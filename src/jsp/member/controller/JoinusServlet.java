package jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.member.model.service.MemberService;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "Joinus", urlPatterns = { "/joinus" })
public class JoinusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService mService = new MemberService();
	private MemberVo mv = new MemberVo();

	public JoinusServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String gender[] = request.getParameterValues("gender");
		String hobby = request.getParameter("hobby");

		mv.setUserId(id);
		mv.setUserPwd(pwd);
		mv.setUserName(name);
		mv.setAge(age);
		mv.setEmail(mail);
		mv.setPhone(phone);
		mv.setAddress(addr);
		mv.setGender(gender[0]);
		mv.setHobby(hobby);

		int result = mService.memberSignUp(mv);

		if (result > 0) {
			response.sendRedirect("/Views/member/joinusSuccess.jsp");
		} else {
			response.sendRedirect("/Views/member/joinusFail.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
