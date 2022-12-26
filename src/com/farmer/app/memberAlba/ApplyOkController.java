package com.farmer.app.memberAlba;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.memberAlba.dao.MemberAlbaDAO;
import com.farmer.app.memberAlba.vo.MemberAlbaVO;

public class ApplyOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MemberAlbaDAO memberAlbaDAO = new MemberAlbaDAO();
		MemberAlbaVO memberAlbaVO = new MemberAlbaVO();
		Result result = new Result();
		
		String memberName = req.getParameter("userName");
		String memberGender = req.getParameter("userGender");
		String memberBirth = req.getParameter("userBirth");
		String memberPhoneNumber = req.getParameter("userPhone");
		String memberAddress = req.getParameter("userAddress");
		String memberEmail = req.getParameter("userEmail");
		String memberReason = req.getParameter("userReason");
		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));
		
		memberAlbaVO.setMemberName(memberName);
		memberAlbaVO.setMemberGender(memberGender);
		memberAlbaVO.setMemberBirth(memberBirth);
		memberAlbaVO.setMemberPhoneNumber(memberPhoneNumber);
		memberAlbaVO.setMemberAddress(memberAddress);
		memberAlbaVO.setMemberEmail(memberEmail);
		memberAlbaVO.setMemberReason(memberReason);
		memberAlbaVO.setAlbaNumber(albaNumber);
		memberAlbaVO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
		
		memberAlbaDAO.insert(memberAlbaVO);
	    
	    result.setPath("/alba/apply03.ab");
	      
	    return result;
	}
}
