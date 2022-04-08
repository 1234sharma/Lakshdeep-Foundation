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

	public void sendEmail(String to,int otp) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(to);
		msg.setSubject("Testing from Spring Boot");
		msg.setText("Hello World \n Spring Boot Email" +otp);
		javaMailSender.send(msg);

	}

}
