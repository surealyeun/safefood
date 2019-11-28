package com.ssafy.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.vo.Food;
public class Want implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int wantcal = Integer.valueOf(request.getParameter("wantcal"));
        HttpSession session = request.getSession();
        FoodService foservice = FoodServiceImpl.getInstance();
        List<Food> foods = foservice.searchQuantity((String)session.getAttribute("IsLogin"));
        
        int DP[] = new int[wantcal+1];
        boolean number[][][] = new boolean[wantcal+1][101][foods.size()];
        DP[0] = 1;
        
        for(int i=0; i<foods.size(); i++) {
            for(int j=wantcal; j-(int)foods.get(i).getCalory()>=0; j--) {
                if(DP[j-(int)foods.get(i).getCalory()] != 0) {
                    DP[j] = DP[j-(int)foods.get(i).getCalory()] + DP[j];
                    
                    for(int a=DP[j]-DP[j-(int)foods.get(i).getCalory()]; a<DP[j]; a++) {
                        if(a > 100) {
                            DP[j] = 101;
                            break;
                        }
                        for(int b=0; b<i; b++) {
                            number[j][a][b] = number[j-(int)foods.get(i).getCalory()][a][b];
                        }
                        number[j][a][i] = true;
                    }
                }
            }
        }
        
        List<Food> temp = new ArrayList<Food>();
        firstloop : for(int i=wantcal; i>=0; i--) {
            if(DP[i] != 0) {
                for(int a=0; a<DP[i]; a++) {
                    for(int b=0; b<foods.size(); b++) {
                        if(number[i][a][b])
                            temp.add(foods.get(b));
                    }
                    request.setAttribute("value", i);
                    break firstloop;
                }
            }
        }
        
        request.setAttribute("temp", temp);
        return "wantoutput.jsp";
    }
}