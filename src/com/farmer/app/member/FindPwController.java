package com.farmer.app.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.dao.MemberDAO;
import com.farmer.app.member.vo.MemberVO;

public class FindPwController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		Result result = new Result();
		PrintWriter out = resp.getWriter();
		
		System.out.println("들어옴1");
		
		String memberId = req.getParameter("outputId");
		String memberPhoneNumber = req.getParameter("outputPhoneNumber");
		String memberPassword = req.getParameter("Password");
		
		memberVO.setMemberName(memberId);
		memberVO.setMemberPhoneNumber(memberPhoneNumber);
		memberVO.setMemberPhoneNumber(memberPassword);
		System.out.println("들어옴2");
		
		memberDAO.findPassword(memberVO);	
		
		
		System.out.println(memberId);
		System.out.println(memberPhoneNumber);
		
		System.out.println("들어옴3");
		out.print(memberPassword);
		memberPassword = new String(Base64.getEncoder().encode(memberPassword.getBytes()));
		req.setAttribute("memberPassword", memberPassword);
		System.out.println(memberPassword);
		
		return null;
	}
}
