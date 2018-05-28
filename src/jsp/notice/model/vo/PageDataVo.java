package jsp.notice.model.vo;

import java.util.ArrayList;

public class PageDataVo {

	private ArrayList<NoticeVo> aList;
	private String pageNavi;

	public PageDataVo() {

	}

	public PageDataVo(ArrayList<NoticeVo> aList, String pageNavi) {
		super();
		this.aList = aList;
		this.pageNavi = pageNavi;
	}

	public ArrayList<NoticeVo> getaList() {
		return aList;
	}

	public void setaList(ArrayList<NoticeVo> aList) {
		this.aList = aList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
