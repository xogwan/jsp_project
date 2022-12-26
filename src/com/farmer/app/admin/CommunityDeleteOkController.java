package com.farmer.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.admin.dao.AdminDAO;

public class CommunityDeleteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();
		int communityNumber = Integer.valueOf(req.getParameter("communityNumber"));
		
		
		
		adminDAO.deleteCommunity(communityNumber);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/admin/CommunityOk.ad");
		return result;
	}
}