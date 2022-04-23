package com.lakshdeep.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lakshdeep.model.UserRegistrationDetails;
import com.lakshdeep.service.EmailService;
import com.lakshdeep.service.UserService;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

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
		ur.setRole("user");
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

	@GetMapping("/signinpage")
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
		eservice.sendEmail(userdetails.getEmail(), "Verify Your Email with OTP",
				"Please enter the given otp to login succefully " + otp);
		return new ResponseEntity<String>("Loginned succesfully", HttpStatus.OK);
	}

	@RequestMapping(value = "/verifyotp", method = RequestMethod.POST)
	public ResponseEntity<String> verifyotp(HttpServletRequest r) {

		String uname = r.getParameter("uname");
		String psw = r.getParameter("password");
		UserRegistrationDetails user = userservice.getUserByUserName(uname);
		String role = user.getRole();
		String otp = r.getParameter("otp");
		String verotp = String.valueOf(r.getSession().getAttribute("otp"));

		if (otp.equals(verotp)) {
			r.getSession().setAttribute("uname", uname);
			r.getSession().setAttribute("password", psw);
			r.getSession().setAttribute("role", role);

			return new ResponseEntity<String>("Loginned succesfully", HttpStatus.OK);
		}

		return new ResponseEntity<String>("Loginned Unsuccesfully", HttpStatus.BAD_REQUEST);

	}

	@RequestMapping("/donationpage")
	public String donationPage() {
		return "donationpage";
	}

	@RequestMapping(value = "/donationcheckout", method = RequestMethod.POST)
	public ResponseEntity<String> donationCheckout(HttpServletRequest r) throws RazorpayException {

		int amt = Integer.parseInt(r.getParameter("amt"));

		RazorpayClient client = new RazorpayClient("rzp_test_9ax0XALM5hECdE", "WtFeWLmtqDkBoGlrNvAOjKk6");

		JSONObject obj = new JSONObject();
		obj.put("amount", amt * 100);
		obj.put("currency", "INR");
		obj.put("receipt", "txn_" + new Random().nextInt(999999));

		Order order = client.Orders.create(obj);

		System.out.println(order);

		return new ResponseEntity<String>(order.toString(), HttpStatus.OK);
	}

	@RequestMapping("/contactuspage")
	public String contactUsPage() {

		return "contactus";
	}

	@RequestMapping("/contactus")
	public ResponseEntity<String> contactUs(HttpServletRequest r) {

		String name = r.getParameter("name");
		String email = r.getParameter("email");
		String massage = r.getParameter("massage");

		if (name.equals(null) || email.equals(null) || massage.equals(null)) {
			return new ResponseEntity<String>("success", HttpStatus.BAD_REQUEST);
		}
		try {
			eservice.sendEmail("sachinsingh959414@gmail.com", "User wants to connect with you", "User " + name
					+ " wants to contact to you \n name= " + name + "\n email= " + email + " \n massage=  " + massage);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<String>("success", HttpStatus.BAD_REQUEST);
		}

		System.out.println(" " + name + " " + email + " " + massage);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping("/userlistpage")
	public String userlistpage(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("admin")) {
			return "usersignin";
		}


		return "userlistpage";
	}
	
	
	@RequestMapping("/userlist")
	public ResponseEntity<List<UserRegistrationDetails>> getAllUsers(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("admin")) {
			return new ResponseEntity<List<UserRegistrationDetails>>(new ArrayList<>(), HttpStatus.BAD_REQUEST);
		}

		List<UserRegistrationDetails> users = userservice.getAllUsers();

		return new ResponseEntity<List<UserRegistrationDetails>>(users, HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value = "/deleteuser/{username}",method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteuser(@PathVariable("username") String username,HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("admin")) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}

		System.out.println(username);
		String ur = userservice.deleteUserByUsername(username);
		if ((ur.equals("fail"))) {
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}


	@RequestMapping("/scholarshippage")
	public String scholarshippage(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("user")) {
			return "usersignin";
		}
		return "scholarshippage";
	}

	@RequestMapping("/startassesment")
	public String startAssesment(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("user")) {
			return "usersignin";
		}
		
        UserRegistrationDetails user=userservice.getUserByUserName(username);
        
        
		
		
		return "assesmentpage";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest r) {
		r.getSession().removeAttribute("uname");
		r.getSession().removeAttribute("password");
		r.getSession().removeAttribute("role");
		return "welcome";
	}

}
