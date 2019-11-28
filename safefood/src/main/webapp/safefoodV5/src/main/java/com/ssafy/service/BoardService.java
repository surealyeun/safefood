package com.ssafy.service;

import java.util.Map;

import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;


public interface BoardService {
	public void insertBoard(Board board);

	public void updateBoard(Board board);

	public void deleteBoard(String no);

	public Board search(String no);

	public Map<String, Object> searchAll(PageBean bean);

}
