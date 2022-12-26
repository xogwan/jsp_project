package com.farmer.app.program;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.program.dao.ProgramDAO;

public class Apply01OkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Integer> userMap = new HashMap<String, Integer>();
		ProgramDAO programDAO = new ProgramDAO();
		Result result = new Result();
		
		int programNumber = Integer.valueOf(req.getParameter("programNumber"));
		if (req.getSession().getAttribute("memberNumber") != null) {
			int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
			int memberGrade = (Integer)req.getSession().getAttribute("memberGrade");
			
			userMap.put("programNumber", programNumber);
			userMap.put("memberNumber", memberNumber);	
			
			int isApply = programDAO.isApply(userMap);
			
			req.setAttribute("isApply", isApply);
		}
		
		

		req.setAttribute("program", programDAO.select(programNumber));
		programDAO.updateViewCount(programNumber);
		int count = programDAO.countPeople(programNumber);
		count = (count != 0 ? count : 0);
		req.setAttribute("count", count);
		
  	  	result.setPath("/app/program/programDetailPage_1.jsp");
		return result;
	}

}



