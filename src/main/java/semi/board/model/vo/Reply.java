package semi.board.model.vo;

import java.sql.Time;
import java.util.Date;

public class Reply {
	private int no;
	private int boardNo;
	private int writerNo;
	private String writerId;
	private String content;	
	private Date createDate;
	private Date modifyDate;
	private Time createTime;
	private Time modifyTime;
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int no, int boardNo, int writerNo, String writerId, String content, Date createDate, Date modifyDate,
			Time createTime, Time modifyTime) {
		super();
		this.no = no;
		this.boardNo = boardNo;
		this.writerNo = writerNo;
		this.writerId = writerId;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.createTime = createTime;
		this.modifyTime = modifyTime;
	}
	@Override
	public String toString() {
		return "Reply [no=" + no + ", boardNo=" + boardNo + ", writerNo=" + writerNo + ", writerId=" + writerId
				+ ", content=" + content + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", createTime="
				+ createTime + ", modifyTime=" + modifyTime + "]";
	}
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Time getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Time createTime) {
		this.createTime = createTime;
	}

	public Time getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Time modifyTime) {
		this.modifyTime = modifyTime;
	}
}