package com.lakshdeep.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lakshdeep.model.UserRegistrationDetails;

@Repository
public interface UserRegisterDetailsDao extends JpaRepository<UserRegistrationDetails,String> {

}
