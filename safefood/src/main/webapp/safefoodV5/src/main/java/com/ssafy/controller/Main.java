package com.ssafy.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.vo.Food;

public class Main implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FoodService foodservice = FoodServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		session.setAttribute("quantity", foodservice.searchQuantity((String)session.getAttribute("IsLogin")));
		List<Food> foods = foodservice.QuantityList();
		Collections.sort(foods, new Comparator<Food>() {
			@Override
			public int compare(Food o1, Food o2) {
				return (o1.getTotal()-o2.getTotal())*(-1);
			}
		});
		
		session.setAttribute("quantityList", foods);
		
		return "redirect:main.jsp";
	}
}
