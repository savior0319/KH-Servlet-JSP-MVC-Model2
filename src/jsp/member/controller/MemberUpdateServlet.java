package jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.member.model.service.MemberService;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "MemberUpdate", urlPatterns = { "/memberupdate" })
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession(false);
			MemberVo mv = (MemberVo) session.getAttribute("user");
			
			request.setCharacterEncoding("utf-8");

			String mail = request.getParameter("mail");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String hobby = request.getParameter("hobby");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			mv.setEmail(mail);
			mv.setPhone(phone);
			mv.setAddress(addr);
			mv.setHobby(hobby);
			mv.setUserId(id);
			mv.setUserPwd(pw);
			
			int result = new MemberService().memberUpdate(mv);

			if (result > 0) {
				RequestDispatcher view = request.getRequestDispatcher("/Views/member/memberUpdateSuccess.jsp");
				request.setAttribute("userList", result);
				view.forward(request, response);
			} else {
				response.sendRedirect("/Views/member/memberUpdateFail.jsp");
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
