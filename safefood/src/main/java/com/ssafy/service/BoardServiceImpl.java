package com.ssafy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.BoardDao;
import com.ssafy.dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;

	@Override
	public List<Board> searchAll(){
		return dao.searchAll();
	}
	
	@Override
	public boolean insertBoard(Board board) {
		return dao.insertBoard(board);
	}

	@Override
	public boolean updateBoard(Board board) {
		return dao.updateBoard(board);		
	}

	@Override
	public boolean deleteBoard(int no) {
		return dao.deleteBoard(no);		
	}

	@Override
	public List<Board> searchContent(String word) {
		return dao.searchContent(word);		
	}

	@Override
	public Board searchNo(int no) {
		return dao.searchNo(no);		
	}
}
