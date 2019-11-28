package com.ssafy.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;
import com.ssafy.vo.Food;

public class Detail implements Controller {
	static String[] materials = null;

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");

		FoodService service = FoodServiceImpl.getInstance();

		Food food = service.search(name);

		String allergys[] = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
				"계란흰자" };
		String target = food.getMaterial();

		// allergy 배열 Selection Sort
		for (int i = 0; i < allergys.length; i++) {
			int minIndex = i;
			for (int j = i; j < allergys.length; j++) { // i~8
				if (allergys[minIndex].charAt(0) > allergys[j].charAt(0)) { // 최소값의 위치를 찾기
					minIndex = j;
				}
			}

			// i <-> 최소값 교환
			String temp = allergys[i];
			allergys[i] = allergys[minIndex];
			allergys[minIndex] = temp;
		}

		for (int i = 0; i < allergys.length; i++) {
			if (target.contains(allergys[i])) {
				if (food.getAllergy() == null) {
					food.setAllergy(allergys[i]);
				} else {
					food.setAllergy(food.getAllergy() + ", " + allergys[i]);
				}
			}
		}
		
		String mat = food.getMaterial().replaceAll(", ", "&");

		materials = mat.split(",");
		//System.out.println("전 : " + Arrays.toString(materials));
		quickSort(0, materials.length - 1);
		//System.out.println("후 : " + Arrays.toString(materials));

		
		String result = Arrays.toString(materials).replaceAll("&", ", ");
		food.setMaterial(result);
		int code = Integer.valueOf(food.getCode());
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("IsLogin");

		UserService userservice = UserServiceImpl.getInstance();
		int quantity = userservice.foodQuantity(id, code);
		if (quantity == -1) {
			quantity = 0;
		}
		int quantityAll = userservice.foodQuantity(id, code);
		
		System.out.println("quantityAll = "+quantityAll);

		session.setAttribute("food", food);
		session.setAttribute("quantity", quantity);

		return "redirect:detail.jsp";
	}

	public static void quickSort(int l, int r) {
		if (l >= r) {
			return;
		}
		// int pivot = hoarePartition(l, r);
		int pivot = lomutoPartition(l, r);
		quickSort(l, pivot - 1);
		quickSort(pivot + 1, r);

	}

	/**
	 * 피봇을 기준으로 작거나 같은 값은 좌측, 큰 값은 우측에 i~j 인덱스 범위 안으로 지정 i 위치는 큰값 범위의 1칸 전 인덱스 , j
	 * 위치는 큰 값 범위의 마지막 인덱스, a[i] < 큰 값들 <= a[j]
	 */
	public static int lomutoPartition(int l, int r) {
		char pivot = materials[r].charAt(0); // 피봇을 우측 끝으로 지정
		// System.out.println("pivot : " + pivot);
		int i = l - 1; // 큰 값 범위의 1칸 전 인덱스

		for (int j = l; j < r; j++) {
			if (materials[j].charAt(0) <= pivot) {
				// System.out.println("pivot : " + pivot);
				// System.out.println("j : " +materials[j].charAt(0));
				i++;
				String temp = materials[i];
				materials[i] = materials[j];
				materials[j] = temp;
			}
		}

		String temp = materials[i + 1]; // 큰 영역의 첫번째 숫자와 피봇을 교환
		materials[i + 1] = materials[r];
		materials[r] = temp;

		return i + 1; // 피봇의 위치
	}

}
