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

@WebServlet(name = "Mypage", urlPatterns = { "/mypage" })
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MypageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession(false);
			MemberVo mv = (MemberVo) session.getAttribute("user");
			MemberVo member = new MemberService().memberLogin(mv.getUserId(), mv.getUserPwd());
			
			if (member == null) {
				response.sendRedirect("/Views/member/noMyinfo.jsp");
			} else {
				RequestDispatcher view = request.getRequestDispatcher("/Views/member/myPage.jsp");
				request.setAttribute("memberInfo", member);
				view.forward(request, response);
			}
		} catch (Exception e) {
			response.sendRedirect("/Views/member/errorpage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
