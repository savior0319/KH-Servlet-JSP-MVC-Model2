package jsp.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.common.JDBCTemplate;
import jsp.notice.model.dao.NoticeDao;
import jsp.notice.model.vo.NoticeVo;
import jsp.notice.model.vo.PageDataVo;

public class NoticeService {

	private Connection conn = null;
	private NoticeDao nDao = new NoticeDao();

	public NoticeService() {
	}

	public PageDataVo noticeAll(int currentPage) {
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
		String pageNavi = nDao.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);

		PageDataVo pd = null;

		if (!aList.isEmpty() && !pageNavi.isEmpty()) {
			pd = new PageDataVo();
			pd.setaList(aList);
			pd.setPageNavi(pageNavi);
		}

		JDBCTemplate.close(conn);

		return pd;
	}

	public PageDataVo noticeSearch(int currentPage, String title) {

		conn = JDBCTemplate.getConnect(conn);

		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		ArrayList<NoticeVo> aList = nDao.getCurrentPageSearch(conn, currentPage, recordCountPerPage, title);
		String pageNavi = nDao.getPageNaviSearch(conn, currentPage, recordCountPerPage, naviCountPerPage, title);

		PageDataVo pd = null;

		if (!aList.isEmpty() && !pageNavi.isEmpty()) {
			pd = new PageDataVo();
			pd.setaList(aList);
			pd.setPageNavi(pageNavi);
		}

		JDBCTemplate.close(conn);

		return pd;
	}

	public NoticeVo noticeSelect(int noticeNo) {

		conn = JDBCTemplate.getConnect(conn);

		NoticeVo notice = new NoticeDao().noticeSelect(conn, noticeNo);
		JDBCTemplate.close(conn);

		return notice;
	}

	public int noticeModify(int noticeNo, String subject, String content) {
		conn = JDBCTemplate.getConnect(conn);

		int result = new NoticeDao().noticeModify(conn, noticeNo, subject, content);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);

		return result;

	}

	public int noticeWrite(String subject, String content) {
		conn = JDBCTemplate.getConnect(conn);

		int result = new NoticeDao().noticeWrite(conn, subject, content);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);

		return result;
	}

	public int noticeDelete(int noticeNo) {
		conn = JDBCTemplate.getConnect(conn);

		int result = new NoticeDao().noticeDelete(conn, noticeNo);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);

		return result;
	}

}
