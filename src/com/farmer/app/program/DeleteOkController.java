package com.farmer.app.program;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.program.dao.ProgramDAO;
import com.farmer.app.program.vo.ProgramVO;

public class DeleteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProgramDAO programDAO = new ProgramDAO();
		Result result = new Result();
		int programNumber = Integer.valueOf(req.getParameter("programNumber"));
		
		ProgramVO programVO = programDAO.select(programNumber);
		String fileName = programVO.getProgramImage();
		
		String fpath = req.getSession().getServletContext().getRealPath("/") + "upload/program/" + fileName;

		File fileObj = new File(fpath); 

		if( fileObj.exists() ) {
		    fileObj.delete();             
		}
		
		programDAO.delete(programNumber);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/program/applyListOk.pg");
		return result;
	}

}
