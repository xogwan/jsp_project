package com.farmer.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;
import com.farmer.app.mypage.SendOkController;

public class MemberFrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
	    String contextPath = req.getContextPath();
	    String target = requestURI.substring(contextPath.length());
	    Result result = null;
	    
	      if(target.equals("/member/checkIdOk.me")) {//아이디중복검사 실행(SELECT)
	          	new CheckIdOkController().execute(req, resp);
	      	    	   
	       }else if(target.equals("/member/checkPhoneNumberOk.me")) {//핸드폰번호중복검 실행(SELECT)
	    	   	new CheckPhoneNumberOkController().execute(req, resp);
	    	   
	       }else if(target.equals("/member/join01.me")) {//회원가입페이지 이동
	    	   	result = new Result();
				result.setPath("/app/join/join01.jsp");
	          
	       }else if(target.equals("/member/join02.me")) {//회원가입페이지 2번째로 이동
	    	   	result = new Result();
				result.setPath("/app/join/join02.jsp");
	       
	       }else if(target.equals("/member/joinOk.me")) {//회원가입 실행(INSERT)
	    	   result = new JoinOkController().execute(req, resp);
	    	   
	       }else if(target.equals("/member/send.me")) {//휴대폰 인증(COOLSMS)
	    	   result = new SmsOkController().execute(req,resp);
	    	   
	       }else if(target.equals("/member/login.me")) {//로그인페이지 이동
	    	   result = new LoginController().execute(req, resp);
	          
	       }else if(target.equals("/member/loginOk.me")) {//로그인 실행(SELECT)
	    	   result = new LoginOkController().execute(req, resp);
	          
	       }else if(target.equals("/member/findId.me")) {//아이디 찾기 실행
	    	   result = new FindIdController().execute(req, resp);
	    	   
	       }else if(target.equals("/member/findPw.me")) {//비밀번호 찾기 실행(UPDATE)
	    	   System.out.println("들어옴?");
	    	   result = new FindPwController().execute(req, resp);
	   		
	       }else if(target.equals("/member/logout.me")) {//로그아웃 (controller 필요)
	    	   result = new LogoutController().execute(req, resp);
	   
	       }
			   
		  
	    if(result != null) {
	         if(result.isRedirect()) {
	            resp.sendRedirect(result.getPath());
	         }else {
	            RequestDispatcher dispatcher = req.getRequestDispatcher(result.getPath());
	            dispatcher.forward(req, resp);
	         }
	    }
	}
}