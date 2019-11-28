package com.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.service.BoardService;
import com.ssafy.service.BoardServiceImpl;

public class deleteBoard implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String no = request.getParameter("no");
		BoardService boardService = new BoardServiceImpl();
		boardService.deleteBoard(no);
		return "redirect:/listBoard.do";
	}

}
