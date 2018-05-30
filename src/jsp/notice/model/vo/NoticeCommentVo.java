package jsp.notice.model.vo;

import java.sql.Date;

public class NoticeCommentVo {

	public int getCommentNO() {
		return commentNO;
	}

	public void setCommentNO(int commentNO) {
		this.commentNO = commentNO;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	private int commentNO, noticeNo;
	private String content, userId;
	private Date regDate;
	
	public NoticeCommentVo() {
	}

}
