package com.farmer.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.reply.dao.ReplyDAO;
import com.farmer.app.reply.vo.ReplyVO;

public class WriteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
				
		int communityNumber = Integer.valueOf(req.getParameter("communityNumber"));
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber"); // 이후에 session 로그인 된 회원으로 변경 필요
		String replyContent = req.getParameter("replyContent");
		
		replyVO.setCommunityNumber(communityNumber);
		replyVO.setMemberNumber(memberNumber);
		replyVO.setReplyContent(replyContent);
		
		replyDAO.insert(replyVO);
		
		return null;
	}
}
