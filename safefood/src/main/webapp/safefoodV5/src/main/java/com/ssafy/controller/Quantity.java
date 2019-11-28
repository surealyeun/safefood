package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;

public class Quantity implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int code = Integer.valueOf(request.getParameter("code"));
		int number = Integer.valueOf(request.getParameter("number"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("IsLogin");
		
		UserService service = UserServiceImpl.getInstance();
		int quantity = service.foodQuantity(id, code);
		if(quantity == -1) {
			service.foodInsert(id, code, number);
		} else {
			service.foodUpdate(id, code, number);
		}
		
		return "redirect:detail.jsp";
	}
}
