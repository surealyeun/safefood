package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Food;
import com.ssafy.dto.FoodPageBean;
import com.ssafy.dto.User;
import com.ssafy.dto.userfood;
import com.ssafy.service.FoodService;
import com.ssafy.service.UserService;
import com.ssafy.service.mailService;
//import com.ssafy.service.mailService;

@Controller
public class MainController {
	
	@Autowired
	FoodService foodservice;
	
	@Autowired
	UserService service;
	
	static String[] materials = null;
	static List<Food> foods = null;

	@GetMapping("/selectUserAll")
	public ResponseEntity<Object> selectUserAll(){
		try {
			List<User> users=service.selectUserAll();
			return new ResponseEntity<Object>(users,HttpStatus.OK);
		}catch(RuntimeException e) {
			throw e;
		}
	}
	
	@GetMapping("/selectUser")
	public ResponseEntity<Object> findEmployeeById(User user){
		try {
			User users=service.selectUser(user);
			return new ResponseEntity<Object>(users,HttpStatus.OK);
		}catch(RuntimeException e) {
			throw e;
		}
	}

	@PostMapping("/addUser")
	public String addUser(User user, HttpSession session){
		if(service.addUser(user)>0) {
			session.setAttribute("message", "회원 가입 완료");
			return "redirect:signup.jsp";
		} else {
			session.setAttribute("message", "회원 가입 실패");
			return "redirect:signup.jsp";
		}
	}
	
	@PostMapping("/removeUser")
	public String removeUser(String id, HttpSession session) {
		System.out.println("id = "+id);
		if(service.removeUser(id)>0) {
			session.setAttribute("message", "회원 탈퇴 완료");
			return "redirect:remove.do";
		} else {
			session.setAttribute("message", "회원 탈퇴 실패");
			return "redirect:remove.do";
		}
	}
	
	@PostMapping("/updateUser")
	public String update(User user, HttpSession session) {
		System.out.println(user.getAllergy());
		System.out.println(user.getName());
		if(service.updateUser(user)>0) {
			session.setAttribute("IsLogin", user.getId());
			session.setAttribute("user", service.selectUser(user));
			session.setAttribute("message", "정보 수정에 성공하였습니다.");
			return "redirect:update.do";
		} else {
			session.setAttribute("message", "정보 수정에 실패하였습니다.");
			return "redirect:update.do";
		}
	}
	
	@GetMapping("/listBoard.do")
	public String board() {
		return "board.jsp";
	}

	@PostMapping("/login.do")
	public String postLogin(User user, HttpSession session) {
		if(service.login(user)) {
			session.setAttribute("IsLogin", user.getId());
			session.setAttribute("user", service.selectUser(user));
			return "redirect:main.do";
		} else {
			session.setAttribute("LoginError", "로그인에 실패했습니다.");
			return "redirect:login.do";
		}
	}
	
	private List<Integer> codes;
	private List<Food> foodsCal;
	private List<Integer> quantities;
	
//	@ResponseBody
//	@PostMapping("eatfood.do")
//	public String eatFood(@RequestParam int code, int num, HttpSession session) {
//		String id = (String)session.getAttribute("IsLogin");
//		
//		service.foodInsert(id, code, num);
//		
//		return "redirect:detail.jsp";
//	}
	
//	@ResponseBody
	@PostMapping("eatfood.do")
	public String eatFood(@RequestParam int code, int num, String mealtime, String year, String month, String day, HttpSession session) {
		String id = (String)session.getAttribute("IsLogin");
		System.out.println(id+"가 "+code+"를 먹음");
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		String date = year+"-"+month+"-"+day;
		service.foodInsert(id, code, num, mealtime, date);
		
		return "redirect:detail.jsp";
	}
	
	@GetMapping("/algame.do")
	public String algame(HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		String al = user.getAllergy();
		al = al.substring(0);
		
		String[] all = al.split(",");
//		System.out.println(Arrays.toString(all));
		String[] alls = {"대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레", "계란흰자"};
		for (int i = 0; i < all.length; i++) {
			all[i] = alls[Integer.parseInt(all[i])];
			System.out.println("사용자가 가진 알러지:"+all[i]);
			all[i].trim();
		}
		
		List<Food> fs = foodservice.searchAll(new FoodPageBean("f1.name", "", null, 0));
//		System.out.println("game"+fs);
		List<Food> safe = new ArrayList<>();
		List<Food> danger = new ArrayList<>();
		for (int i = 0; i < fs.size(); i++) {
			boolean flag = false;
			for (int j = 0; j < all.length; j++) {
//				System.out.println("식품 원재료: "+fs.get(i).getMaterial());
				if(fs.get(i).getMaterial().contains(all[j])) {
					flag = false;
					danger.add(fs.get(i));
					System.out.println("danger"+fs.get(i)+" "+all[j]);
					break;
				}else {
					flag = true;
				}
			}
			if(flag) {
				safe.add(fs.get(i));
				System.out.println("safe"+fs.get(i));
			}
		}
		session.setAttribute("allergy", all);
		session.setAttribute("safe1", safe.get(0));
		session.setAttribute("safe2", safe.get(1));
		if(danger.size() > 0) {
//			System.out.println("위험한 음식 있음");
			session.setAttribute("danger", danger.get(0));
			session.setAttribute("isDanger", 1);
		}else {
		}
		return "algame.jsp";
	}
	
	@ResponseBody
	@PostMapping("searchByDate.do")
	public List<userfood> searchByDate(@RequestParam Date date, HttpSession session) {
		User user = (User) session.getAttribute("user");
		// 일별 섭취
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
//		System.out.println(date);
		List<userfood> eatC = service.searchByDate(user.getId(), format.format(date));
		double supportpereat=0, calory=0, carbo=0, protein=0,fat=0, sugar=0, natrium=0, chole=0, fattyacid=0, transfat=0;
		for(int i=0; i<eatC.size(); i++) {
			
			supportpereat += foodservice.search(eatC.get(i).getCode()).getSupportpereat() * eatC.get(i).getQuantity();
			calory +=foodservice.search(eatC.get(i).getCode()).getCalory() * eatC.get(i).getQuantity();
			carbo += foodservice.search(eatC.get(i).getCode()).getCarbo() * eatC.get(i).getQuantity();
			protein +=foodservice.search(eatC.get(i).getCode()).getProtein() * eatC.get(i).getQuantity();
			fat +=foodservice.search(eatC.get(i).getCode()).getFat() * eatC.get(i).getQuantity();
			sugar += foodservice.search(eatC.get(i).getCode()).getSugar() * eatC.get(i).getQuantity();
			natrium +=foodservice.search(eatC.get(i).getCode()).getNatrium() * eatC.get(i).getQuantity();
			chole += foodservice.search(eatC.get(i).getCode()).getChole() * eatC.get(i).getQuantity();
			fattyacid += foodservice.search(eatC.get(i).getCode()).getFattyacid() * eatC.get(i).getQuantity();
			transfat += foodservice.search(eatC.get(i).getCode()).getTransfat() * eatC.get(i).getQuantity();
			
			System.out.println("이날 뭐먹음? "+eatC.get(i));
			
		}
		
		
		session.setAttribute("supportpereat", supportpereat);	
		session.setAttribute("calory", calory);
		session.setAttribute("carbo", carbo);
		session.setAttribute("protein", protein);
		session.setAttribute("fat", fat);
		session.setAttribute("sugar", sugar);
		session.setAttribute("natrium", natrium);
		session.setAttribute("chole", chole);
		session.setAttribute("fattyacid", fattyacid);
		session.setAttribute("transfat", transfat);		
		System.out.println(sugar);
		session.setAttribute("userfood", eatC);
		
		return eatC;
	}
	
//	@PostMapping("searchByDate.do")
//	public String searchByDate(@RequestParam Date date, HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		// 일별 섭취
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		
////		System.out.println(date);
//		List<userfood> eatC = service.searchByDate(user.getId(), format.format(date));
//		double supportpereat=0, calory=0, carbo=0, protein=0,fat=0, sugar=0, natrium=0, chole=0, fattyacid=0, transfat=0;
//		for(int i=0; i<eatC.size(); i++) {
//			
//			supportpereat += foodservice.search(eatC.get(i).getCode()).getSupportpereat() * eatC.get(i).getQuantity();
//			calory +=foodservice.search(eatC.get(i).getCode()).getCalory() * eatC.get(i).getQuantity();
//			carbo += foodservice.search(eatC.get(i).getCode()).getCarbo() * eatC.get(i).getQuantity();
//			protein +=foodservice.search(eatC.get(i).getCode()).getProtein() * eatC.get(i).getQuantity();
//			fat +=foodservice.search(eatC.get(i).getCode()).getFat() * eatC.get(i).getQuantity();
//			sugar += foodservice.search(eatC.get(i).getCode()).getSugar() * eatC.get(i).getQuantity();
//			natrium +=foodservice.search(eatC.get(i).getCode()).getNatrium() * eatC.get(i).getQuantity();
//			chole += foodservice.search(eatC.get(i).getCode()).getChole() * eatC.get(i).getQuantity();
//			fattyacid += foodservice.search(eatC.get(i).getCode()).getFattyacid() * eatC.get(i).getQuantity();
//			transfat += foodservice.search(eatC.get(i).getCode()).getTransfat() * eatC.get(i).getQuantity();
//			
//			System.out.println("이날 뭐먹음? "+eatC.get(i));
//			
//		}
//		
//		
//		session.setAttribute("supportpereat", supportpereat);	
//		session.setAttribute("calory", calory);
//		session.setAttribute("carbo", carbo);
//		session.setAttribute("protein", protein);
//		session.setAttribute("fat", fat);
//		session.setAttribute("sugar", sugar);
//		session.setAttribute("natrium", natrium);
//		session.setAttribute("chole", chole);
//		session.setAttribute("fattyacid", fattyacid);
//		session.setAttribute("transfat", transfat);		
//		System.out.println(sugar);
//		session.setAttribute("userfood", eatC);
//		
//		return "redirect:calendar.jsp";
//	}
//	
	
	@PostMapping("intake.do")
	public String getIntake(HttpSession session) {
		double supportpereat=0, calory=0, carbo=0, protein=0,fat=0, sugar=0, natrium=0, chole=0, fattyacid=0, transfat=0;
		
		String id = (String) session.getAttribute("IsLogin");
		
		codes = new ArrayList<>();
		foods = new ArrayList<>();
		foodsCal = new ArrayList<>();
		quantities = new ArrayList<>();
		
		codes=service.foodCodesAll(id);
		System.out.println(codes.size());
		for(int i=0; i<codes.size(); i++) {
			foods.add(foodservice.search(codes.get(i)));
		}
		for(int i=0; i<foods.size(); i++){
			int quantity = service.foodQuantity(id, foods.get(i).getCode());
			quantities.add(quantity);
			Food food = new Food();
			food.setCode(foods.get(i).getCode());
			food.setName(foods.get(i).getName());
			food.setSupportpereat(foods.get(i).getSupportpereat()*quantity);
			supportpereat += foods.get(i).getSupportpereat()*quantity;
			food.setCalory(foods.get(i).getCalory()*quantity);
			calory +=foods.get(i).getCalory()*quantity;
			food.setCarbo(foods.get(i).getCarbo()*quantity);
			carbo += foods.get(i).getCarbo()*quantity;
			food.setProtein(foods.get(i).getProtein()*quantity);
			protein +=foods.get(i).getProtein()*quantity;
			food.setFat(foods.get(i).getFat()*quantity);
			fat +=foods.get(i).getFat()*quantity;
			food.setSugar(foods.get(i).getSugar()*quantity);
			sugar += foods.get(i).getSugar()*quantity;
			food.setNatrium(foods.get(i).getNatrium()*quantity);
			natrium +=foods.get(i).getNatrium()*quantity;
			food.setChole(foods.get(i).getChole()*quantity);
			chole += foods.get(i).getChole()*quantity;
			food.setTransfat(foods.get(i).getTransfat()*quantity);
			fattyacid += foods.get(i).getFattyacid()*quantity;
			food.setTransfat(foods.get(i).getFattyacid()*quantity);
			transfat += foods.get(i).getTransfat()*quantity;
			foodsCal.add(food);
		}
		
		int quantityAll = service.foodQuantityAll(id);
		
		codes = service.foodCodesAll(id);
//		System.out.println("quantityAll = "+quantityAll);
//		System.out.println("foodCodesAll = "+codes);
		
		
		if(quantityAll == -1) {
			session.setAttribute("atenothing", quantityAll);
		}else {
			session.setAttribute("foods", foods);
			session.setAttribute("foodsCal", foodsCal);
			session.setAttribute("quantityAll", quantityAll);
			session.setAttribute("supportpereat", supportpereat);	
			session.setAttribute("calory", calory);
			session.setAttribute("carbo", carbo);
			session.setAttribute("protein", protein);
			session.setAttribute("fat", fat);
			session.setAttribute("sugar", sugar);
			session.setAttribute("natrium", natrium);
			session.setAttribute("chole", chole);
			session.setAttribute("fattyacid", fattyacid);
			session.setAttribute("transfat", transfat);		
			session.setAttribute("quantities", quantities);
			
		}
		
		return "redirect:intakeData.jsp";
		
//		return "intake.jsp";
	}
	
	@GetMapping("/login.do")
	public String getLogin() {
		return "login.jsp";
	}
	
	@GetMapping("/logout.do")
	public String getLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:main.do";
	}
	
	
	@GetMapping("/signup.do")
	public String getSignup() {
		return "signup.jsp";
	}
	
	@GetMapping("/detail.do")
	public String getDetail() {
		return "detail.jsp";
	}
	
	@GetMapping("/update.do")
	public String getUpdate(){
		return "update.jsp";
	}
		
	@GetMapping("/remove.do")
	public String getRemoves(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:signup.jsp";
	}
	
	@GetMapping("main.do")
	public String main(HttpSession session) {
		session.setAttribute("quantity", foodservice.searchQuantity((String)session.getAttribute("IsLogin")));
		List<Food> foods = foodservice.QuantityList();
		Collections.sort(foods, new Comparator<Food>() {
			@Override
			public int compare(Food o1, Food o2) {
				return (o1.getTotal()-o2.getTotal())*(-1);
			}
		});
		
		session.setAttribute("quantityList", foods);
		System.out.println(foods.toString());
		return "redirect:main.jsp";
	}
	
	@GetMapping("search.do")
	public String search(HttpSession session) {
		List<Food> best = foodservice.searchBest();
		for (int i = 0; i < best.size(); i++) {
			System.out.println(best.get(i).getName());
		}
		String selectname = "name";
		String searchtext = "";
		String nutsort = "name";
		System.out.println("search select name : " + selectname + " search text : " + searchtext+" nutsort : "+nutsort);
		foods = foodservice.searchAll(new FoodPageBean("f1."+selectname, searchtext, null, 0));
		
		for (int i = 0; i < foods.size(); i++) {
			String mat = foods.get(i).getMaterial().replaceAll(", ", "&");

			materials = mat.split(",");
			quickSort(0, materials.length - 1);

			String result = Arrays.toString(materials).replaceAll("&", ", ");
			foods.get(i).setMaterial(result);
		}
		
		merge(0, foods.size()-1, nutsort);
	
		session.setAttribute("best", best);
		session.setAttribute("foods", foods);
		session.setAttribute("selectname", selectname);
		session.setAttribute("searchtext", searchtext);
		session.setAttribute("nutsort", nutsort);
		
		System.out.println(selectname + " " + searchtext + " " + foods);
		
		return "redirect:information.jsp";
	}
	
	@PostMapping("search.do")
	public String search(@RequestParam String selectname, String searchtext, String nutsort, HttpSession session) {
		List<Food> best = foodservice.searchBest();
		selectname = "name";
		nutsort = "name";
		for (int i = 0; i < best.size(); i++) {
			System.out.println(best.get(i).getName());
		}
		System.out.println("search select name :" + selectname + ". search text :" + searchtext+". nutsort :"+nutsort);
		foods = foodservice.searchAll(new FoodPageBean("f1."+selectname, searchtext, null, 0));
		
		for (int i = 0; i < foods.size(); i++) {
			String mat = foods.get(i).getMaterial().replaceAll(", ", "&");

			materials = mat.split(",");
			quickSort(0, materials.length - 1);

			String result = Arrays.toString(materials).replaceAll("&", ", ");
			foods.get(i).setMaterial(result);
		}
		
		merge(0, foods.size()-1, nutsort);
	
		session.setAttribute("best", best);
		session.setAttribute("foods", foods);
		session.setAttribute("selectname", selectname);
		session.setAttribute("searchtext", searchtext);
		session.setAttribute("nutsort", nutsort);
		
		System.out.println(selectname + " " + searchtext + " " + foods);
		
		return "redirect:information.jsp";
	}
	
	@PostMapping("detail.do")
	public String fooddetail(@RequestParam String name, HttpSession session) {
		Food food = foodservice.search(name);
		foodservice.countFood(food.getCode());

		String allergys[] = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
				"계란흰자" };
		String target = food.getMaterial();

		// allergy 배열 Selection Sort
		for (int i = 0; i < allergys.length; i++) {
			int minIndex = i;
			for (int j = i; j < allergys.length; j++) { // i~8
				if (allergys[minIndex].charAt(0) >
				allergys[j].charAt(0)) { // 최소값의 위치를 찾기
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
		quickSort(0, materials.length - 1);

		
		String result = Arrays.toString(materials).replaceAll("&", ", ");
		food.setMaterial(result);
		int code = Integer.valueOf(food.getCode());
		String id = (String) session.getAttribute("IsLogin");

		int quantity = 0;
		session.setAttribute("food", food);
		session.setAttribute("quantity", quantity);

		return "redirect:detail.jsp";
	}
	
	@GetMapping("/crossword.do")
	public String cross() {
		return "redirect:crossword.jsp";
	}
	
	@Autowired
	public mailService mail;
	
	@PostMapping("findpw.do")
	public String findpw(User user, HttpSession session) {
		String pw = ""; 
		for (int i = 0; i < 5; i++) { 
			pw += (char) ((Math.random() * 26) + 97); 
		} 
		for (int i = 0; i < 2; i++) { 
			pw +=(int)(Math.random() * 10); 
		} 
		
		System.out.println("controller "+pw);
		
		user.setPassword(pw);
		service.updatepw(user.getId(), user.getPassword());
		
		String subject = "임시 비밀번호 안내입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append(user.getId()+"님의 임시 비밀번호입니다.").append('\n');
		sb.append("임시 비밀번호 : "+user.getPassword()).append('\n');

		mail.send(subject, sb.toString(), "sendemailid", user.getEmail(), null);
		
		return "redirect:main.do";
	}
	
	
	@GetMapping("calendar.do")
	public String calendar(HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		System.out.println(user.toString());
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("MM");
		
		List<userfood> userinfo = service.searchMonth(user.getId(), Integer.parseInt(format.format(today)));
		// 월별 섭취
//		List<userfood> eatformonth = service.searchMonth(user.getId(), Integer.parseInt(format.format(today)));
//		List<userfood> eatformonth = service.searchMonth(user.getId(), 2);
		
//		List<Food> eatF = new ArrayList<>();
		for(int i=0; i<userinfo.size(); i++) {
			System.out.println("userfood month: "+userinfo.get(i));
		}
		
		double supportpereat=0, calory=0, carbo=0, protein=0,fat=0, sugar=0, natrium=0, chole=0, fattyacid=0, transfat=0;
		for(int i=0; i<userinfo.size(); i++) {
			
			supportpereat += foodservice.search(userinfo.get(i).getCode()).getSupportpereat()* userinfo.get(i).getQuantity();
			calory +=foodservice.search(userinfo.get(i).getCode()).getCalory()* userinfo.get(i).getQuantity();
			carbo += foodservice.search(userinfo.get(i).getCode()).getCarbo()* userinfo.get(i).getQuantity();
			protein +=foodservice.search(userinfo.get(i).getCode()).getProtein()* userinfo.get(i).getQuantity();
			fat +=foodservice.search(userinfo.get(i).getCode()).getFat()* userinfo.get(i).getQuantity();
			sugar += foodservice.search(userinfo.get(i).getCode()).getSugar()* userinfo.get(i).getQuantity();
			natrium +=foodservice.search(userinfo.get(i).getCode()).getNatrium()* userinfo.get(i).getQuantity();
			chole += foodservice.search(userinfo.get(i).getCode()).getChole()* userinfo.get(i).getQuantity();
			fattyacid += foodservice.search(userinfo.get(i).getCode()).getFattyacid()* userinfo.get(i).getQuantity();
			transfat += foodservice.search(userinfo.get(i).getCode()).getTransfat()* userinfo.get(i).getQuantity();
			
			
		}
		
		
		session.setAttribute("supportpereat", supportpereat);	
		session.setAttribute("calory", calory);
		session.setAttribute("carbo", carbo);
		session.setAttribute("protein", protein);
		session.setAttribute("fat", fat);
		session.setAttribute("sugar", sugar);
		session.setAttribute("natrium", natrium);
		session.setAttribute("chole", chole);
		session.setAttribute("fattyacid", fattyacid);
		session.setAttribute("transfat", transfat);	
		
		System.out.println("세션 보낼거 "+userinfo.toString());
		session.setAttribute("userinfo", userinfo);
		
		return "calendar.jsp";
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
