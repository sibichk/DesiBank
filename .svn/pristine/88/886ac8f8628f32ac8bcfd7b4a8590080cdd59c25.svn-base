package com.spring.dao.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_login_tbl")
public class Login {
	private String loginid;
	private String name;
    private String password;
	private String role;
	private String locked;

	@Id
	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "Login [loginid=" + loginid + ", name=" + name + ", password="
				+ password + ", role=" + role + ", locked=" + locked + "]";
	}
	

}
