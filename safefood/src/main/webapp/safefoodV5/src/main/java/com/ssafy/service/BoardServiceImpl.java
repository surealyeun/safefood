package com.ssafy.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import com.ssafy.dao.BoardDao;
import com.ssafy.dao.BoardDaoImpl;
import com.ssafy.dao.DBUtil;
import com.ssafy.vo.Board;
import com.ssafy.vo.BoardException;
import com.ssafy.vo.PageBean;



public class BoardServiceImpl implements BoardService {
	BoardDao dao = new BoardDaoImpl();

	public BoardServiceImpl() {
	}

	public BoardServiceImpl(BoardDao dao) {
		super();
		this.dao = dao;
	}

	public BoardDao getDao() {
		return dao;
	}

	public void setDao(BoardDao dao) {
		this.dao = dao;
	}

	@Override
	public void insertBoard(Board board) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);    //트랜잭션 처리를 위해 자동 커밋이 안된게 설정한다. 
			int no = dao.getBoardNo(con);
			board.setNo(no);
			dao.insertBoard(con, board);
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback(con);
		} finally {
			DBUtil.close(con);
		}
	}

	@Override
	public void updateBoard(Board board) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			dao.updateBoard(con, board);
			con.commit();
		} catch (SQLException e) {
			DBUtil.rollback(con);
		} finally {
			DBUtil.close(con);
		}
	}

	@Override
	public void deleteBoard(String no) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			dao.deleteBoard(con, no);
			con.commit();
		} catch (SQLException e) {
			DBUtil.rollback(con);
		} finally {
			DBUtil.close(con);
		}
	}

	@Override
	public Board search(String no) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			return dao.search(con, no);
		} catch (SQLException e) {
			throw new BoardException("게시물 검색 중 오류 발생");
		} finally {
			DBUtil.close(con);
		}
	}

	@Override
	public Map<String, Object> searchAll(PageBean bean) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			return dao.searchAll(con, bean);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BoardException("게시물 검색 중 오류 발생");
		} finally {
			DBUtil.close(con);
		}
	}

}
