package model;

import java.sql.Timestamp;

public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private String email;
	private int readcount;
	private int groupNo;
	private int step;
	private int sortNo;
	private String delFlag;
	private String fileName;
	private long fileSize;
	private int downcount;
	private String originalFileName;
	private Timestamp regdate;
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int no, String title, String content, String email, int readcount,  
			String fileName, long fileSize, int downcount, String originalFileName,
			Timestamp regdate) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.email = email;
		this.readcount = readcount;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downcount = downcount;
		this.originalFileName = originalFileName;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", email=" + email + ", readcount="
				+ readcount + ", groupNo=" + groupNo + ", step=" + step + ", sortNo=" + sortNo + ", delFlag=" + delFlag
				+ ", fileName=" + fileName + ", fileSize=" + fileSize + ", downcount=" + downcount
				+ ", originalFileName=" + originalFileName + ", regdate=" + regdate + "]";
	}
	
	
}
