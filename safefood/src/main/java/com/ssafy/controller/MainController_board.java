package com.ssafy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Board;
import com.ssafy.dto.User;
import com.ssafy.help.BoolResult;
import com.ssafy.help.NumberResult;
import com.ssafy.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@RestController
@CrossOrigin({"*"})
@RequestMapping("/api")
@Slf4j	// lombok
public class MainController_board {
	static List<Board> boards = null;	

	@Autowired
	BoardService boardservice;
	
	@PostMapping("/getId")
	public ResponseEntity<Object> getId(HttpSession session){
		try {
			if(session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			System.out.println("user 가져와 "+user.toString());
			return new ResponseEntity<Object>(user, HttpStatus.OK);
			}else {
				return new ResponseEntity<Object>("", HttpStatus.OK);
			}
		} catch (RuntimeException e) {
			log.error("getId error !", e);
			throw e;
		}
	}
	
	@PostMapping("/searchNo/{no}")
	public ResponseEntity<Object> searchNo(@PathVariable int no){
		try {
			Board board = boardservice.searchNo(no);
			return new ResponseEntity<Object>(board, HttpStatus.OK);
		} catch (RuntimeException e) {
			log.error("searchNo error !", e);
			throw e;
		}		
	}

	
	@PostMapping("/searchAll")
	public ResponseEntity<Object> searchAll(){
		try {
			boards = boardservice.searchAll();
			return new ResponseEntity<Object>(boards, HttpStatus.OK);
		} catch (RuntimeException e) {
			log.error("searchAll error !", e);
			throw e;
		}
	}

	@PutMapping("/updateBoard")
	public ResponseEntity<Object> updateBoard(@RequestBody Board board){
		try {
			boolean result=boardservice.updateBoard(board);
			BoolResult br = null;
			if(result) {
				br = new BoolResult("updateBoard", true, "SUCCESS");
			} else {
				br = new BoolResult("updateBoard", false, "FAIL");
			}
			return new ResponseEntity<Object>(br, HttpStatus.OK);
		}catch(RuntimeException e) {
			throw e;
		}
	}

	@PostMapping("/insertBoard")
	public ResponseEntity<Object> insertBoard(@RequestBody Board board){
		try {
			boolean result=boardservice.insertBoard(board);
			NumberResult br = null;
			if(result) {
				br = new NumberResult("insertBoard", board.getNo(), "SUCCESS");
			} else {
				br = new NumberResult("insertBoard", -1, "FAIL");
			}
			return new ResponseEntity<Object>(br, HttpStatus.OK);
		}catch(RuntimeException e) {
			throw e;
		}
	}
	
	@DeleteMapping("/deleteBoard/{no}")
	public ResponseEntity<Object> deleteBoard(@PathVariable int no) {
		try {
			boolean result = boardservice.deleteBoard(no);
			BoolResult br = null;
			if(result) {
				br = new BoolResult("deleteBoard", true, "SUCCESS");
			} else {
				br = new BoolResult("deleteBoard", false, "FAIL");
			}
			return new ResponseEntity<Object>(br, HttpStatus.OK);
		} catch(RuntimeException e) {
			log.error("deleteBoard error!", e);
			throw e;
		}
	}

	
	@PostMapping("/searchContent/{word}")
	public ResponseEntity<Object> searchContent(@PathVariable String word){
		try {
			System.out.println("검색어: "+word);
			boards = boardservice.searchContent(word);
			return new ResponseEntity<Object>(boards, HttpStatus.OK);
		} catch (RuntimeException e) {
			log.error("searchContent error !", e);
			throw e;
		}		
	}
}
