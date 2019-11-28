package com.ssafy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dao.DBUtil;
import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class Search implements Controller {
	static String[] materials = null;
	static List<Food> foods = null;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String selectname = request.getParameter("selectname");
		String searchtext = request.getParameter("searchtext");
		String nutsort = request.getParameter("nutsort");
		
		FoodService service = FoodServiceImpl.getInstance();
		
		System.out.println("search : " + selectname + " : " + searchtext);
		foods = service.searchAll(new FoodPageBean("f1."+selectname, searchtext, null, 0));
		
		for (int i = 0; i < foods.size(); i++) {
			String mat = foods.get(i).getMaterial().replaceAll(", ", "&");

			materials = mat.split(",");
			quickSort(0, materials.length - 1);

			String result = Arrays.toString(materials).replaceAll("&", ", ");
			foods.get(i).setMaterial(result);
		}
		
		merge(0, foods.size()-1, nutsort);
	
		HttpSession session = request.getSession();
		session.setAttribute("foods", foods);
		session.setAttribute("selectname", selectname);
		session.setAttribute("searchtext", searchtext);
		session.setAttribute("nutsort", nutsort);
		
		System.out.println(selectname + " " + searchtext + " " + foods);
		
		return "redirect:information.jsp";
	}
	
	public static void merge(int start, int end, String nutsort) {
		if(start >= end) {
			return;
		}
		
		int mid = (start+end)/2;
		merge(start, mid, nutsort);
		merge(mid+1, end, nutsort);
		merging(start, mid, end, nutsort);
	}
	
	public static void merging(int start, int mid, int end, String nutsort) {
		int p = start;
		int q = mid+1;
		int index = 0;
		Food temp[] = new Food[end-start+1];
		
		while(p<=mid && q<=end) {
			switch(nutsort) {
			case "name":
				if(foods.get(p).getName().compareTo(foods.get(q).getName()) > 0) {
					temp[index++] = foods.get(q++);
				} else {
					temp[index++] = foods.get(p++);
				}
				break;
				
			case "calory":
				if(foods.get(p).getCalory() > foods.get(q).getCalory()) {
					temp[index++] = foods.get(q++);
				} else {
					temp[index++] = foods.get(p++);
				}
				break;
				
			case "sugar":
				if(foods.get(p).getSugar() > foods.get(q).getSugar()) {
					temp[index++] = foods.get(q++);
				} else {
					temp[index++] = foods.get(p++);
				}
				break;
				
			case "natrium":
				if(foods.get(p).getNatrium() > foods.get(q).getNatrium()) {
					temp[index++] = foods.get(q++);
				} else {
					temp[index++] = foods.get(p++);
				}
				break;
			}
		}
		
		while(p<=mid) {
			temp[index++] = foods.get(p++);
		}
		
		while(q<=end) {
			temp[index++] = foods.get(q++);
		}
		
		for(int i=start; i<=end; i++) {
			foods.remove(i);
			foods.add(i, temp[i-start]);
		}
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
