package com.farmer.app.memberProgram;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.memberProgram.dao.MemberProgramDAO;

public class ApplyDeleteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Integer> userMap = new HashMap<String, Integer>();
		MemberProgramDAO mpDAO = new MemberProgramDAO();
		Result result = new Result();
		
		int programNumber = Integer.valueOf(req.getParameter("programNumber"));
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		
		userMap.put("programNumber", programNumber);
		userMap.put("memberNumber", memberNumber);	
		

		mpDAO.applyDelete(userMap);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/program/applyListOk.pg");
		return result;
	}

}
