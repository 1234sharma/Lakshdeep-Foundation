package com.lakshdeep.service;

import java.util.ArrayList;
import java.util.List;

import com.lakshdeep.model.QuestionAnswer;

public interface QuestionAnswerService {

	public QuestionAnswer addQuestion(QuestionAnswer qa);
	
	public List<QuestionAnswer> getAllQuestion();
	
	public String deletequestion(int id);
}
