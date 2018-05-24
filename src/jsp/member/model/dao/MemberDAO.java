package jsp.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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

}
