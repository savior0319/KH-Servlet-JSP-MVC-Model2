package jsp.file.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.common.JDBCTemplate;
import jsp.file.model.dao.FileDao;
import jsp.file.model.vo.FileVo;

public class FileService {

	private Connection conn = null;

	public FileService() {
	}

	public int uploadFile(FileVo fv) {
		conn = JDBCTemplate.getConnect(conn);
		int result = new FileDao().uploadFile(conn, fv);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollBack(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<FileVo> fileList() {
		conn = JDBCTemplate.getConnect(conn);
		ArrayList<FileVo> aList = new FileDao().fileList(conn);
		JDBCTemplate.close(conn);
		return aList;
	}

}
