package com.lakshdeep.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lakshdeep.model.ExamScore;
import com.lakshdeep.model.QuestionAnswer;
import com.lakshdeep.model.UserRegistrationDetails;
import com.lakshdeep.service.ExamScoreService;
import com.lakshdeep.service.QuestionAnswerService;


@Controller
public class AdminController {

	@Autowired
	QuestionAnswerService qas;

	@Autowired
	ExamScoreService examscore;

	@RequestMapping(value = "/addQuestion", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> addQuestion(@RequestBody QuestionAnswer ur, HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("admin")) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		ur.setQuestionno(0);
		System.out.println(ur);
		QuestionAnswer qa1 = qas.addQuestion(ur);

		if (qa1 == null) {
			return new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>("pass", HttpStatus.OK);

	}

	@RequestMapping(value = "/addQuestionForm", method = RequestMethod.GET)
	public String addQuestionForm(HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("admin")) {
			return "usersignin";
		}
		System.out.println("yessssss");
		return "adminquestionform";
	}

	@RequestMapping("/questionlist")
	public ResponseEntity<List<QuestionAnswer>> getAllUsers(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null) {
			return new ResponseEntity<List<QuestionAnswer>>(new ArrayList<>(), HttpStatus.BAD_REQUEST);
		}

		List<QuestionAnswer> que = qas.getAllQuestion();

		return new ResponseEntity<List<QuestionAnswer>>(que, HttpStatus.OK);
	}

	@RequestMapping(value = "/deletequestion/{questionno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteuser(@PathVariable("questionno") int questionno, HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("admin")) {
			return new ResponseEntity<String>("usersignin", HttpStatus.BAD_REQUEST);
		}

		System.out.println(" question  " + questionno);
		String ur = qas.deletequestion(questionno);
		if ((ur.equals("fail"))) {
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/submitscore", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> addQuestion(@RequestBody ExamScore es, HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("user")) {
			return new ResponseEntity<String>("usersignin", HttpStatus.BAD_REQUEST);
		}
		es.setUsername(uname);
		es.setDate(new Date().toLocaleString());
		ExamScore sc = examscore.addscore(es);
		if (sc == null) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>("pass", HttpStatus.OK);

	}
	
	@RequestMapping("/examresultpage")
	public String userlistpage(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("admin")) {
			return "usersignin";
		}

		return "examresultpage";
	}
	
	@RequestMapping("/examresultlist")
	public ResponseEntity<List<ExamScore>> getExamResult(HttpServletRequest r) {
		String username = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (username.equals("") || username == null || !role.equals("admin")) {
			return new ResponseEntity<List<ExamScore>>(new ArrayList<>(), HttpStatus.BAD_REQUEST);
		}

		List<ExamScore> result = examscore.getexamscores();

		return new ResponseEntity<List<ExamScore>>(result, HttpStatus.OK);
	}

	
	@RequestMapping(value = "/deleteresult/{username}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteuser(@PathVariable("username") String username, HttpServletRequest r) {

		String uname = String.valueOf(r.getSession().getAttribute("uname"));
		String role = String.valueOf(r.getSession().getAttribute("role"));
		if (uname.equals("") || uname == null || !role.equals("admin")) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}

		System.out.println(username);
		String ur = examscore.deleteresult(username);
		if ((ur.equals("fail"))) {
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	

}
