package com.ssafy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.vo.User;

public class UserDaoImpl implements UserDao{
	private String ns = "safefood.usermapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public User search(SqlSession session, String id) {
		String stmt = ns + "select";
		return session.selectOne(stmt, id);
	}

	@Override
	public List<User> searchAll(SqlSession session) {
		String stmt = ns + "selectAll";
		return session.selectList(stmt);
	}

	@Override
	public void update(SqlSession session, User user) {
		String stmt = ns + "update";
		System.out.println("daoimpl : " + user);
		int result = session.update(stmt, user);
		System.out.println("result : " + result);
	}


	@Override
	public void remove(SqlSession session, String id) {
		String stmt = ns + "delete";
		session.delete(stmt, id);
	}

	@Override
	public void add(SqlSession session, User user) {
		String stmt = ns + "insert";
		session.insert(stmt, user);
	}

	@Override
	public int foodQuantity(SqlSession session, String id, int code) {
		try {
			String stmt = ns + "foodsize";
			map.clear();
			map.put("id", id);
			map.put("code", code);
			return session.selectOne(stmt, map);
		} catch(NullPointerException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public void foodUpdate(SqlSession session, String id, int code, int quantity) {
		String stmt = ns + "foodupdate";
		map.clear();
		map.put("id", id);
		map.put("code", code);
		map.put("quantity", quantity);
		session.update(stmt, map);
	}

	@Override
	public void foodInsert(SqlSession session, String id, int code, int quantity) {
		String stmt = ns + "foodinsert";
		map.clear();
		map.put("id", id);
		map.put("code", code);
		map.put("quantity", quantity);
		session.insert(stmt, map);
	}

	@Override
	public int foodQuantityAll(SqlSession session, String id) {
		String stmt = ns + "foodQuantityAll";
		return session.selectOne(stmt, id);
	}
	
	@Override
	public List<Integer> foodCodesAll(SqlSession session, String id) {
		String stmt = ns + "foodscodeAll";
		return session.selectList(stmt, id);
	}
}
