package com.lakshdeep.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AssesmentHistory {
	
	@Id
	String username;

	String name;
	
	String starttime;

	
	public AssesmentHistory() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AssesmentHistory(String username, String name, String starttime) {
		this.username = username;
		this.name = name;
		this.starttime = starttime;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getStarttime() {
		return starttime;
	}


	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}


	@Override
	public String toString() {
		return "AssesmentHistory [username=" + username + ", name=" + name + ", starttime=" + starttime + "]";
	}
	
	
	
	
	
	

}
