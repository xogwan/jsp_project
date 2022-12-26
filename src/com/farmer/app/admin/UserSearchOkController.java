package com.farmer.app.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.admin.dao.AdminDAO;
import com.farmer.app.admin.vo.AdminMemberDTO;

public class UserSearchOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		AdminMemberDTO adminMemberDTO = new AdminMemberDTO(type, keyword);

		
		AdminDAO adminDAO = new AdminDAO();
		JSONArray members = new JSONArray();
		PrintWriter out = resp.getWriter();
		adminDAO.findAllSearchBy(adminMemberDTO).stream().map(vo -> new JSONObject(vo)).forEach(member -> members.put(member));
		
		out.print(members.toString());
		out.close();
		
		return null;
	}
}
