package jsp.file.model.vo;

import java.sql.Timestamp;

public class FileVo {

	private String fileName, filePath, fileUser;
	private int fileSize;
	private Timestamp upload;

	public FileVo() {
	}

	public FileVo(String fileName, String filePath, String fileUser, int fileSize, Timestamp upload) {
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileUser = fileUser;
		this.fileSize = fileSize;
		this.upload = upload;
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

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Timestamp getUpload() {
		return upload;
	}

	public void setUpload(Timestamp upload) {
		this.upload = upload;
	}
}
