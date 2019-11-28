package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Food;
import com.ssafy.dto.FoodPageBean;

public interface FoodService {
	public List<Food> searchAll(FoodPageBean bean);
	public Food search(int code);
	public Food search(String name);
	public List<Food> searchBest();
	public List<Food> searchBestIndex();
	public List<Food> searchQuantity(String id);
	public List<Food> QuantityList();
	public int countFood(int code);
}
