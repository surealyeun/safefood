package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.BoardService;
import com.ssafy.service.BoardServiceImpl;
import com.ssafy.vo.Board;


public class insertBoard implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		BoardService boardService = new BoardServiceImpl();
		Board board = new Board(id, title, contents);
		try {
			
			boardService.insertBoard(board);
			HttpSession session = request.getSession();
			session.setAttribute("msg", "게시물이 등록되었습니다.");
			
			return "redirect:/listBoard.do";
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "/insertBoardForm.do";
			
		}
	}

}
