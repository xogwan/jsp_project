package com.farmer.app.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.vo.MemberVO;
import com.farmer.app.mypage.dao.MypageDAO;

public class DeleteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Result result = new Result();
		MemberVO memberVO = new MemberVO();
		MypageDAO mypageDAO = new MypageDAO();
		PrintWriter out = resp.getWriter();
		String encryptinputPassword;
		HttpSession session = req.getSession();
		boolean check =false;
		
		
		int memberNumber = (Integer)session.getAttribute("memberNumber");
		String Password = req.getParameter("inputPassword");
		encryptinputPassword =   new String(Base64.getEncoder().encode(Password.getBytes()));
				
		memberVO.setMemberPassword(encryptinputPassword);
		memberVO.setMemberNumber(memberNumber);
		
		if(mypageDAO.selectDeletePw(encryptinputPassword) == 0) {
			check = false;
		}else {
			mypageDAO.deleteMember(memberVO);
			check = true;
		}
		System.out.println(check);
		out.print(check);
		
		return null;
	}
}
