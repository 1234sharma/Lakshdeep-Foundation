package com.lakshdeep.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lakshdeep.model.QuestionAnswer;

@Repository
public interface QuestionanswerDao extends JpaRepository<QuestionAnswer,String> {

}
