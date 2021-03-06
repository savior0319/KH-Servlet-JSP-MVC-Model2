package jsp.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import jdbc.common.JDBCTemplate;
import jsp.member.model.vo.MemberVo;

public class MemberDAO {

	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private Properties prop = new Properties();

	public MemberDAO() {
		String path = MemberDAO.class.getResource("").getPath();
		try {
			prop.load(new FileReader(path + "queryMember.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MemberVo memberLogin(Connection conn, String userId, String userPwd) {

		MemberVo mv = null;
		String query = prop.getProperty("memberLogin");

		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userPwd);

			rs = psmt.executeQuery();

			while (rs.next()) {
				mv = new MemberVo();
				mv.setUserId(rs.getString("userid"));
				mv.setUserPwd(rs.getString("userpwd"));
				mv.setUserName(rs.getString("username"));
				mv.setAge(rs.getInt("age"));
				mv.setEmail(rs.getString("email"));
				mv.setPhone(rs.getString("phone"));
				mv.setAddress(rs.getString("address"));
				mv.setGender(rs.getString("gender"));
				mv.setHobby(rs.getString("hobby"));
				mv.setEnrollDate(rs.getDate("enrolldate"));
				mv.setActivation(rs.getString("activation"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(psmt);
		}
		return mv;
	}

	public ArrayList<MemberVo> allMember(Connection conn) {

		ArrayList<MemberVo> aList = new ArrayList<MemberVo>();

		String query = prop.getProperty("allMember");
		try {
			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberVo mv = new MemberVo();
				mv.setUserId(rs.getString("userid"));
				mv.setUserPwd(rs.getString("userpwd"));
				mv.setUserName(rs.getString("username"));
				mv.setAge(rs.getInt("age"));
				mv.setEmail(rs.getString("email"));
				mv.setPhone(rs.getString("phone"));
				mv.setAddress(rs.getString("address"));
				mv.setGender(rs.getString("gender"));
				mv.setHobby(rs.getString("hobby"));
				mv.setEnrollDate(rs.getDate("enrolldate"));
				mv.setActivation(rs.getString("activation"));

				aList.add(mv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(psmt);
		}
		return aList;
	}

	public int memberActivation(Connection conn, String activation, String userId) {

		int result = 0;
		String query = prop.getProperty("memberActivation");

		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, activation);
			psmt.setString(2, userId);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}

	public int memberSignUp(Connection conn, MemberVo mv) {

		int result = 0;
		String query = prop.getProperty("memberSignUp");

		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, mv.getUserId());
			psmt.setString(2, mv.getUserPwd());
			psmt.setString(3, mv.getUserName());
			psmt.setInt(4, mv.getAge());
			psmt.setString(5, mv.getEmail());
			psmt.setString(6, mv.getPhone());
			psmt.setString(7, mv.getAddress());
			psmt.setString(8, mv.getGender());
			psmt.setString(9, mv.getHobby());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}

	public int memberUpdate(Connection conn, MemberVo mv) {

		String originPwd = "";
		int result = 0;
		try {
			psmt = conn.prepareStatement("select userpwd from member where userid = ?");
			psmt.setString(1, mv.getUserId());

			rs = psmt.executeQuery();

			while (rs.next()) {
				originPwd = rs.getString("userpwd");
			}

			System.out.println(originPwd + " -> 변경 전 ");
			System.out.println(mv.getUserPwd() + " -> 변경 후 ");

		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
		}

		if (!originPwd.equals(mv.getUserPwd())) {

			String query = prop.getProperty("memberUpdate1");

			try {
				psmt = conn.prepareStatement(query);
				psmt.setString(1, mv.getEmail());
				psmt.setString(2, mv.getPhone());
				psmt.setString(3, mv.getAddress());
				psmt.setString(4, mv.getHobby());
				psmt.setString(5, mv.getUserPwd());
				psmt.setString(6, mv.getUserId());

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(psmt);
			}
			return result;

		} else {
			String query = prop.getProperty("memberUpdate2");

			try {
				psmt = conn.prepareStatement(query);
				psmt.setString(1, mv.getEmail());
				psmt.setString(2, mv.getPhone());
				psmt.setString(3, mv.getAddress());
				psmt.setString(4, mv.getHobby());
				psmt.setString(5, mv.getUserPwd());
				psmt.setString(6, mv.getUserId());

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(psmt);
			}
			return result;
		}
	}

	public String chekPwd(Connection conn, String userId) {

		String getPwd = null;

		String query = prop.getProperty("chekPwd");
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			while (rs.next()) {
				getPwd = rs.getString("USERPWD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(psmt);
		}
		return getPwd;
	}

	public int idCheck(Connection conn, String userId) {

		int result = 0;

		String query = prop.getProperty("idCheck");
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(psmt);
		}
		return result;
	}

	public int userDel(Connection conn, String userId) {

		int result = 0;

		String query = prop.getProperty("userDel");
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, userId);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}

	public int changePwdCheck(Connection conn, String userId) {

		int result = 0;
		String query = prop.getProperty("changePwdCheck");

		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			while (rs.next()) {

				if (rs.getInt(1) >= 90) {
					result = 1;
				} else {
					result = 0;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(psmt);
		}
		return result;
	}
}
