package com.farmer.app.mypage;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.vo.MemberVO;
import com.farmer.app.mypage.dao.MypageDAO;
import com.mysql.cj.Session;

public class UpdateOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Result result = new Result();
		MypageDAO mypageDAO = new MypageDAO();
		MemberVO memberVO = new MemberVO();
		HttpSession session = req.getSession();
		
		int memberGrade;
		int memberNumber;
		memberGrade = (Integer)session.getAttribute("memberGrade");
		memberNumber = (Integer)session.getAttribute("memberNumber");
		System.out.println(memberGrade);
		
		String memberType;
		String mentorType;
		String gradeType = req.getParameter("grade");
		String memberPassword = req.getParameter("password");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String memberPhoneNumber = req.getParameter("inputPhone");
		String location1 = req.getParameter("userInfo01");
		String location2 = req.getParameter("userInfo02");
		String memberLocation = location1 + " " +location2;
		String memberEmail = email1 + "@" + email2;
		
//		
//		패스워드 암호화
		memberPassword = new String(Base64.getEncoder().encode(memberPassword.getBytes()));
		
		System.out.println(gradeType);
//		정보수정 일반사용자 버튼 클릭 value가 user
		if(gradeType.equals(String.valueOf(1))) {
			memberGrade = 1;
		}else {
			memberGrade = -1;
		}
		System.out.println(memberGrade);
		
		memberVO.setMemberNumber(memberNumber);
		memberVO.setMemberGrade(memberGrade);
		memberVO.setMemberPassword(memberPassword);
		memberVO.setMemberEmail(memberEmail);
		memberVO.setMemberPhoneNumber(memberPhoneNumber);
		memberVO.setMemberLocation(memberLocation);	
		System.out.println(memberNumber);
		System.out.println(memberGrade);
		System.out.println(memberPassword);
		System.out.println(memberEmail);
		System.out.println(memberPhoneNumber);
		System.out.println(memberLocation);
		
		mypageDAO.updateMyPage(memberVO);
		
////		가입 형태 검사
		if(memberGrade < 0) {
			memberType = "농장주";
			req.setAttribute("memberType", memberType);
		}else if(memberGrade == 0) {
			memberType = "관리자";
			req.setAttribute("memberType", memberType);
		}else if(memberGrade == 1) {
			memberType = "일반 사용자";
			req.setAttribute("memberType", memberType);
		}else {
			memberType = "비정상 가입자";
			req.setAttribute("memberType", memberType);
		}
//
//		멘토링 검사
		if(memberGrade != -1) {
			mentorType = "X";
			req.setAttribute("mentorType", mentorType);
		}else {
			if(memberVO == null) {
				mentorType = "X";
				req.setAttribute("mentorType", mentorType);
			}else{
				mentorType = "멘토";
				req.setAttribute("mentorType", mentorType);
			}
		}
		
		req.setAttribute("memberLocation", memberLocation);	
		
		return result;
	}
}
