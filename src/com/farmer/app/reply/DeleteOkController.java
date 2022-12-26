package com.farmer.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.reply.dao.ReplyDAO;

public class DeleteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		int replyNumber=  Integer.valueOf(req.getParameter("replyNumber"));
		
		ReplyDAO replyDAO = new ReplyDAO();
		replyDAO.delete(replyNumber);
		
		return null;
	}
}