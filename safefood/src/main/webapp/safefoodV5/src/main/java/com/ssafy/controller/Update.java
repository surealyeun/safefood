package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;
import com.ssafy.vo.User;

public class Update implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("inputId");
		String password = request.getParameter("inputPassword");
		String name = request.getParameter("inputName");
		String email = request.getParameter("inputEmail");
		String phone = request.getParameter("inputPhone");
		String address = request.getParameter("inputAddress");
		String allergys[] = request.getParameterValues("inputAllergys");
		
		String allergy = null;
		
		for(int i=0; i<allergys.length; i++) {
			if(i == 0)
				allergy = allergys[0];
			else
				allergy = allergy + ", " + allergys[1];
		}
		
		User user = new User(id, password, name, email, phone, address, allergy);
		
		UserService service = UserServiceImpl.getInstance();
		service.update(user);
		
		System.out.println("update : " + user);
		
		return "redirect:main.jsp";
	}
}
