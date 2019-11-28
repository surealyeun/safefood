package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Food;
import com.ssafy.dto.FoodPageBean;

@Repository
public class FoodDaoImpl implements FoodDao {
	@Autowired
	SqlSession session;
	
	List<Food> list;
	
	private String ns = "com.ssafy.dao.FoodMapper.";

	@Override
	public int foodCount(FoodPageBean bean) {
		return -1;
	}

	@Override
	public List<Food> searchAll(FoodPageBean bean) {
		return session.selectList(ns+"searchall", bean);
	}

	@Override
	public Food search(int code) {
		return session.selectOne(ns+"searchcode", code);
	}
	
	@Override
	public Food search(String name) {
		return session.selectOne(ns+"searchname", name);
	}
	
	@Override
	public List<Food> searchBest() {
		return session.selectList(ns+"searchBest");
	}

	@Override
	public List<Food> searchBestIndex() {
		return null;
	}
	
	@Override
	public List<Food> searchQuantity(String id) {
		return session.selectList(ns+"searchQuantity", id);
	}
	
	@Override
	public List<Food> QuantityList() {
		return session.selectList(ns+"quantitylist");
	}

	@Override
	public int countFood(int code) {
		return session.update(ns+"countFood", code);
	}
}
