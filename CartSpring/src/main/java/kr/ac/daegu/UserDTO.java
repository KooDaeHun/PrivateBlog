package kr.ac.daegu;

import java.io.Serializable;
import java.util.Date;

public class UserDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String user_id;
	private String user_name;
	private String password;
	private String postcode;
	private String address;
	private String email;
	private String job;
	private String birthday;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", postcode="
				+ postcode + ", address=" + address + ", email=" + email + ", job=" + job + ", birthday=" + birthday
				+ "]";
	}

	public UserDTO(String user_id, String user_name, String password, String postcode, String address, String email,
			String job, String birthday) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.postcode = postcode;
		this.address = address;
		this.email = email;
		this.job = job;
		this.birthday = birthday;
	}

}
