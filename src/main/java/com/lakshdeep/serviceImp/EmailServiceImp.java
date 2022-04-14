package com.lakshdeep.serviceImp;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lakshdeep.service.EmailService;

@Service
public class EmailServiceImp implements EmailService {

	@Autowired
	JavaMailSender javaMailSender;

	public void sendEmail(String to,String subject,String massage) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(to);
		msg.setSubject(subject);
		msg.setText(massage);
		javaMailSender.send(msg);

	}

}
