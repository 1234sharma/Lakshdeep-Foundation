package com.lakshdeep.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ExamScore {
	@Id
	String username;
	int marks;
	int outof;
	String date;
	public ExamScore() {
		// TODO Auto-generated constructor stub
	}

	public ExamScore(String username, int marks, int outof,String date) {
		super();
		this.username = username;
		this.marks = marks;
		this.outof = outof;
		this.date=date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public int getOutof() {
		return outof;
	}

	public void setOutof(int outof) {
		this.outof = outof;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ExamScore [username=" + username + ", marks=" + marks + ", outof=" + outof + ", date=" + date + "]";
	}

	
}
