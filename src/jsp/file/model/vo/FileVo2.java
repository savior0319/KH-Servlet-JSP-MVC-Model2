package jsp.file.model.vo;

import java.sql.Timestamp;

public class FileVo2 {

	public String getBeforeFileName() {
		return beforeFileName;
	}

	public void setBeforeFileName(String beforeFileName) {
		this.beforeFileName = beforeFileName;
	}

	public String getAfterFileName() {
		return afterFileName;
	}

	public void setAfterFileName(String afterFileName) {
		this.afterFileName = afterFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileUser() {
		return fileUser;
	}

	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public Timestamp getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

	private String beforeFileName, afterFileName, filePath, fileUser;
	private long fileSize;
	private Timestamp uploadTime;

	public FileVo2() {
	}

}
