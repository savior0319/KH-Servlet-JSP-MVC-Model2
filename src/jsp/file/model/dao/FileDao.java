package jsp.file.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Properties;

import jdbc.common.JDBCTemplate;
import jsp.file.model.vo.FileVo;
import jsp.file.model.vo.FileVo2;

public class FileDao {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Properties prop = new Properties();

	public FileDao() {

		String path = FileDao.class.getResource("").getPath();
		try {
			prop.load(new FileReader(path + "fileQuery.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int uploadFile(Connection conn, FileVo fv) {

		int result = 0;

		String query = prop.getProperty("uploadFile");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fv.getFileName());
			pstmt.setString(2, fv.getFilePath());
			pstmt.setLong(3, fv.getFileSize());
			pstmt.setString(4, fv.getFileUser());
			pstmt.setTimestamp(5, fv.getUpload());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<FileVo> fileList(Connection conn) {

		ArrayList<FileVo> aList = new ArrayList<FileVo>();

		String query = prop.getProperty("fileList");

		try {
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileVo fv = new FileVo();
				fv.setFileName(rs.getString("filename"));
				fv.setFilePath(rs.getString("filepath"));
				fv.setFileSize(rs.getLong("filesize"));
				fv.setFileUser(rs.getString("fileuser"));
				fv.setUpload(rs.getTimestamp("upload"));

				aList.add(fv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return aList;
	}

	public FileVo fileDownLoad(Connection conn, String fileName, Timestamp uploadTime) {

		FileVo fv = null;
		String query = prop.getProperty("fileDownLoad");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileName);
			pstmt.setTimestamp(2, uploadTime);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				fv = new FileVo();
				fv.setFileName(rs.getString("filename"));
				fv.setFilePath(rs.getString("filepath"));
				fv.setFileSize(rs.getLong("filesize"));
				fv.setFileUser(rs.getString("fileuser"));
				fv.setUpload(rs.getTimestamp("upload"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return fv;
	}

	public int uploadFile2(Connection conn, FileVo2 fv) {

		int result = 0;

		String query = prop.getProperty("uploadFile2");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fv.getBeforeFileName());
			pstmt.setString(2, fv.getAfterFileName());
			pstmt.setString(3, fv.getFilePath());
			pstmt.setLong(4, fv.getFileSize());
			pstmt.setString(5, fv.getFileUser());
			pstmt.setTimestamp(6, fv.getUploadTime());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<FileVo2> fileList2(Connection conn) {

		ArrayList<FileVo2> aList = new ArrayList<FileVo2>();

		String query = prop.getProperty("fileList2");

		try {
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileVo2 fv = new FileVo2();
				fv.setBeforeFileName(rs.getString("BEFORFILENAME"));
				fv.setAfterFileName(rs.getString("ATERFILENAME"));
				fv.setFilePath(rs.getString("FILEPATH"));
				fv.setFileSize(rs.getLong("FILESIZE"));
				fv.setFileUser(rs.getString("FILEUSER"));
				fv.setUploadTime(rs.getTimestamp("UPLOADTIME"));

				aList.add(fv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return aList;
	}

	public FileVo2 fileDownLoad2(Connection conn, String fileName, Timestamp uploadTime) {

		FileVo2 fv = null;
		String query = prop.getProperty("fileDownLoad2");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileName);
			pstmt.setTimestamp(2, uploadTime);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				fv = new FileVo2();
				fv.setAfterFileName(rs.getString("ATERFILENAME"));
				fv.setBeforeFileName(rs.getString("BEFORFILENAME"));
				fv.setFilePath(rs.getString("FILEPATH"));
				fv.setFileSize(rs.getLong("FILESIZE"));
				fv.setFileUser(rs.getString("FILEUSER"));
				fv.setUploadTime(rs.getTimestamp("UPLOADTIME"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return fv;
	}

	public int fileDelete(Connection conn, String filePath) {
		
		int result = 0;

		String query = prop.getProperty("fileDelete");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, filePath);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
