package semi.wish.model.vo;

import semi.fishing.model.vo.Fishing;

public class Wish {
	private int wishNo; 
	private Fishing fishing; 
	private String userId;
	
	public int getWishNo() {
		return wishNo;
	}
	
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	
	public Fishing getFishing() {
		return fishing;
	}
	
	public void setFishing(Fishing fishing) {
		this.fishing = fishing;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Wish() {
		
	}

	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", fishing=" + fishing + ", userId=" + userId + "]";
	}
	
}
