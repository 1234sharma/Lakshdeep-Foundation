package com.lakshdeep.service;

import java.util.List;

import com.lakshdeep.model.ExamScore;

public interface ExamScoreService {

	public ExamScore addscore(ExamScore es);
	
	public List<ExamScore> getexamscores();
	
	public String deleteresult(String uname);
}
