package com.farmer.app.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.vo.AlbaVO;
import com.farmer.app.member.vo.MemberVO;
import com.farmer.app.mypage.dao.MypageDAO;
import com.farmer.app.program.vo.ProgramVO;

public class MyPageOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MypageDAO mypageDAO = new MypageDAO();
		MemberVO memberVO = new MemberVO();
		ProgramVO programVO = new ProgramVO();
		AlbaVO albaVO = new AlbaVO();
		Result result = new Result();
		HttpSession session = req.getSession();
		boolean albaApply = false;
		boolean programApply = false;
		String gradeText;
		String programName;
		String programDate;
		int programNumber;
		String albaName;
		String albaDate;
		int albaNumber;
		
		int memberNumber = (Integer)session.getAttribute("memberNumber");
		
//		마이페이지 내 정보칸에 나타낼 값 select
		memberVO = mypageDAO.selectMyPage(memberNumber) == null ?  mypageDAO.selectNotMentor(memberNumber) : mypageDAO.selectMyPage(memberNumber);

		
		String memberId = memberVO.getMemberId();
		String memberPassword = memberVO.getMemberPassword();
		String memberName = memberVO.getMemberName();
		String memberLocation = memberVO.getMemberLocation();
		int memberGrade = memberVO.getMemberGrade();
		String memberPhoneNumber = memberVO.getMemberPhoneNumber();
		String memberType;
		String mentorType;
		
		session.setAttribute("memberId",memberId );
		session.setAttribute("memberPassword", memberPassword);
		session.setAttribute("memberName", memberName);
		session.setAttribute("memberPhoneNumber", memberPhoneNumber);
		session.setAttribute("memberGrade", memberGrade);
		session.setAttribute("memberLocation", memberLocation);
		String Grade = String.valueOf(memberGrade);
//		resp.set
//		resp.setAttribute("Grade" , Grade);
		System.out.println(session.getAttribute("memberId"));
		System.out.println(session.getAttribute("memberPhoneNumber"));
		
//		농장주, 일반사용자 검사
		if(memberGrade == -1) {
			if(mypageDAO.selectFarmerAlba(memberNumber) == null) { // 농장주일 때
				albaApply = false;
			}else {
				albaApply = true;
				albaVO = mypageDAO.selectFarmerAlba(memberNumber);
			}
			if(mypageDAO.selectFarmerProgram(memberNumber) == null) {
				programApply = false;
			}else {
				programApply = true;
				programVO = mypageDAO.selectFarmerProgram(memberNumber);
			}
			
			System.out.println(albaVO);
			
			albaName = albaVO.getAlbaName();
			albaDate = albaVO.getAlbaDate();
			albaNumber = albaVO.getAlbaNumber();
			programName = programVO.getProgramName();
			programDate = programVO.getProgramDate();
			programNumber = programVO.getProgramNumber();
			gradeText = "등록";
			memberType = "농장주";
			req.setAttribute("memberType", memberType);
			req.setAttribute("gradeText", gradeText);
			req.setAttribute("albaName", albaName);
			req.setAttribute("albaDate", albaDate);
			req.setAttribute("albaNumber", albaNumber);
			req.setAttribute("programName", programName);
			req.setAttribute("programDate", programDate);
			req.setAttribute("programNumber", programNumber);
			
		}else if(memberGrade == 1) {
//			내가 신청한 알바 신청 최신순 1개 가져오기
			
			if(mypageDAO.selectRecentAlbas(memberNumber) == null) {
				albaApply = false;
			}else {
				albaApply = true;
				albaVO = mypageDAO.selectRecentAlbas(memberNumber);
			}
			
//			내가 신청한 프로그램 신청 최신순 1개 가져오기
			if(mypageDAO.selectRecentPrograms(memberNumber) == null) {
				programApply = false;
			}else {
				programApply = true;
				programVO = mypageDAO.selectRecentPrograms(memberNumber);
			}
			albaName = albaVO.getAlbaName();
			albaDate = albaVO.getAlbaStartDate();
			albaNumber = albaVO.getAlbaNumber();
			programName = programVO.getProgramName();
			programDate = programVO.getProgramStartDate();
			programNumber = programVO.getProgramNumber();
			
			gradeText = "신청";
			memberType = "일반 사용자";
			req.setAttribute("memberType", memberType);
			req.setAttribute("gradeText", gradeText);
			req.setAttribute("albaName", albaName);
			req.setAttribute("albaDate", albaDate);
			req.setAttribute("albaNumber", albaNumber);
			req.setAttribute("programName", programName);
			req.setAttribute("programDate", programDate);
			req.setAttribute("programNumber", programNumber);
		}
			
		req.setAttribute("albaApply", albaApply);
		req.setAttribute("programApply", programApply);
		req.setAttribute("recentLists", mypageDAO.selectRecentWrite(memberNumber));
		
		
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
		
		req.setAttribute("memberName", memberName);
//		req.setAttribute("memberLocation", memberLocation);		
		
		return result;
	}
}
