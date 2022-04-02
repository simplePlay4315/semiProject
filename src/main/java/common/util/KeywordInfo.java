package common.util;

public class KeywordInfo {
	private String area; // 지역명 
	private String type; // 바다, 실내 , 저수지, 평지 
	private String title; // 제목 
	private String fish; // 물고기 
	private String order;  // 이름순, 리뷰순, 조회순
	
	public KeywordInfo(String area, String type, String title, String fish) {
		super();
		this.area = area;
		this.type = type;
		this.title = title;
		this.fish = fish;
	}
	
	public KeywordInfo() {

	}

	public String getTitle() {
		if(title == null) {
			return "";
		}else {
			return title;
		}
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFish() {
		if(fish == null) {
			return "";
		}else {
			return fish;
		}
	}
	
	public void setFish(String fish) {
		this.fish = fish;
	}

	public String getArea() {
		if(area == null) {
			return "";
		}else {
			return area;
		}
	}
	
	public void setArea(String area) {
		this.area = area;
	}
	
	public String getType() {
		if(type == null) {
			return "";
		}else {
			return type;
		}
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getOrder() {
		if(order == null || order.length() < 1) {
			return "''";
		}else {
			return order;
		}
	}
	
	public void setOrder(String order) {
		this.order = order;
	}
	
}
