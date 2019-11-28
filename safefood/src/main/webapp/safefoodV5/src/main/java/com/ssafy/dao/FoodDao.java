package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public interface FoodDao {
	public int foodCount(SqlSession session, FoodPageBean bean);
	public List<Food> searchAll(SqlSession session, FoodPageBean  bean);
	public Food search(SqlSession session, int code);
	public Food search(SqlSession session, String name);
	public List<Food> searchBest(SqlSession session);
	public List<Food> searchBestIndex(SqlSession session);
	public List<Food> searchQuantity(SqlSession session, String id);
	public List<Food> QuantityList(SqlSession session); 
}
