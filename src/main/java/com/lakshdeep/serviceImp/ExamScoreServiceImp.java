package com.lakshdeep.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lakshdeep.model.ExamScore;
import com.lakshdeep.repository.ExamScoreDao;
import com.lakshdeep.service.ExamScoreService;

@Service
public class ExamScoreServiceImp implements ExamScoreService {

	@Autowired
	ExamScoreDao dao;

	@Override
	public ExamScore addscore(ExamScore es) {
		ExamScore score=null;
		try {
			score = dao.save(es);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		return score;
	}
	
	@Override
	public List<ExamScore> getexamscores() {
		// TODO Auto-generated method stub
		List<ExamScore> list;
		try
		{
		list=	dao.findAll();
		}catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		return  list;
	}
	
	@Override
	public String deleteresult(String uname) {
		// TODO Auto-generated method stub
		try
		{
		dao.deleteById(uname);
		}catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
		return "pass" ;
	}
}
