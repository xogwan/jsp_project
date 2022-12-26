package com.farmer.app.index;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.index.dao.IndexDAO;

public class IndexOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Result result = new Result();		
		IndexDAO indexDAO = new IndexDAO();
				
		req.setAttribute("programs", indexDAO.selectAll());
		
		result.setPath("/app/main/main.jsp");
		return result;
	}
}
