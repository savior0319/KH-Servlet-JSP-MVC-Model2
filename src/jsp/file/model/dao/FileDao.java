package jsp.file.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import jdbc.common.JDBCTemplate;
import jsp.file.model.vo.FileVo;

public class FileDao {

	private PreparedStatement pstmt = null;
	private Properties prop =  new Properties();

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

}
