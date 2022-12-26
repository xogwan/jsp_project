package com.farmer.app.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.dao.MemberDAO;

public class CheckPhoneNumberOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberPhoneNumber = req.getParameter("memberPhoneNumber");
			PrintWriter out = resp.getWriter();
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("result", new MemberDAO().checkPhoneNumber(memberPhoneNumber));
			out.print(jsonObject.toJSONString());
			out.close();
		return null;
	}
}
