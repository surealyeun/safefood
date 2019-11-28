package com.ssafy.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Food;
import com.ssafy.dto.User;
import com.ssafy.dto.userfood;

@Repository
public class UserDaoImpl implements UserDao{
	private String ns = "safefood.usermapper.";
	
	@Autowired
	SqlSession session;
	
	@Override
	public User selectUser(User user) {		// search
		return session.selectOne(ns + "selectUser", user.getId());
	}
	
	@Override
	public List<User> selectUserAll() {
		return session.selectList(ns+"selectAll");
	}

	@Override
	public int updateUser(User user) {
		return session.update(ns+"updateUser",user);
	}


	@Override
	public int removeUser(String id) {
		return session.delete(ns+"removeUser",id);
	}

	@Override
	public int addUser(User user) {
		return session.insert(ns+"addUser",user);
	}

	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public int foodQuantity(String id, int code) {
		map.clear();
		map.put("id", id);
		map.put("code", code);
		Integer re = session.selectOne(ns+"foodsize", map);
		System.out.println(re);
		if(re == null) {
			return -1;
		}else return re;
	}

	@Override
	public int foodQuantityAll(String id) {
		Integer res = session.selectOne(ns+"foodQuantityAll", id);
		System.out.println("!!!"+res);
		if(res != null) return res;
		else return -1;
	}

	@Override
	public List<Integer> foodCodesAll(String id) {
		return session.selectList(ns+"foodscodeAll", id);
	}

	@Override
	public int foodInsert(String id, int code, int quantity) {
		map.clear();
		map.put("id", id);
		map.put("code", code);
		map.put("quantity", quantity);
		return session.insert(ns+"foodInsert", map);
	}

	@Override
	public int foodUpdate(String id, int code, int quantity) {
		map.clear();
		map.put("id", id);
		map.put("code", code);
		map.put("quantity", quantity);
		return session.update(ns + "foodUpdate", map);
	}

	@Override
	public int foodInsert(String id, int code, int quantity, String mealtime, String date) {
		map.clear();
		map.put("id", id);
		map.put("code", code);
		map.put("quantity", quantity);
		map.put("mealtime", mealtime);
		map.put("date", date);
		return session.insert(ns+"foodInsert3", map);
	}

	@Override
	public List<userfood> searchByDate(String id, String date) {
		map.clear();
		map.put("id", id);
		map.put("date", date);
		return session.selectList(ns+"searchByDate", map);
	}

	@Override
	public int updatepw(String id, String password) {
		map.clear();
		map.put("id", id);
		map.put("password", password);
		System.out.println("userdao "+password);
		return session.update(ns+"updatepw", map);
	}

	@Override
	public List<userfood> searchMonth(String id, int month) {
		map.clear();
		map.put("id", id);
		map.put("month", month);
		return session.selectList(ns+"searchMonth", map);
	}

	
}
