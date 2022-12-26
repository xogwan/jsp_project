package com.farmer.app.memberAlba;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.memberAlba.dao.MemberAlbaDAO;

public class ApplyDeleteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Integer> userMap = new HashMap<String, Integer>();
		MemberAlbaDAO apDAO = new MemberAlbaDAO();
		Result result = new Result();
		
		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		
		userMap.put("albaNumber", albaNumber);
		userMap.put("memberNumber", memberNumber);	
		
		apDAO.applyDelete(userMap);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/alba/applyListOk.ab");
		return result;
	}

}
