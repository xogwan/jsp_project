package com.farmer.app.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.reply.dao.ReplyDAO;

public class ListOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		int communityNumber = Integer.valueOf(req.getParameter("communityNumber"));
		ReplyDAO replyDAO = new ReplyDAO();
		PrintWriter out = resp.getWriter();
		
		JSONArray replyList = new JSONArray();
		replyDAO.selectAll(communityNumber).forEach(replyDTO -> {JSONObject reply = new JSONObject(replyDTO); replyList.put(reply);});		
		out.print(replyList.toString());
		out.close();
		return null;
	}
}