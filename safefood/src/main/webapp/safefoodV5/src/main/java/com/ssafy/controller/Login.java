package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;



public class Login implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("inputId");
		String password = request.getParameter("inputPassword");
		
		UserService service = UserServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		if(service.login(id, password)) {
			session.setAttribute("IsLogin", id);
			session.setAttribute("user", service.search(id));
			return "Food.do?action=main";
		} else {
			session.setAttribute("LoginError", "로그인에 실패했습니다.");
			return "login.jsp";
		}
	}
}
