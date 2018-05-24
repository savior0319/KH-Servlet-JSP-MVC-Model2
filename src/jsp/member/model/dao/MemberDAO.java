package jsp.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.scenario.effect.impl.prism.ps.PPSBlend_ADDPeer;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import jdbc.common.JDBCTemplate;
import jsp.member.model.vo.MemberVo;

public class MemberDAO {

	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private Properties prop = new Properties();

	public MemberDAO() {
		try {
			prop.load(new FileReader(
					"C:\\Users\\user1\\Documents\\webworkspace\\web2\\src\\properties\\query.properties"));
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

}
