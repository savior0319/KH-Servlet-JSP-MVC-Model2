package jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.member.model.service.MemberService;

@WebServlet(name = "MemberActivation", urlPatterns = { "/memberActivation" })
public class MemberActivationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService mService = new MemberService();

	public MemberActivationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String activation = request.getParameter("activation");
		String userId = request.getParameter("userId");

		if (activation.equals("y")) {
			activation = "n";
		} else {
			activation = "y";
		}

		int result = mService.memberActivation(activation, userId);

		if (result > 0) {
			response.sendRedirect("allMember");
		} else {
			// response.sendRedirect("allMember"); 안됐을때
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
