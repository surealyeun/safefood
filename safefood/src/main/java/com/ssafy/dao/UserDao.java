package com.ssafy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dto.Food;
import com.ssafy.dto.User;
import com.ssafy.dto.userfood;

public interface UserDao {
	public User selectUser(User user);

	public List<User> selectUserAll();

	public int updateUser(User user);

	public int removeUser(String id);

	public int addUser(User user);
	
	public int foodQuantity(String id, int code);
	
	public int foodQuantityAll(String id);
	
	public List<Integer> foodCodesAll(String id);
	
	public int foodInsert(String id, int code, int quantity);
	
	public int foodInsert(String id, int code, int quantity, String mealtime, String date);
	
	public int foodUpdate(String id, int code, int quantity);
	
	public List<userfood> searchByDate(String id, String date);
	
	public int updatepw(String id, String password);
	
	public List<userfood> searchMonth(String id, int month);

}
