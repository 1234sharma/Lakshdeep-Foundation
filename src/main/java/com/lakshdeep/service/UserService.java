package com.lakshdeep.service;

import com.lakshdeep.model.UserRegistrationDetails;

public interface UserService {

	public UserRegistrationDetails adduserDetails(UserRegistrationDetails ud);
	
	public UserRegistrationDetails getUserByUserName(String username);
	
	public UserRegistrationDetails userLogin(UserRegistrationDetails ur);
	
	
}
