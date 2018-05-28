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

	// 전체 페이지 조회
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

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {

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

		// navi 총 개수

		int pageTotalCount = 0;

		// 페이지당 10개씩 보이게 만들어서 navi list를 만들려면
		// 총 게시물이 124개 라고 했을 경우 124 % 10 한 후 + 1 만큼 만들어야 함
		// 만약 나머지가 0이면 +1을 하지 않음

		// 124 % 10
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else
			pageTotalCount = recordTotalCount / recordCountPerPage;

		// 1페이지 에서 아래 페이지를 조회 할 경우 1페이지로 설정
		// 마지막 페이지에서 다음 페이지를 조회 할 경우 마지막 페이지로 설정

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

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

		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;

		// 끝 navi = 시작 navi + 보여줄 navi 개수 - 1;
		// 만약 시작 navi가 1이라면
		// 1 + 5 -1 -> 5

		int endNavi = startNavi + naviCountPerPage - 1;

		// 끝 navi를 구할 때 주의 해야 할 점
		// 총 navi가 122 라고 가정 할 때 (현재 페이지는 121이라고 가정)
		// 시작 navi -> ((121 - 1) / 5 ) * 5 + 1 = 121
		// 끝 navi -> 121 + 5 - 1 = 125 -> 122까지 있어야 함
		// 마지막 navi 부분은 아래 코드를 추가

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 페이지 navi에서 사용할 '<', '>' 모양을 사용하기 위해 필요한 변수 2개 생성 (시작과 끝은 필요없음)

		boolean needPrev = true, needNext = true;

		// 둘다 속하는 경우 때문에 if if
		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		// navi 구조 끝

		StringBuilder sb = new StringBuilder();
		sb.append("<ul class=\"pagination\">");
		if (needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\"href='/notice?currentPage=" + (startNavi - 1)
					+ "'> 이전 </a></li>");

			// sb.append("<a href='/notice?currentPage=" + (startNavi - 5) + "'> << </a>");
			// 5 페이지 앞으로
			// sb.append("<a href='/notice?currentPage=1'> <<< </a>");
			// 1 페이지로
		}
		for (int i = startNavi; i <= endNavi; i++) {

			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/notice?currentPage=" + i + "'>" + i
					+ " </a></li>");

		}

		if (needNext) { // 끝 페이지가 아니라면
			sb.append("<li class=\"page-item\"><a class=\"page-link\"href='/notice?currentPage=" + (endNavi + 1)
					+ "'> 다음 </a></li>");
		}
		sb.append("</ul>");
		return sb.toString();
	}

	// 메뉴바 부분
	// StringBuilder sb = new StringBuilder();
	//
	// if (needPrev) {
	// sb.append("<a href='/notice?currentPage=" + (startNavi - 1) + "'> < </a>");
	//
	// // sb.append("<a href='/notice?currentPage=" + (startNavi - 5) + "'> <<
	// </a>");
	// // 5 페이지 앞으로
	// // sb.append("<a href='/notice?currentPage=1'> <<< </a>");
	// // 1 페이지로
	// }
	//
	// for (int i = startNavi; i <= endNavi; i++) {
	// if (i == currentPage) {
	// sb.append("<a href='/notice?currentPage=" + i + "'><B> " + i + " </B></a>");
	// } else {
	// sb.append("<a href='/notice?currentPage=" + i + "'> " + i + " </a>");
	// }
	// }
	//
	// if (needNext) { // 끝 페이지가 아니라면
	// sb.append("<a href='/notice?currentPage=" + (endNavi + 1) + "'> > </a>");
	// }
	//
	// return sb.toString();

	// 제목으로 검색
	public String noticeSearchTitle(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			String title) {

		int recordTotalCount = 0;

		String query = prop.getProperty("getSearchTitleContents");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + title + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				recordTotalCount = rs.getInt("totalcount");
			}

			System.out.println();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		int pageTotalCount = 0;

		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else
			pageTotalCount = recordTotalCount / recordCountPerPage;

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true, needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a href='/notice?currentPage=" + (startNavi - 1) + "'> < </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<a href='/notice?currentPage=" + i + "'><B> " + i + " </B></a>");
			} else {
				sb.append("<a href='/notice?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		
		if (needNext) {
			sb.append("<a href='/notice?currentPage=" + (endNavi + 1) + "'> > </a>");
		}

		return sb.toString();
	}
}
