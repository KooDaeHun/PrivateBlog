package kr.ac.pohang;

public class JoinDTO {
	private Integer usernum;
	private String id;
	private String pw;
	private String email;
	private Integer stone;
	
	public JoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getStone() {
		return stone;
	}
	public void setStone(Integer stone) {
		this.stone = stone;
	}
	public Integer getUsernum() {
		return usernum;
	}
	public void setUsernum(Integer usernum) {
		this.usernum = usernum;
	}
	
	
}
