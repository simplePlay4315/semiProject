package semi.reservation.model.vo;

import java.sql.Date;

import semi.fishing.model.vo.Fishing;

public class Reserve {
	private int resNo; 
	private String userId; 
	private Fishing fishing;  
	private Date resDate; 
	private int UserNum;
	private String status;
	
	public Reserve() {

	}

	public int getResNo() {
		return resNo;
	}
	
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Fishing getFishing() {
		return fishing;
	}
	
	public void setFishing(Fishing fishing) {
		this.fishing = fishing;
	}
	
	public Date getResDate() {
		return resDate;
	}
	
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	
	public int getUserNum() {
		return UserNum;
	}
	
	public void setUserNum(int userNum) {
		UserNum = userNum;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", userId=" + userId + ", fishing=" + fishing + ", resDate=" + resDate
				+ ", UserNum=" + UserNum + ", status=" + status + "]";
	}
}
