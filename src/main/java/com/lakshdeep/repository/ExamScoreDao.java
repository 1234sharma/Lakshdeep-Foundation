package com.lakshdeep.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lakshdeep.model.ExamScore;

@Repository
public interface ExamScoreDao extends JpaRepository<ExamScore,String>  {
	

}
