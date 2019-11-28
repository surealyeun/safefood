package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.vo.User;

public interface UserDao {
	public User search(SqlSession session, String id);

	public List<User> searchAll(SqlSession session);

	public void add(SqlSession session, User user);

	public void update(SqlSession session, User user);

	public void remove(SqlSession session, String id);
	
	public int foodQuantity(SqlSession session, String id, int code);
	public void foodUpdate(SqlSession session, String id, int code, int quantity);
	public void foodInsert(SqlSession session, String id, int code, int quantity);
	public int foodQuantityAll(SqlSession session, String id);
	public List<Integer> foodCodesAll(SqlSession session, String id);
}
