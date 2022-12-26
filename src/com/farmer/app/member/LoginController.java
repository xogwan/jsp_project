package com.farmer.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;

public class LoginController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Result result = new Result();
//		HttpSession session = req.getSession();
		String memberId = null;
		
		boolean logout = Boolean.valueOf(req.getParameter("logout"));
		
		if(req.getHeader("Cookie")!=null) {
			for(Cookie cookie : req.getCookies()) {
				if(cookie.getName().equals("memberId")){
					req.setAttribute("memberId", cookie.getValue());
					}
				}
			}
		
		result.setPath("/app/login/login.jsp");

		return result;
	}
}
