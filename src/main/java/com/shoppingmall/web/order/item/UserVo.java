package com.shoppingmall.web.order.item;

import java.security.Timestamp;

public class UserVo {

	private Long usernum;
	private String userid;
	private String userpassword;
	private String username;
	private String userphone;
	private String userbirth;
	private String useraddress;
	private String usernickname;
	private String userlevel;
	private Timestamp userregdate;
	
	public Long getUsernum() {
		return usernum;
	}
	public void setUsernum(Long usernum) {
		this.usernum = usernum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	public String getUseraddress() {
		return useraddress;
	}
	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}
	public String getUsernickname() {
		return usernickname;
	}
	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}
	public String getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}
	public Timestamp getUserregdate() {
		return userregdate;
	}
	public void setUserregdate(Timestamp userregdate) {
		this.userregdate = userregdate;
	}
}
