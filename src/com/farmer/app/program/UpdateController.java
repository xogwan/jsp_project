package com.farmer.app.program;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.program.dao.ProgramDAO;

public class UpdateController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   	  Result result = new Result();
	      ProgramDAO programDAO = new ProgramDAO();
	      int programNumber = Integer.valueOf(req.getParameter("programNumber"));
	      
	      req.setAttribute("program", programDAO.select(programNumber));
	      result.setPath("/app/program/programUpdate.jsp");
	      return result;
	}

}
