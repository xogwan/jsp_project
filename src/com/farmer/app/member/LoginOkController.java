package com.farmer.app.member;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.dao.MemberDAO;
import com.farmer.app.member.vo.MemberVO;

public class LoginOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		Result result = new Result();
		HttpSession session = req.getSession();
		int memberNumber = 0;
		int memberGrade = 0;
		
		String memberId = req.getParameter("memberId");
		String memberPassword = req.getParameter("memberPassword");
		
		boolean saveId = req.getParameter("saveId")!=null;
		
		
		memberPassword = new String(Base64.getEncoder().encode(memberPassword.getBytes()));
		
		memberVO.setMemberId(memberId);
		memberVO.setMemberPassword(memberPassword);
		
		
		try {
			memberNumber = memberDAO.login(memberVO);
			memberGrade = memberDAO.loginGrade(memberVO);
			
			// 로그인 성공
			session.setAttribute("memberNumber", memberNumber);
			session.setAttribute("memberId", memberId);
			session.setAttribute("memberGrade", memberGrade);
			
			System.out.println(memberNumber);
			System.out.println(memberId);
			System.out.println(memberGrade);
			
			// 아이디 저장(쿠키 저장)
			if(saveId) {
				Cookie cookie = new Cookie("memberId", memberId);
				cookie.setMaxAge(60*60*24*365);
				resp.addCookie(cookie);
				
			}else {
				if(req.getHeader("Cookie")!=null) {
					for(Cookie cookie : req.getCookies()) {
						if(cookie.getName().equals("memberId")) {
							cookie.setMaxAge(0);
							resp.addCookie(cookie);
							break;
						}
					}
				}
			}
			
			result.setRedirect(true);
			result.setPath(req.getContextPath()+"/index/main.ix"); // 임시 메인페이지 주
			
		} catch (Exception e) {
			// 로그인 실패
			result.setRedirect(false);
			result.setPath("/member/login.me?login=false");
		}

		return result;
	}
}
