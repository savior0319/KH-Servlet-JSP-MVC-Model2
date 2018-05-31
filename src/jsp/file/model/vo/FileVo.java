package jsp.file.model.vo;

import java.sql.Timestamp;

public class FileVo {

	private String fileName, filePath, fileUser;
	private long fileSize;
	private Timestamp uploadTime;

	public FileVo() {
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public Timestamp getUpload() {
		return uploadTime;
	}

	public void setUpload(Timestamp upload) {
		this.uploadTime = upload;
	}
}
