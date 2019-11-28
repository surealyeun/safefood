package com.ssafy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;
import com.ssafy.vo.Food;

public class intakeData implements Controller{
	private List<Integer> codes;
	private List<Food> foods;
	private List<Food> foodsCal;
	private List<Integer> quantities;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		double supportpereat=0, calory=0, carbo=0, protein=0,fat=0, sugar=0, natrium=0, chole=0, fattyacid=0, transfat=0;
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("IsLogin");
		
		UserService userservice = UserServiceImpl.getInstance();
		FoodService service = FoodServiceImpl.getInstance();
		
		codes = new ArrayList<>();
		foods = new ArrayList<>();
		foodsCal = new ArrayList<>();
		quantities = new ArrayList<>();
		
		codes=userservice.foodCodesAll(id);
		
		for(int i=0; i<codes.size(); i++) {
			foods.add(service.search(codes.get(i)));
		}
		for(int i=0; i<foods.size(); i++){
			int quantity = userservice.foodQuantity(id, foods.get(i).getCode());
			quantities.add(quantity);
			Food food = new Food();
			food.setCode(foods.get(i).getCode());
			food.setName(foods.get(i).getName());
			food.setSupportpereat(foods.get(i).getSupportpereat()*quantity);
			supportpereat += foods.get(i).getSupportpereat()*quantity;
			food.setCalory(foods.get(i).getCalory()*quantity);
			calory +=foods.get(i).getCalory()*quantity;
			food.setCarbo(foods.get(i).getCarbo()*quantity);
			carbo += foods.get(i).getCarbo()*quantity;
			food.setProtein(foods.get(i).getProtein()*quantity);
			protein +=foods.get(i).getProtein()*quantity;
			food.setFat(foods.get(i).getFat()*quantity);
			fat +=foods.get(i).getFat()*quantity;
			food.setSugar(foods.get(i).getSugar()*quantity);
			sugar += foods.get(i).getSugar()*quantity;
			food.setNatrium(foods.get(i).getNatrium()*quantity);
			natrium +=foods.get(i).getNatrium()*quantity;
			food.setChole(foods.get(i).getChole()*quantity);
			chole += foods.get(i).getChole()*quantity;
			food.setTransfat(foods.get(i).getTransfat()*quantity);
			fattyacid += foods.get(i).getFattyacid()*quantity;
			food.setTransfat(foods.get(i).getFattyacid()*quantity);
			transfat += foods.get(i).getTransfat()*quantity;
			foodsCal.add(food);
		}
		
		int quantityAll = userservice.foodQuantityAll(id);
		
		codes = userservice.foodCodesAll(id);
		System.out.println("quantityAll = "+quantityAll);
		System.out.println("foodCodesAll = "+codes);
		
		session.setAttribute("foods", foods);
		session.setAttribute("foodsCal", foodsCal);
		session.setAttribute("quantityAll", quantityAll);
		session.setAttribute("supportpereat", supportpereat);	
		session.setAttribute("calory", calory);
		session.setAttribute("carbo", carbo);
		session.setAttribute("protein", protein);
		session.setAttribute("fat", fat);
		session.setAttribute("sugar", sugar);
		session.setAttribute("natrium", natrium);
		session.setAttribute("chole", chole);
		session.setAttribute("fattyacid", fattyacid);
		session.setAttribute("transfat", transfat);		
		session.setAttribute("quantities", quantities);
		
		return "redirect:intakeData.jsp";
	}

}
