package com.farmer.app.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.community.dao.CommunityDAO;

public class UpdateController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		CommunityDAO communityDAO = new CommunityDAO();
		Result result = new Result();		
		int communityNumber = Integer.valueOf(req.getParameter("communityNumber"));
		
		req.setAttribute("community", communityDAO.select(communityNumber));
		result.setPath("/app/community/comm_update.jsp");
		return result;
	}
}
