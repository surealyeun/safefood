package com.ssafy.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.dto.Board;

@Service
public interface BoardService {
	public Board searchNo(int no); 
	
	public boolean insertBoard(Board board);

	public boolean updateBoard(Board board);

	public boolean deleteBoard(int no);
	
	public List<Board> searchContent(String word);

	public List<Board> searchAll();
}
