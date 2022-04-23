package com.lakshdeep.service;

import com.lakshdeep.model.AssesmentHistory;

public interface AssesmentHistoryService {
	
	public AssesmentHistory getassesmentHistoryByUsername(String username);
	
	public AssesmentHistory saveAssesmentHistory(AssesmentHistory h);

}
