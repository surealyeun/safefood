package com.ssafy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.UserDao;
import com.ssafy.dto.User;
import com.ssafy.dto.userfood;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public User selectUser(User user) {
		return dao.selectUser(user);
	}

	@Override
	public List<User> selectUserAll() {
		return dao.selectUserAll();
	}

	@Override
	public int updateUser(User user) {
		System.out.println("id = " + user.getId());
		return dao.updateUser(user);
	}

	@Override
	public int removeUser(String id) {
		return dao.removeUser(id);
	}

	@Override
	public int addUser(User user) {
		return dao.addUser(user);
	}

	@Override
	public boolean login(User user) {
		User users = dao.selectUser(user);
		if (users == null) {
			return false;
		} else if (user.getPassword().equals(users.getPassword())) {
			return true;
		} else {
			return false;
		}
	}
	/*
	 * @Override public boolean checkID(String id) { SqlSession session = null; try
	 * { session = batis.getSession(); User user = dao.search(id); if(user == null)
	 * return false; else return true; } catch(RuntimeException e) {
	 * e.printStackTrace(); } finally { session.close(); }
	 * 
	 * return false; }
	 * 
	 * @Override public String findPassword(String id, String email) { SqlSession
	 * session = null; try { session = batis.getSession(); User user =
	 * dao.search(session, id); if(user == null) {
	 * 
	 * } else if(email.equals(user.getEmail())) { return user.getPassword(); } else
	 * {
	 * 
	 * } } catch(RuntimeException e) { e.printStackTrace(); } finally {
	 * session.close(); }
	 * 
	 * return null; }
	 */

	@Override
	public int foodQuantity(String id, int code) {
		return dao.foodQuantity(id, code);
	}

	@Override
	public int foodQuantityAll(String id) {
		return dao.foodQuantityAll(id);
	}

	@Override
	public List<Integer> foodCodesAll(String id) {
		return dao.foodCodesAll(id);
	}

	@Override
	public int foodInsert(String id, int code, int quantity) {
		return dao.foodInsert(id, code, quantity);
	}

	@Override
	public int foodUpdate(String id, int code, int quantity) {
		return dao.foodUpdate(id, code, quantity);
	}

	@Override
	public int foodInsert(String id, int code, int quantity, String mealtime, String date) {
		return dao.foodInsert(id, code, quantity, mealtime, date);
	}

	@Override
	public List<userfood> searchByDate(String id, String date) {
		return dao.searchByDate(id, date);
	}

	@Override
	public int updatepw(String id, String password) {
		return dao.updatepw(id, password);
	}

	@Override
	public List<userfood> searchMonth(String id, int month) {
		return dao.searchMonth(id, month);
	}

	
}
