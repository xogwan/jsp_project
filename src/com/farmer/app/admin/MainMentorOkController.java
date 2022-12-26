package com.farmer.app.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.admin.dao.AdminDAO;

public class MainMentorOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		Result result = new Result();
		AdminDAO adminDAO = new AdminDAO();
		
		req.setAttribute("mentorList", adminDAO.mainMentorSelect(pageMap));
		

		result.setPath("/app/admin/main.jsp");
		
		return result;
	}
}
	

