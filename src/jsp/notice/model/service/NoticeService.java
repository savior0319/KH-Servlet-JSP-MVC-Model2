package jsp.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.common.JDBCTemplate;
import jsp.notice.model.dao.NoticeDao;
import jsp.notice.model.vo.NoticeVo;

public class NoticeService {

	private Connection conn = null;
	private NoticeDao nDao = new NoticeDao();

	public NoticeService() {
	}

	public ArrayList<NoticeVo> noticeAll(int currentPage) {
		conn = JDBCTemplate.getConnect(conn);

		// Service에서는 2가지 값을 정해야 함

		// 1. 한 페이지당 보이는 리스트의 개수 (게시물의 개수)
		int recordCountPerPage = 10;

		// 2. 현재 위치를 중심으로 시작 navi에서부터 끝 navi 개수
		int naviCountPerPage = 5;

		// Service에서는 DAO에 2가지 요청을 진행 해야 함

		// 1. 현재 페이지 리스트
		ArrayList<NoticeVo> aList = nDao.getCurrentPage(conn, currentPage, recordCountPerPage);

		// 2. 현재 중심으로 만들어지는 navi 리스트
		nDao.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);

		return null;
	}

}
