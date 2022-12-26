package com.farmer.app.alba;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.dao.AlbaDAO;

public class UpdateController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Result result = new Result();
		AlbaDAO albaDAO = new AlbaDAO();
		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));

		req.setAttribute("alba", albaDAO.select(albaNumber));
		result.setPath("/app/alba/albaUpdate.jsp");
		return result;
	}

}
