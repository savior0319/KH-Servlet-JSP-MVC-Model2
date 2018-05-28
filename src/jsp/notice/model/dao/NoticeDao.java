package jsp.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import jdbc.common.JDBCTemplate;
import jsp.notice.model.vo.NoticeVo;

public class NoticeDao {

	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private Properties prop = new Properties();

	public NoticeDao() {
		String path = NoticeDao.class.getResource("").getPath();
		try {
			prop.load(new FileReader(path + "query.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<NoticeVo> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {

		ArrayList<NoticeVo> aList = new ArrayList<NoticeVo>();

		// 시작 게시물 계산
		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		// 만약 요청 한 페이지가 1 페이지 라면 -> 1 * 10 - (10 - 1) -> 1
		// 만약 요청 한 페이지가 3 페이지 라면 -> 3 * 10 - (10 - 1) -> 21

		// 끝 게시물 계산
		int end = currentPage * recordCountPerPage;
		// 만약 요청한 페이지가 1 페이지 라면 -> 10
		// 만약 요청한 페이지가 3 페이지 라면 -> 30

		String query = prop.getProperty("getCurrentPage");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeVo nv = new NoticeVo();
				nv.setNoticeNo(rs.getInt("noticeno"));
				nv.setSubject(rs.getString("subject"));
				nv.setContents(rs.getString("contents"));
				nv.setUserId(rs.getString("userid"));
				nv.setRegDate(rs.getDate("regdate"));

				aList.add(nv);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return aList;

	}

	public void getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {

		// 게시물의 총 개수를 구해야 함

		int recordTotalCount = 0; // 총 게시물 개수 저장 변수 (정보가 없으므로 초기 값 0)

		String query = prop.getProperty("getPageNavi");

		try {
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				recordTotalCount = rs.getInt("totalcount");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		int pageTotalCount = 0; // navi 총 개수
		// 페이지당 10개씩 보이게 만들어서 navi list를 만들려면
		// 총 게시물이 124개 라고 했을 경우 124 % 10 한 후 + 1 만큼 만들어야 함
		// 만약 나머지가 0이면 +1을 하지 않음

		// 124 % 10
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else
			pageTotalCount = recordTotalCount / recordCountPerPage;

		// 현재 페이지를 기점으로 시작 navi와 끝 navi를 만들어야 함
		// 현재 페이지가 1이라면 -> 1 - 5
		// 현재 페이지가 3이라면 -> 1 - 5
		// 현재 페이지가 7이라면 -> 6 - 10
		// 현재 페이지가 12이라면 -> 11 - 15
		// ((현재페이지 - 1) / 리스트개수) * 리스트개수 + 1
		// 만약 1페이지 라면
		// ((1 - 1) / 5 ) * 5 + 1 -> 시작 페이지는 1
		// 만약 3페이지 라면
		// ((3 - 1) / 5 ) * 5 + 1 -> 시작 페이지는 1
		// 만약 7페이지 라면
		// ((7 - 1) / 5 ) * 5 + 1 -> 시작 페이지는 6
		// 만약 12페이지 라면
		// ((12 - 1) / 5) * 5 + 1 -> 시작 페이지는 11
	}
}
