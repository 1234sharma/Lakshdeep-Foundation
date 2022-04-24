package com.lakshdeep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lakshdeep.model.QuestionAnswer;
import com.lakshdeep.service.QuestionAnswerService;
@Controller
public class AdminController {
	
	@Autowired
	QuestionAnswerService qas;
	
	@RequestMapping(value = "/addQuestion", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> addQuestion(@RequestBody QuestionAnswer ur) {

		System.out.println(ur);
		QuestionAnswer qa1 = qas.addQuestion(ur);
		
		if(qa1 == null)
		{
			return new ResponseEntity<String>("Fail",HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>("pass",HttpStatus.OK);

	}
	@RequestMapping(value = "/addQuestionForm", method = RequestMethod.GET)
	public String addQuestionForm() {
		System.out.println("yessssss");
		return "adminquestionform";
	}
}

