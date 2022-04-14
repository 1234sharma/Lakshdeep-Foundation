package com.lakshdeep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.lakshdeep.service.EmailService;

@Controller
public class TestController {
	@Autowired
	EmailService es;

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public ModelAndView wel() {

		return new ModelAndView("welcome");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String yes() {
		System.out.println("yessssss");
		return "welcome";
	}

	/*@RequestMapping(value = "/sendemail", method = RequestMethod.GET)
	public String senemailTest() {
		System.out.println("yessssss");
		// es.sendEmail();
		return "/common/navbar";
	}
*/
}
