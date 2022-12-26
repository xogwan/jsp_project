package com.farmer.app.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.member.vo.MemberVO;
import com.farmer.app.mypage.dao.MypageDAO;
import com.farmer.app.program.vo.ProgramVO;

public class ApplyOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		Result result = new Result();
		MemberVO memberVO = new MemberVO();
		ProgramVO programVO = new ProgramVO();
		MypageDAO mypageDAO = new MypageDAO();
		PrintWriter out = resp.getWriter();
		List<ProgramVO> myProgramVO = null;
		int total;
		HttpSession session = req.getSession();
		int memberNumber = (Integer)session.getAttribute("memberNumber");
		
//		myProgramVO = mypageDAO.selectProgram(2);
		req.setAttribute("myPrograms", myProgramVO);
		
		total = mypageDAO.selectProgramCount(memberNumber);
		req.setAttribute("total", total);
		
		
//		페이징
		String temp = req.getParameter("page"); 
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		int page = temp == null ? 1 : Integer.parseInt(temp);
//		한 페이지에 출력되는 게시글의 개수
		int rowCount = 12;
//		한 페이지에서 나오는 페이지 버튼의 개수
		int pageCount = 10;
		int startRow = (page - 1) * rowCount;
		
		int endPage = (int)(Math.ceil(page / (double)pageCount) * pageCount);
		int startPage = endPage - (pageCount - 1);
		int realEndPage = (int)Math.ceil(total / (double)rowCount);
		
		boolean prev = startPage > 1; 
		endPage = endPage > realEndPage ? realEndPage : endPage;
		boolean next = endPage != realEndPage;

		pageMap.put("startRow", startRow);
		pageMap.put("rowCount", rowCount);
		pageMap.put("memberNumber", memberNumber);
		
		req.setAttribute("programs", mypageDAO.selectProgram(pageMap));
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
		
		result.setPath("/mypage/searchOk.my");
		
		return result;
	}
}