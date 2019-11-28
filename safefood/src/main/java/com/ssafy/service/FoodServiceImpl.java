package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.FoodDao;
import com.ssafy.dto.Food;
import com.ssafy.dto.FoodPageBean;

@Service
public class FoodServiceImpl implements FoodService {
	private String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
			"계란흰자" };

	@Autowired
	FoodDao dao;
	
	@Override
	public List<Food> searchAll(FoodPageBean bean) {
		return dao.searchAll(bean);
	}

	@Override
	public Food search(int code) {
		return dao.search(code);
	}
	
	@Override
	public Food search(String name) {
		Food food = dao.search(name);

		String material = food.getMaterial();
		String allergy = food.getAllergy();
		String result = "";

		if (allergy == null)
			allergy = "";

		for (int i = 0; i < allergys.length; i++) {
			if (material.contains(allergys[i]) && !allergy.contains(allergys[i])) {
				result = result + allergys[i] + ",";
			}
		}
		return food;
	}

	@Override
	public List<Food> searchBest() {
		return dao.searchBest();
	}

	@Override
	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}
	
	@Override
	public List<Food> searchQuantity(String id) {
		return dao.searchQuantity(id);
	}
	
	@Override
	public List<Food> QuantityList() {
		return dao.QuantityList();
	}

	@Override
	public int countFood(int code) {
		return dao.countFood(code);
	}
}
