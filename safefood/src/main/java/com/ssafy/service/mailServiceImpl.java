package com.ssafy.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class mailServiceImpl implements mailService{
	
	private static final Logger log = LoggerFactory.getLogger(mailServiceImpl.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			mailSender.send(msg);
			return true;
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}



//
//import javax.mail.Message;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailException;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.stereotype.Component;
//
//@Component
//public class mailService {
//	
//	private static final Logger logger = LoggerFactory.getLogger(mailService.class);
//
//	@Autowired
//	JavaMailSender javaMailSender;
//	
//	String form = "safefoodssafy@gmail.com";
//	
//	public boolean sendMail(String to, String subject, String content)
//	{
//		MimeMessagePreparator preparator = new MimeMessagePreparator()
//		{
//			public void prepare(MimeMessage mimeMessage) throws Exception
//			{
//				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
//				mimeMessage.setFrom(new InternetAddress(form));
//				mimeMessage.setSubject(subject);
//				mimeMessage.setText(content, "utf-8", "html");
//			}
//		};
//
//		try
//		{
//			javaMailSender.send(preparator);
//			return true;
//		}
//		catch (MailException me)
//		{
//			logger.error("MailException", me);
//			return false;
//		}
//	}
//}
