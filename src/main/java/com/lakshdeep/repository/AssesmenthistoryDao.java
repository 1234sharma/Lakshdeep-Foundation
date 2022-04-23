package com.lakshdeep.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lakshdeep.model.AssesmentHistory;

@Repository
public interface AssesmenthistoryDao extends JpaRepository<AssesmentHistory, String> {

}
