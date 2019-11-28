//package com.ssafy.dto;
//
//import java.util.Properties;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//
//@Configuration
//public class mailConfig {
//	String host = "";
//
//	String port = "587";
//
//	String user = "safefood";
//
//	String pass = "ssafy!food";
//
//	@Bean
//	public JavaMailSender getMailSender()
//	{
//		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//		mailSender.setUsername(user);
//		mailSender.setPassword(pass);
//		mailSender.setJavaMailProperties(getMailProperties());
//		return mailSender;
//	}
//
//	private Properties getMailProperties()
//	{
//		Properties properties = new Properties();
//		properties.setProperty("mail.transport.protocol", "smtp");
//		properties.setProperty("mail.smtp.starttls.enable", "true");
//		properties.setProperty("mail.smtp.ssl.trust", host);
//		properties.setProperty("mail.smtp.host", host);
//		properties.setProperty("mail.smtp.auth", "true");
//		properties.setProperty("mail.smtp.port", port);
//		properties.setProperty("mail.smtp.socketFactory.port", port);
//		properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//		return properties;
//	}
//}
