package com.farmer.app.alba;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.dao.AlbaDAO;
import com.farmer.app.alba.vo.AlbaVO;

public class DeleteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AlbaDAO albaDAO = new AlbaDAO();
		Result result = new Result();
		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));

		AlbaVO albaVO = albaDAO.select(albaNumber);
		String fileName = albaVO.getAlbaImage();

		String fpath = req.getSession().getServletContext().getRealPath("/") + "upload/program/" + fileName;

		File fileObj = new File(fpath); 

		if( fileObj.exists() ) {
			fileObj.delete();             
		}

		albaDAO.delete(albaNumber);

		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/alba/applyListOk.ab");
		return result;
	}

}
