package com.lakshdeep.serviceImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lakshdeep.model.QuestionAnswer;
import com.lakshdeep.repository.QuestionanswerDao;
import com.lakshdeep.service.QuestionAnswerService;

@Service
public class QuestionAnswerServiceImp implements QuestionAnswerService {
	@Autowired
	QuestionanswerDao dao;

	@Override
	public QuestionAnswer addQuestion(QuestionAnswer qa) {
		// TODO Auto-generated method stub
		try {
			QuestionAnswer qa1 = dao.save(qa);
			if (qa1 == null) {
				return null;
			}
			return qa1;

		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	}

	@Override
	public List<QuestionAnswer> getAllQuestion() {
		// TODO Auto-generated method stub

		List<QuestionAnswer> qa =  dao.findAll();

		return qa;
	}
	
	
	@Override
	public String deletequestion(int id) {
	
		try
		{
			dao.deleteById(id);
		}catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
		return "pass";
	}
}
