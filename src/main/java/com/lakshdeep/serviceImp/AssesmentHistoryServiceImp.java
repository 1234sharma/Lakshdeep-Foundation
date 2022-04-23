package com.lakshdeep.serviceImp;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lakshdeep.model.AssesmentHistory;
import com.lakshdeep.repository.AssesmenthistoryDao;
import com.lakshdeep.service.AssesmentHistoryService;

@Service
public class AssesmentHistoryServiceImp implements AssesmentHistoryService {

	@Autowired
	AssesmenthistoryDao dao;
	
	@Override
	public AssesmentHistory getassesmentHistoryByUsername(String username) {
	Optional<AssesmentHistory> attempt=	dao.findById(username);
	
	if(attempt.isPresent())
	{
		System.out.println("in");
		return attempt.get();
	}
		return null;
	}
	
	
	@Override
	public AssesmentHistory saveAssesmentHistory(AssesmentHistory h) {
		 
		AssesmentHistory ah= dao.save(h);
		return ah;
	}
}
