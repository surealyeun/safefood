package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;

public class Remove implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("IsLogin");
		
		UserService service = UserServiceImpl.getInstance();
		service.remove(id);
		session.invalidate();
		
		return "redirect:main.jsp";
	}
}
