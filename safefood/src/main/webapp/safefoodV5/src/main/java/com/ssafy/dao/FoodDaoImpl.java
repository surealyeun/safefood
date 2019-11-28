package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodDaoImpl implements FoodDao {
	List<Food> list;
	private static FoodDaoImpl fm = new FoodDaoImpl();
	public static FoodDaoImpl getInstance() {
		return fm;
	}
	private FoodDaoImpl() {}
	
	private String ns = "safefood.foodmapper.";

	public int foodCount(SqlSession session, FoodPageBean bean) {
		return -1;
	}

	public List<Food> searchAll(SqlSession session, FoodPageBean bean) {
		String stmt = ns + "searchall";
		System.out.println("fooddaoimpl : " + bean);
		bean.setWord("%" + bean.getWord() + "%");
		System.out.println("fooddaoimpl : " + bean.getKey() + " : " + bean.getWord());
		list = session.selectList(stmt, bean);
		return list;
	}

	public Food search(SqlSession session, int code) {
		String stmt = ns + "searchcode";
		return session.selectOne(stmt, code);
	}
	
	public Food search(SqlSession session, String name) {
		String stmt = ns + "searchname";
		return session.selectOne(stmt, name);
	}
	
	public List<Food> searchBest(SqlSession session) {
		return null;
	}

	public List<Food> searchBestIndex(SqlSession session) {
		return null;
	}
	
	@Override
	public List<Food> searchQuantity(SqlSession session, String id) {
		String stmt = ns + "searchQuantity";
		list = session.selectList(stmt, id);
		return list;
	}
	
	@Override
	public List<Food> QuantityList(SqlSession session) {
		String stmt = ns + "quantitylist";
		list = session.selectList(stmt);
		return list;
	}
}
