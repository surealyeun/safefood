package com.ssafy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Board;
import com.ssafy.dto.PageBean;


@Repository
public class BoardDaoImpl implements BoardDao {
	
	Map<String, Object> map;
	
	@Autowired
	SqlSession session;
	
	private String ns = "safefood.boardmapper.";
	
	@Override
	public Board searchNo(int no) {
		return session.selectOne(ns+"searchNo",no);
	}

	@Override
	public List<Board> searchAll(){
		return session.selectList(ns+"searchAll");
	}
	
	@Override
	@Transactional
	public boolean insertBoard(Board board)  {
		return session.insert(ns+"insertBoard",board) > 0;

	}

	@Override
	public List<Board> searchContent(String word) {
		return session.selectList(ns+"searchContent",word);
	}

	@Override
	public int count(PageBean bean) {
		return session.selectOne(ns+"count",bean);
	}

	@Override
	@Transactional
	public boolean updateBoard(Board board) {
		return session.update(ns+"updateBoard",board)>0;

	}

	@Override
	@Transactional
	public boolean deleteBoard(int no) {
		return session.delete(ns+"deleteBoard",no) > 0;
	}
}
