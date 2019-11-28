package com.ssafy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodServiceImpl implements FoodService {
	private FoodDao dao;
	private String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
			"계란흰자" };

	private FoodServiceImpl() {
		dao = FoodDaoImpl.getInstance();
	}
	private static FoodServiceImpl service = new FoodServiceImpl();
	public static FoodServiceImpl getInstance() {
		return service;
	}
	
	private MyBatisUtil batis = MyBatisUtil.getInstance();

	public List<Food> searchAll(FoodPageBean bean) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.searchAll(session, bean);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	public Food search(int code) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			System.out.println("foodserviceimpl : " + code);
			Food food = dao.search(session, code);
			return food;
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
	
	public Food search(String name) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			Food food = dao.search(session, name);
			
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
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	public List<Food> searchBest() {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.searchBest(session);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	public List<Food> searchBestIndex() {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.searchBestIndex(session);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
	
	public List<Food> searchQuantity(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.searchQuantity(session, id);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}
	
	@Override
	public List<Food> QuantityList() {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.QuantityList(session);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}
}
