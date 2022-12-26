package com.farmer.app.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.community.dao.CommunityDAO;
import com.farmer.app.communityFile.dao.CommunityFileDAO;

public class DetailOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		CommunityDAO communityDAO = new CommunityDAO();
		CommunityFileDAO communityFileDAO = new CommunityFileDAO();
		Result result = new Result();
		int communityNumber = Integer.valueOf(req.getParameter("communityNumber"));
		
		req.setAttribute("board", communityDAO.select(communityNumber));
		req.setAttribute("files", communityFileDAO.select(communityNumber)); // 해당 글번호의 첨부파일 정보
		communityDAO.updateViewCount(communityNumber);
		

		result.setPath("/app/community/comm_view_on.jsp");
		return result;
	}
}
