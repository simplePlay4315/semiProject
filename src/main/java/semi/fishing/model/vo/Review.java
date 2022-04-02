package semi.fishing.model.vo;

import java.sql.Date;


public class Review {
	private int no; 
	private int fishingNo;
	private String userId; 
	private String content;
	private Date createdDate; 
	private int score;
	
	public Review() {
		
	}

	public Review(int no, int fishingNo, String userId, String content, Date createdDate, int score) {
		this.no = no;
		this.fishingNo = fishingNo;
		this.userId = userId;
		this.content = content;
		this.createdDate = createdDate;
		this.score = score;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFishingNo() {
		return fishingNo;
	}

	public void setFishingNo(int fishingNo) {
		this.fishingNo = fishingNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Review [no=" + no + ", fishingNo=" + fishingNo + ", userId=" + userId + ", content=" + content
				+ ", createdDate=" + createdDate + ", score=" + score + "]";
	}
}
