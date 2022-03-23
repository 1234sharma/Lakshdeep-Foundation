package com.lakshdeep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lakshdeep.model.UserRegistrationDetails;
import com.lakshdeep.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userservice;

	@RequestMapping(value = "/signuppage", method = RequestMethod.GET)
	public String signuppage() {
		System.out.println("yessssss");
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> signup(@RequestBody UserRegistrationDetails ur, ModelAndView mv) {

		System.out.println(ur);
		UserRegistrationDetails userdetails = userservice.adduserDetails(ur);
		if (userdetails == null) {

			return new ResponseEntity<String>("success", HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<String>("Registered succesfully", HttpStatus.OK);
	}

	@RequestMapping("/getuserbyusername/{username}")
	public ResponseEntity<String> getUserByUsername(@PathVariable("username") String username) {

		System.out.println(username);
		UserRegistrationDetails ur = userservice.getUserByUserName(username);
		if ((ur == null)) {
			return new ResponseEntity<String>("Fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/signinpage")
	public String signinPage() {

		return "usersignin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> signin(@RequestBody UserRegistrationDetails ur) {

		System.out.println(ur);
		
		UserRegistrationDetails userdetails = userservice.userLogin(ur);
		if(userdetails==null)
		{
			return new ResponseEntity<String>("Login Unsuccesfully Pls check your credentials again", HttpStatus.BAD_REQUEST);
		}
		

		return new ResponseEntity<String>("Loginned succesfully", HttpStatus.OK);
	}

}
