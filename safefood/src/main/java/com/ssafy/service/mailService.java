package com.ssafy.service;

public interface mailService {
	public boolean send(String subject, String text, String from, String to, String filePath);

}
