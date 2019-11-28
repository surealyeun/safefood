package com.ssafy.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.controller.Controller;
import com.ssafy.controller.Detail;
import com.ssafy.controller.Find;
import com.ssafy.controller.Login;
import com.ssafy.controller.Logout;
import com.ssafy.controller.Main;
import com.ssafy.controller.Quantity;
import com.ssafy.controller.Remove;
import com.ssafy.controller.Search;
import com.ssafy.controller.SignUp;
import com.ssafy.controller.Update;
import com.ssafy.controller.Want;
import com.ssafy.controller.deleteBoard;
import com.ssafy.controller.insertBoard;
import com.ssafy.controller.intakeData;
import com.ssafy.controller.listBoard;
import com.ssafy.controller.searchBoard;
import com.ssafy.controller.updateBoard;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Map<String, Controller> map = new HashMap<String, Controller>();
	
	@Override
	public void init() throws ServletException {
		map.put("search", new Search());
		map.put("login", new Login());
		map.put("signup", new SignUp());
		map.put("detail", new Detail());
		map.put("quantity", new Quantity());
		map.put("find", new Find());
		map.put("update", new Update());
		map.put("remove", new Remove());
		map.put("main", new Main());
		map.put("logout", new Logout());
		map.put("want", new Want());
		map.put("listBoardData.do", new listBoard());
		map.put("searchBoard.do", new searchBoard());
		map.put("deleteBoard.do", new deleteBoard());
		map.put("insertBoard.do", new insertBoard());
		map.put("updateBoard.do", new updateBoard());
		map.put("intakeData", new intakeData());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("action");
		Controller controller = map.get(path);
		
		if(controller == null) {
			path = "main.jsp";
		} else {
			path = controller.execute(request, response);
		}
		
		if(path.startsWith("redirect")) {
			path = path.substring(path.indexOf(":")+1);
			response.sendRedirect(path);
		} else if(path.startsWith("{")) {
			// {......}
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().append(path);
		} else {
			RequestDispatcher disp = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
	}
}
