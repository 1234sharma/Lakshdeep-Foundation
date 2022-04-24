package com.lakshdeep.serviceImp;

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
			if(qa1 == null)
			{
				return null;
			}
			return qa1;
			
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		
	}
}
