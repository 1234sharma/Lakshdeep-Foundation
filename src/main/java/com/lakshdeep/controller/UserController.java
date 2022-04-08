package com.lakshdeep.controller;

import java.util.Collection;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lakshdeep.model.UserRegistrationDetails;
import com.lakshdeep.service.EmailService;
import com.lakshdeep.service.UserService;

import io.swagger.models.HttpMethod;

@Controller
public class UserController {

	@Autowired
	UserService userservice;
	@Autowired
	EmailService eservice;

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
	public ResponseEntity<String> signin(@RequestBody UserRegistrationDetails ur, HttpServletRequest r) {

		System.out.println(ur);

		UserRegistrationDetails userdetails = userservice.userLogin(ur);
		if (userdetails == null) {
			return new ResponseEntity<String>("Login Unsuccesfully Pls check your credentials again",
					HttpStatus.BAD_REQUEST);
		}
		int otp = new Random().nextInt(999999);
		r.getSession().setAttribute("otp", otp);
		eservice.sendEmail(userdetails.getEmail(), otp);
		return new ResponseEntity<String>("Loginned succesfully", HttpStatus.OK);
	}

	@RequestMapping(value = "/verifyotp", method = RequestMethod.POST)
	public ResponseEntity<String> verifyotp(HttpServletRequest r) {

		String uname = r.getParameter("uname");
		String psw = r.getParameter("password");
		String otp = r.getParameter("otp");
		String verotp = String.valueOf(r.getSession().getAttribute("otp"));

		if (otp.equals(verotp)) {
			r.getSession().setAttribute("uname", uname);
			r.getSession().setAttribute("password", psw);

			return new ResponseEntity<String>("Loginned succesfully", HttpStatus.OK);
		}

		return new ResponseEntity<String>("Loginned Unsuccesfully", HttpStatus.BAD_REQUEST);

	}

}
