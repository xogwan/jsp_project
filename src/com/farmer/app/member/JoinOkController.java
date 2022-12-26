package com.farmer.app.member;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.dao.MemberDAO;
import com.farmer.app.member.vo.MemberVO;

public class JoinOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Result result = new Result();
		
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		
		String memberId = req.getParameter("memberId");
		String memberPassword = req.getParameter("memberPassword");
		String memberEmail = req.getParameter("memberEmail")+"@"+req.getParameter("emailDomain");
		String memberPhoneNumber = req.getParameter("memberPhoneNumber");
		String memberName = req.getParameter("memberName");
		String location1 = req.getParameter("userInfo01");
		String location2 = req.getParameter("userInfo02");
		String memberLocation = location1 + " " +location2;
		int memberGrade = Integer.valueOf(req.getParameter("memberGrade"));
		

		
		memberPassword = new String(Base64.getEncoder().encode(memberPassword.getBytes()));
		
		memberVO.setMemberId(memberId);
		memberVO.setMemberPassword(memberPassword);
		memberVO.setMemberEmail(memberEmail);
		memberVO.setMemberPhoneNumber(memberPhoneNumber);
		memberVO.setMemberName(memberName);
		memberVO.setMemberLocation(memberLocation);
		memberVO.setMemberGrade(memberGrade);
		
		
		memberDAO.join(memberVO);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath()+ "/index/main.ix");
		
		return result;
	}
}
