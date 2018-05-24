package jsp.member.model.service;

import java.sql.Connection;

import jdbc.common.JDBCTemplate;
import jsp.member.model.dao.MemberDAO;
import jsp.member.model.vo.MemberVo;

public class MemberService {

	private Connection conn = null;
	private MemberDAO mDao = new MemberDAO();

	public MemberService() {
	}

	public MemberVo memberLogin(String userId, String userPwd) {
		conn = JDBCTemplate.getConnect(conn);
		MemberVo mv = mDao.memberLogin(conn, userId, userPwd);
		JDBCTemplate.close(conn);
		return mv;
	}

}
