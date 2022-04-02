package semi.fish.model.vo;

public class Fish {
	private int no;
	private String name;
	private String type; 
	private String intro;
	private String detail;
	private String range; 
	
	public Fish(int no, String name, String type, String intro, String detail, String range) {
		this.no = no;
		this.name = name;
		this.type = type;
		this.intro = intro;
		this.detail = detail;
		this.range = range;
	}

	public Fish() {
		
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Fish [no=" + no + ", name=" + name + ", type=" + type + ", intro=" + intro + ", detail=" + detail
				+ ", range=" + range + "]";
	}
	
}
