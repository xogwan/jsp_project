package com.farmer.app.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.dao.MemberDAO;
import com.farmer.app.member.vo.MemberVO;

public class FindIdController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
	
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		Result result = new Result();
		PrintWriter out = resp.getWriter();
		
		String memberFindId="";
		
		String memberName = req.getParameter("inputName");
		String memberPhoneNumber = req.getParameter("inputPhoneNumber");
				
		memberVO.setMemberName(memberName);
		memberVO.setMemberPhoneNumber(memberPhoneNumber);
		
		
		memberFindId=memberDAO.findId(memberVO);
				
		req.setAttribute("memberFindId", memberFindId);
		
				
		System.out.println(memberName);
		System.out.println(memberPhoneNumber);
		System.out.println(memberFindId);
				
				
		
		out.print(memberFindId);
		
//		result.setPath("/app/login/login.jsp");
		return null;
	}
}
