package com.ssafy.service;

import java.util.List;

import com.ssafy.vo.User;

public interface UserService {
	public User search(String id);
	public List<User> searchAll();
	public boolean login(String id, String pw);
	public boolean checkID(String id);
	public void add(User user);
	public void update(User user);
	public void remove(String id);
	public String findPassword(String id, String email);
	
	public int foodQuantity(String id, int code);
	public void foodUpdate(String id, int code, int quantity);
	public void foodInsert(String id, int code, int quantity);
	public int foodQuantityAll(String id);
	public List<Integer> foodCodesAll(String id);
}
