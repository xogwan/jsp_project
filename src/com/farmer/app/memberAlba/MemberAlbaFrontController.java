package com.farmer.app.memberAlba;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class MemberAlbaFrontController extends HttpServlet {
	
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
	    
	      
	       if(target.equals("/memberAlba/applyOK.ma")) {//프로그램 신청상세페이지2에서 개인정보입력(INSERT) , 컨트롤러에서 신청페이지3으로 이동 구현 예정
		   		result = new ApplyOkController().execute(req, resp);
		   		
	       }else if(target.equals("/alba/applyDeleteOk.ma")) {//프로그램 신청 삭제(DELETE)
		    	  result = new ApplyDeleteOkController().execute(req, resp);
		    	  
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