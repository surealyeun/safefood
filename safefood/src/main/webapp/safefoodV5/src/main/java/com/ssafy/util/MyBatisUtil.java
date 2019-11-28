package com.ssafy.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	private static MyBatisUtil util = new MyBatisUtil();
	SqlSessionFactory sqlSessionFactory;
	public static MyBatisUtil getInstance() {
		return util;
	}
	private MyBatisUtil() {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
}