package semi.fishing.model.vo;

import java.util.List;

import semi.fish.model.vo.Fish;

public class Fishing {
	private int no;  // 주 키
	private String name; // 이름
	private String type; // 유형
	private String addr1; // 주소 1
	private String addr2;  // 주소 2
	private String latitude;  // 위도 
	private String longitude;  // 경도 
	private int readCount;  // 조회수
	private List<Fish> fishes;  // 잡히는 어종
	private List<Review> reviews; // 리뷰 
	
	public Fishing() {
		super();
	}

	public Fishing(int no, String name, String type, String addr1, String addr2, String latitude, String longitude,
			int readCount, List<Fish> fishes, List<Review> reviews) {
		super();
		this.no = no;
		this.name = name;
		this.type = type;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.latitude = latitude;
		this.longitude = longitude;
		this.readCount = readCount;
		this.fishes = fishes;
		this.reviews = reviews;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public List<Fish> getFishes() {
		return fishes;
	}

	public void setFishes(List<Fish> fishes) {
		this.fishes = fishes;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		return "Fishing [no=" + no + ", name=" + name + ", type=" + type + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", readCount=" + readCount + ", fishes="
				+ fishes + ", reviews=" + reviews + "]";
	}
}
