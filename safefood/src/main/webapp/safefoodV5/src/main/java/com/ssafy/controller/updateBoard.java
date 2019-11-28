package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.BoardService;
import com.ssafy.service.BoardServiceImpl;
import com.ssafy.vo.Board;


public class updateBoard implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		Board board = new Board(Integer.parseInt(no), null, title, null, contents);
		try {
			BoardService boardService = new BoardServiceImpl();
			HttpSession session = request.getSession();
			session.setAttribute("msg", "수정 되었습니다.");
			return "redirect:/listBoard.do";
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "/updateBoardForm.do";
		}
	}

}
