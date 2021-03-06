package jsp.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<MemberVo> allMember() {
		conn = JDBCTemplate.getConnect(conn);
		ArrayList<MemberVo> aList = mDao.allMember(conn);

		JDBCTemplate.close(conn);
		if (aList.isEmpty()) {
			return null;
		} else
			return aList;
	}

	public int memberActivation(String activation, String userId) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.memberActivation(conn, activation, userId);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);
		return result;
	}

	public int memberSignUp(MemberVo mv) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.memberSignUp(conn, mv);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);
		return result;
	}

	public int memberUpdate(MemberVo mv) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.memberUpdate(conn, mv);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);
		return result;
	}

	public String chekPwd(String userId) {
		conn = JDBCTemplate.getConnect(conn);
		String getPwd = mDao.chekPwd(conn, userId);

		JDBCTemplate.close(conn);
		return getPwd;
	}

	public int idCheck(String userId) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.idCheck(conn, userId);
		JDBCTemplate.close(conn);
		return result;
	}

	public int userDel(String userId) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.userDel(conn, userId);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);
		return result;
	}

	public int changePwdCheck(String userId) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.changePwdCheck(conn, userId);
		JDBCTemplate.close(conn);
		return result;
	}

}
