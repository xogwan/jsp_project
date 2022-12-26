package com.farmer.app.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.admin.dao.AdminDAO;

public class ReplyOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		Result result = new Result();
		AdminDAO adminDAO = new AdminDAO();
//		사용자한테 현재 몇페이지인지 받아야 한다 처음 page에는 null이기 때문에  temp에 사용자가 누른 페이지로 해주고
//		만약 page에 null이면 1페이지 보여주고 사용자가 입력하면 해당 페이지로 갈 수 있게 해준다. 즉 사용자가 요청한 페이지로 갈 수 있다 (default : 1page)
		String temp =  req.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
//		전체 게시글 갯수
		int total = adminDAO.replyCount();
		int userTotalCount = adminDAO.selectCount();
//		행의 갯 수 몇개씩 가져올 것인지.(한페이지에 15개씩 넣을 것이다.) 숫자 늘리고 싶으면 rowCount숫자 바꾸면 됨.
		int rowCount = 10;
//		한 화면에 나오는 페이지 수 1~10까지 있음. 
		int pageCount = 10;
		int startRow = (page - 1) * rowCount;
		
//		단위에서 마지막 페이지(1~10)
		int endPage = (int) (Math.ceil(page /(double)pageCount) * pageCount);
		int startPage = endPage - (pageCount - 1);
		int realEndPage = (int) Math.ceil(total/(double)pageCount);
		
		
		
		boolean prev = startPage > 1;
		endPage = endPage > realEndPage ? realEndPage : endPage;
		boolean next = endPage != realEndPage;
				
		pageMap.put("startRow", startRow);
		pageMap.put("rowCount", rowCount);
		
		req.setAttribute("userList", adminDAO.replyList(pageMap));
		req.setAttribute("total", total);
		req.setAttribute("userTotalCount", userTotalCount);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
		req.setAttribute("realEndPage", realEndPage);
		
		result.setPath("/app/admin/reply.jsp");
		
		
		return result;
	}
}