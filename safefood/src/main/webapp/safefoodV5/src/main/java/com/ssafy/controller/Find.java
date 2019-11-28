package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;

public class Find implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("inputId");
        String email = request.getParameter("inputEmail");
        
        UserService service = UserServiceImpl.getInstance();
    
        String password = service.findPassword(id, email);
        
        request.setAttribute("password", password);
        
        return "find.jsp";
	}

}
