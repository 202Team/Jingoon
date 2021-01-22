package kr.co.member;

import java.io.Serializable;

public class LoginDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int num; 
	private String id; 
	private String pw; 
	private String name; 
	private String nickname; 
	private String address; 
	private String day;
	private int master;
	
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}

	
	public int getMaster() {
		return master;
	}


	public void setMaster(int master) {
		this.master = master;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
