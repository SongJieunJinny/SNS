package sns.vo;

public class BoardVO {
	private int bno;
	private String title;
	private int hit;
	private String state;
	private String rdate;
	private String content;
	private int uno;
	private String unick;
	private String pname;
	private String fname;
	private int recommend;
	
	public BoardVO() {}

	public BoardVO(int bno, int uno, String title, String content, String rdate, int hit, String state,String unick,String pname,String fname,int recommend ) {
		
		this.bno = bno;
		this.uno = uno;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.hit = hit;
		this.state = state;
		this.unick = unick;
		this.unick = pname;
		this.unick = fname;
		this.recommend= recommend;
	}

	public int getRecommend() {return recommend;}
	public String getPname() {return pname;}
	public String getFname() {return fname;}
	public String getUnick() {return unick;}
	public int getBno() {return bno;}
	public String getTitle() {return title;}
	public int getHit() {return hit;}
	public String getState() {return state;}
	public String getRdate() {return rdate;}
	public String getContent() {return content;}
	public int getUno() {return uno;}
	
	public void setRecommend(int recommend) {this.recommend = recommend;}
	public void setUnick(String unick) {this.unick = unick;}
	public void setBno(int bno) {this.bno = bno;}
	public void setTitle(String title) {this.title = title;}
	public void setHit(int hit) {this.hit = hit;}
	public void setState(String state) {this.state = state;}
	public void setRdate(String rdate) {this.rdate = rdate;}
	public void setContent(String content) {this.content = content;}
	public void setUno(int uno) {this.uno = uno;}
	public void setPname(String pname) {this.pname = pname;}
	public void setFname(String fname) {this.fname = fname;}
		
}