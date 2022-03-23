package com.lakshdeep.serviceImp;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lakshdeep.model.UserRegistrationDetails;
import com.lakshdeep.repository.UserRegisterDetailsDao;
import com.lakshdeep.service.UserService;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserRegisterDetailsDao userdao;

	@Override
	public UserRegistrationDetails adduserDetails(UserRegistrationDetails ud) {

		UserRegistrationDetails userdetail = userdao.save(ud);

		return userdetail;
	}

	@Override
	public UserRegistrationDetails getUserByUserName(String username) {
		// TODO Auto-generated method stub
		Optional<UserRegistrationDetails> op = userdao.findById(username);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}

	@Override
	public UserRegistrationDetails userLogin(UserRegistrationDetails ur) {
		// TODO Auto-generated method stub
		Optional<UserRegistrationDetails> op = userdao.findById(ur.getUname());
		if(op.isPresent())
		{
			if(ur.getPassword().equals(op.get().getPassword()))
			{
				return op.get();
			}
		}

		return null;
	}

}
