package com.farmer.app.policy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class PolicyFrontController extends HttpServlet {

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

		if (target.equals("/policy/policys1.po")) { // 경로 적기 *.po(사용)
			result = new Result();
			result.setPath("/app/policy/policypage1.jsp");
			
		} else if (target.equals("/policy/policys2.po")) {
			result = new Result();
			result.setPath("/app/policy/policypage2.jsp");
			
		} else if (target.equals("/policy/policys3_1.po")) {
			result = new Result();
			result.setPath("/app/policy/policypage3_1.jsp");
			
		} else if (target.equals("/policy/policys3_2.po")) {
			result = new Result();
			result.setPath("/app/policy/policypage3_2.jsp");
			
		} else if (target.equals("/policy/policys3_3.po")) {
			result = new Result();
			result.setPath("/app/policy/policypage3_3.jsp");
			
		} else if (target.equals("/policy/policys4.po")) {
			result = new Result();
			result.setPath("/app/policy/policypage4.jsp");
		}

		if (result != null) {
			if (result.isRedirect()) {
				resp.sendRedirect(result.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(result.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}