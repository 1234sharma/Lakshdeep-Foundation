package com.lakshdeep.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public ModelAndView wel() {

		return new ModelAndView("welcome");
	}

	@RequestMapping(value = "/yes", method = RequestMethod.GET)
	public String yes() {
		System.out.println("yessssss");
		return "welcome";
	}
}
