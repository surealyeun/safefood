package com.ssafy.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ssafy.service.BoardService;
import com.ssafy.service.BoardServiceImpl;
import com.ssafy.vo.PageBean;



public class listBoard implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			System.out.println("hey");
			// 파라미터 추출
			String key = request.getParameter("key");
			String word = request.getParameter("word");
			String pageNo = request.getParameter("pageNumber");

			PageBean bean = new PageBean(key, word, pageNo);
			BoardService boardService = new BoardServiceImpl();
			// 모델 연결
			Map<String, Object> result = boardService.searchAll(bean);

			// JSON 문자열 형태로 변환 후 전달
			Gson gson = new Gson();
			System.out.println(gson.toJson(result));
			return gson.toJson(result); // { ...... } -->
		
	}

}
