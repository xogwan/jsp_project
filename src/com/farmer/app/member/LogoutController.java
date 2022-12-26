package com.farmer.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;

public class LogoutController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Result result = new Result();
		
//		session.removeAttribute("memberNumber"); // 원하는 항목의 세션 삭제
		session.invalidate(); // 세션 전체 삭제
		
		result.setPath("/member/login.me?logout=true");

		return result;
	}
}
