package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Board;
import com.ssafy.dto.PageBean;



public interface BoardDao {

	public boolean insertBoard(Board board);

	public List<Board> searchContent(String word);
	
	public int count(PageBean bean);

	public boolean updateBoard(Board board);
	
	public boolean deleteBoard(int no);

	public List<Board> searchAll();

	public Board searchNo(int no);
}
