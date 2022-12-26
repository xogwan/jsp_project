package com.farmer.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.reply.dao.ReplyDAO;
import com.farmer.app.reply.vo.ReplyVO;

public class ModifyOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		ReplyVO replyVO = new ReplyVO();
		ReplyDAO replyDAO = new ReplyDAO();
		int replyNumber=  Integer.valueOf(req.getParameter("replyNumber"));
		String replyContent = req.getParameter("replyContent");
		
		replyVO.setReplyNumber(replyNumber);
		replyVO.setReplyContent(replyContent);
		
		replyDAO.update(replyVO);
		
		return null;
	}
}
