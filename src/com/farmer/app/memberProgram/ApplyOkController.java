package com.farmer.app.memberProgram;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.memberProgram.dao.MemberProgramDAO;
import com.farmer.app.memberProgram.vo.MemberProgramVO;

public class ApplyOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MemberProgramDAO memberProgramDAO = new MemberProgramDAO();
		MemberProgramVO memberProgramVO = new MemberProgramVO();
		Result result = new Result();
		
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		String memberName = req.getParameter("userName");
		String memberGender = req.getParameter("userGender");
		String memberBirth = req.getParameter("userBirth");
		String memberPhoneNumber = req.getParameter("userPhone");
		String memberAddress = req.getParameter("userAddress");
		String memberEmail = req.getParameter("userEmail");
		String memberReason = req.getParameter("userReason");
		int programNumber = Integer.valueOf(req.getParameter("programNumber"));
		
		memberProgramVO.setMemberNumber(memberNumber);
		memberProgramVO.setMemberName(memberName);
		memberProgramVO.setMemberGender(memberGender);
		memberProgramVO.setMemberBirth(memberBirth);
		memberProgramVO.setMemberPhoneNumber(memberPhoneNumber);
		memberProgramVO.setMemberAddress(memberAddress);
		memberProgramVO.setMemberEmail(memberEmail);
		memberProgramVO.setMemberReason(memberReason);
		memberProgramVO.setProgramNumber(programNumber);
		
		memberProgramDAO.insert(memberProgramVO);
	    
	    result.setPath("/program/apply03.pg");
	      
	    return result;

	}
}

