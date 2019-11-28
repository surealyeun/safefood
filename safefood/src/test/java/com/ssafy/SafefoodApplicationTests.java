package com.ssafy;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.dto.Board;
import com.ssafy.service.BoardService;
import com.ssafy.service.FoodService;
import com.ssafy.service.UserService;

@SpringBootTest
class SafefoodApplicationTests {
	@Autowired
	UserService user;
	@Autowired
	FoodService food;
	@Autowired
	BoardService b;

	@Test
	void board() {
		List<Board> books = b.searchAll();
		for (int i = 0; i < books.size(); i++) {
			System.out.println(books.get(i).toString());
		}
	}
	

	@Test
	void count() {
		int re = food.countFood(3);
		re = food.countFood(10);
	}
	
	@Test
	void foodinsertTest() {
		int re = user.foodInsert("ssafy", 10, 1, "아침", "2019-11-20");
		System.out.println("insert: "+re);
		int q = user.foodQuantity("ssafy", 1);
		System.out.println("ssafy, code:1 = "+q);
	}
	
}
