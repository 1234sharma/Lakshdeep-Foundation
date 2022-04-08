package com.lakshdeep.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "userdetails")
public class UserRegistrationDetails implements Serializable {

	String fname;
	String lname;
	String email;
	String mobileno;
	String addr1;
	String addr2;
	String state;
	String city;
	String pin;

	@Id
	String uname;
	String password;

	public UserRegistrationDetails() {
		// TODO Auto-generated constructor stub
	}

	public UserRegistrationDetails(String fname, String lname, String email, String mobileno, String addr1,
			String addr2, String state, String city, String pin, String uname, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileno = mobileno;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.state = state;
		this.city = city;
		this.pin = pin;
		this.uname = uname;
		this.password = password;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserRegistrationDetails [fname=" + fname + ", lname=" + lname + ", email=" + email + ", mobileno="
				+ mobileno + ", addr1=" + addr1 + ", addr2=" + addr2 + ", state=" + state + ", city=" + city + ", pin="
				+ pin + ", uname=" + uname + ", password=" + password + "]";
	}

}
