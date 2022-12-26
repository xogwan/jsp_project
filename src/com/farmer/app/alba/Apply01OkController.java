package com.farmer.app.alba;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.dao.AlbaDAO;
import com.farmer.app.alba.vo.AlbaVO;

public class Apply01OkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Integer> userMap = new HashMap<String, Integer>();
		AlbaDAO albaDAO = new AlbaDAO();
		Result result = new Result();
		
		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));
		if (req.getSession().getAttribute("memberNumber") != null) {
			int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
			int memberGrade = (Integer)req.getSession().getAttribute("memberGrade");
			
			userMap.put("albaNumber", albaNumber);
			userMap.put("memberNumber", memberNumber);	
			
			int isApply = albaDAO.isApply(userMap);
			
			req.setAttribute("isApply", isApply);
		}
		int countPerson = albaDAO.countApplyPerson(albaNumber);

		countPerson = countPerson > 0 ? countPerson : 0;
		
		req.setAttribute("alba", albaDAO.select(albaNumber));
		req.setAttribute("countPerson", countPerson);
		albaDAO.updateViewCount(albaNumber);
		
  	  	result.setPath("/app/alba/albaDetailPage_1.jsp");
		return result;
	}

}
