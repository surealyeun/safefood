package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;



public class BoardDaoImpl implements BoardDao {
	@Override
	public int getBoardNo(Connection con) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = " select max(no)+1 as no  from board ";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("no");
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
		}
		return 1;
	}

	@Override
	public void insertBoard(Connection con, Board board) throws SQLException {
		System.out.println(board);
		PreparedStatement stmt = null;
		try {
			String sql = " insert into board(no, id, title, contents)  values(?, ?,?,?) ";
			stmt = con.prepareStatement(sql);
			int idx = 1;
			stmt.setInt(idx++, board.getNo());
			stmt.setString(idx++, board.getId());
			stmt.setString(idx++, board.getTitle());
			stmt.setString(idx++, board.getContents());
			stmt.executeUpdate();
		} finally {
			DBUtil.close(stmt);
		}
	}

	@Override
	public Board search(Connection con, String no) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			StringBuilder sql = new StringBuilder(100);
			sql.append("select no, id, title, contents, date_format(regdate, '%y-%m-%d') as regdate	from board where  no = ?");
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, no);
			rs = stmt.executeQuery();
			Board board = null;
			if (rs.next()) {
				board = new Board(Integer.parseInt(no), rs.getString("id"), rs.getString("title"), rs.getString("regdate"), rs.getString("contents"));
			}
			return board;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
		}
	}

	@Override
	public Map<String, Object> searchAll(Connection con, PageBean bean) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String key = bean.getKey();
			String word = bean.getWord();
			int interval = bean.getInterval();
			int pageNo = bean.getPageNo();
			StringBuilder sql = new StringBuilder(100);
			StringBuilder where = new StringBuilder();
			if (key != null && !key.equals("all") && word != null && !word.trim().equals("")) {
				if (key.equals("id")) {
					where.append(" where id = ? ");
				} else if (key.equals("title")) {
					where.append(" where title like  ? ");
				} else if (key.equals("contents")) {
					where.append(" where contents like  ? ");
				}
			}
			// 검색조건으로 몇개의 데이터가 있는지
			sql.append(" select (select count(*) from board " + where + " ) as total, no, id, title, date_format(regdate, '%Y-%m-%d') as regdate from board   ");
			sql.append(where);
			sql.append(" order by no desc limit ?,? ");
			stmt = con.prepareStatement(sql.toString());
			int idx = 1;
			if (key != null && !key.equals("all") && word != null && !word.trim().equals("")) {
				if (key.equals("id")) {
					stmt.setString(idx++, word);
					stmt.setString(idx++, word);
				} else {
					stmt.setString(idx++, "%" + word + "%");
					stmt.setString(idx++, "%" + word + "%");
				}
			}
			stmt.setInt(idx++, (pageNo - 1) * interval); // 몇 페이지에서
			stmt.setInt(idx++, interval);				// 몇 개
			
			rs = stmt.executeQuery();
			
			Map<String, Object> map = new HashMap<>();
			
			ArrayList<Board> boards = new ArrayList<>(interval);
			map.put("list", boards);
			boolean isFirst = true;
			while (rs.next()) {
				if (isFirst) {
					map.put("totalNumber", rs.getInt("total"));
					isFirst = false;
				}
				boards.add(new Board(rs.getInt("no"), rs.getString("id"), rs.getString("title"), rs.getString("regdate")));
			}
			System.out.println("dao: " + map);
			return map;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
		}
	}

	@Override
	public int count(Connection con, PageBean bean) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String key = bean.getKey();
			String word = bean.getWord();
			StringBuilder sql = new StringBuilder(100);
			sql.append(" select count(*) as cnt from board   ");
			if (key != null && word != null && !word.trim().equals("")) {
				if (key.equals("id")) {
					sql.append(" where id = ? ");
				} else if (key.equals("title")) {
					sql.append(" where title like  ? ");
				} else if (key.equals("contents")) {
					sql.append(" where contents like  ? ");
				}
			}
			stmt = con.prepareStatement(sql.toString());
			int idx = 1;
			if (key != null && word != null && !word.trim().equals("")) {
				if (key.equals("id")) {
					stmt.setString(idx++, word);
				} else {
					stmt.setString(idx++, "%" + word + "%");
				}
			}
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
		}
		return 0;
	}

	@Override
	public void updateBoard(Connection con, Board board) throws SQLException {
		PreparedStatement stmt = null;
		try {
			String sql = " update board set title=?, contents=? where no=? ";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, board.getTitle());
			stmt.setString(2, board.getContents());
			stmt.setInt(3, board.getNo());
			stmt.executeUpdate();
		} finally {
			DBUtil.close(stmt);
		}
	}

	@Override
	public void deleteBoard(Connection con, String no) throws SQLException {
		PreparedStatement stmt = null;
		try {
			String sql = " delete from board where no=? ";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, no);
			stmt.executeUpdate();
		} finally {
			DBUtil.close(stmt);
		}
	}


	

}
