package com.lakshdeep.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AssesmentHistory {
	
	@Id
	String username;

	String name;
	
	String starttime;
	
	
	

}
