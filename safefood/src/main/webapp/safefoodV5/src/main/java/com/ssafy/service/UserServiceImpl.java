package com.ssafy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.UserDao;
import com.ssafy.dao.UserDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.User;


public class UserServiceImpl implements UserService {
	private UserDao dao = new UserDaoImpl();
	private static UserServiceImpl user = new UserServiceImpl();
	public static UserServiceImpl getInstance() {
		return user;
	}
	
	private MyBatisUtil batis = MyBatisUtil.getInstance();
	
	@Override
	public User search(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User user = dao.search(session, id);
			return user;
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public List<User> searchAll() {
		SqlSession session = null;
		try {
			session = batis.getSession();
			List<User> users = dao.searchAll(session);
			return users;
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public boolean login(String id, String pw) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User user = dao.search(session, id);
			if(user == null) {
				return false;
			} else if(pw.equals(user.getPassword())) {
				return true;
			} else {
				return false;
			}
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return false;
	}

	@Override
	public boolean checkID(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User user = dao.search(session, id);
			if(user == null)
				return false;
			else
				return true;
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return false;
	}

	@Override
	public void update(User user) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User find = dao.search(session, user.getId());
			if(find == null) {
				
			} else {
				dao.update(session, user);
				session.commit();
				System.out.println("serviceimpl : " + user);
			}
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public void remove(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User user = dao.search(session, id);
			if(user == null) {
				
			} else {
				dao.remove(session, id);
				session.commit();
			}
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public void add(User user) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User find = dao.search(session, user.getId());
			if(find == null) {
				dao.add(session, user);
				session.commit();
			}
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	


	
	@Override
	public String findPassword(String id, String email) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			User user = dao.search(session, id);
			if(user == null) {
				
			} else if(email.equals(user.getEmail())) {
				return user.getPassword();
			} else {
				
			}
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public int foodQuantity(String id, int code) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			int quantity = dao.foodQuantity(session, id, code);
			return quantity;
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}

	@Override
	public void foodUpdate(String id, int code, int quantity) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			dao.foodUpdate(session, id, code, quantity);
			session.commit();
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public void foodInsert(String id, int code, int quantity) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			dao.foodInsert(session, id, code, quantity);
			session.commit();
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	@Override
	public int foodQuantityAll(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.foodQuantityAll(session, id);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	@Override
	public List<Integer> foodCodesAll(String id) {
		SqlSession session = null;
		try {
			session = batis.getSession();
			return dao.foodCodesAll(session, id);
		} catch(RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
}
