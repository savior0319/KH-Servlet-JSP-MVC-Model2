package jsp.file.model.service;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;

import jdbc.common.JDBCTemplate;
import jsp.file.model.dao.FileDao;
import jsp.file.model.vo.FileVo;
import jsp.file.model.vo.FileVo2;

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

	public FileVo fileDownLoad(String fileName, Timestamp uploadTime) {
		conn = JDBCTemplate.getConnect(conn);
		FileVo fv = new FileDao().fileDownLoad(conn, fileName, uploadTime);
		JDBCTemplate.close(conn);
		return fv;
	}

	public int uploadFile2(FileVo2 fv) {
		conn = JDBCTemplate.getConnect(conn);
		int result = new FileDao().uploadFile2(conn, fv);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollBack(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<FileVo2> fileList2() {
		conn = JDBCTemplate.getConnect(conn);
		ArrayList<FileVo2> aList = new FileDao().fileList2(conn);
		JDBCTemplate.close(conn);
		return aList;
	}

	public FileVo2 fileDownLoad2(String fileName, Timestamp uploadTime) {
		conn = JDBCTemplate.getConnect(conn);
		FileVo2 fv = new FileDao().fileDownLoad2(conn, fileName, uploadTime);
		JDBCTemplate.close(conn);
		return fv;
	}

	public int fileDelete(String filePath) {
		conn = JDBCTemplate.getConnect(conn);
		int result = new FileDao().fileDelete(conn, filePath);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollBack(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

}
