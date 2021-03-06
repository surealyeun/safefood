package com.ssafy.service;

import java.util.List;
import java.util.Map;

import com.ssafy.dto.User;
import com.ssafy.dto.userfood;

public interface UserService {
	public User selectUser(User user);

	public List<User> selectUserAll();

	public int updateUser(User user);

	public int removeUser(String id);

	public int addUser(User user);

	public boolean login(User user);
	
	public int foodQuantity(String id, int code);
	
	public int foodQuantityAll(String id);
	
	public List<Integer> foodCodesAll(String id);
	
	public int foodInsert(String id, int code, int quantity);
	
	public int foodUpdate(String id, int code, int quantity);
	
	public int foodInsert(String id, int code, int quantity, String mealtime, String date);
	
	public List<userfood> searchByDate(String id, String date);
	
	public int updatepw(String id, String password);
	
	public List<userfood> searchMonth(String id, int month);
}
