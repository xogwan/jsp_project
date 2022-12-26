package com.farmer.app.mentor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class MentorFrontController extends HttpServlet {
	
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
	    
	      if(target.equals("/mentor/listOk.mt")) {// 멘토 리스트(SELECT)
	    	result = new ListOkController().execute(req, resp);
	          
	       }else if(target.equals("/mentor/searchOk.mt")) {//멘토 검색 실행(SELECT)
	   		
	       }else if(target.equals("/mentor/write.mt")) {//멘토 작성페이지로 이동
	   		
	       }else if(target.equals("/mentor/writeOk.mt")) {//멘토 작성(INSERT)
	   		
	       }else if(target.equals("/mentor/update.mt")) {//멘토 수정페이지로 이동
	   		
	       }else if(target.equals("/mentor/updateOk.mt")) {//멘토 수정(UPDATE)
	   		
	       }else if(target.equals("/mentor/deleteOk.mt")) {//멘토 삭제(DELETE)
	   		
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