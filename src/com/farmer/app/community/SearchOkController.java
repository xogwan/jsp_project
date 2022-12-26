package com.farmer.app.community;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.community.dao.CommunityDAO;
import com.farmer.app.community.vo.CommunityDTO;

public class SearchOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Result result = new Result();
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		CommunityDAO communityDAO = new CommunityDAO();
		CommunityDTO communityDTO = new CommunityDTO();
		
		String temp = req.getParameter("page");
		String inputText = req.getParameter("programSearch");
		String choice = req.getParameter("searchSelect");
		int total = 0;
		
		/* 사용자가 선택한 드롭박스에 따라 검색결과 개수를 카운트 */
		switch (choice) {
		case "sj":
			total = communityDAO.searchCntTitle(inputText);
			break;

		case "cn":
			total = communityDAO.searchCntContent(inputText);
			break;

		case "cnsj":
			communityDTO.setCommunityTitle(inputText);
			communityDTO.setCommunityContent(inputText);
			total = communityDAO.searchCntTitleContent(communityDTO);
			break;

		case "nm":
			total = communityDAO.searchCntWriter(inputText);
			break;

		default:
			break;
		}
		
		
		/* 페이징 설정 */
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int rowCount = 10, pageCount = 10;
		int startRow = (page - 1) * rowCount;
		
		int endPage = (int)(Math.ceil(page / (double)pageCount) * pageCount);
		int startPage = endPage - (pageCount - 1);
		int realEndPage = (int)Math.ceil(total / (double)pageCount);
		
		boolean prev = startPage > 1; 
		endPage = endPage > realEndPage ? realEndPage : endPage;
		boolean next = endPage != realEndPage;

		pageMap.put("startRow", startRow);
		pageMap.put("rowCount", rowCount);

		
		/* 사용자가 선택한 필터에 따른 게시글들 가져오기 */
		switch (choice) {
		case "sj": // 제목
			pageMap.put("communityTitle", inputText);
			req.setAttribute("boards", communityDAO.searchTitle(pageMap));
			break;
			
		case "cn": // 내용
			pageMap.put("communityContent", inputText);
			req.setAttribute("boards", communityDAO.searchContent(pageMap));
			break;
			
		case "cnsj":  // 제목+내용
			pageMap.put("communityTitle", inputText);
			pageMap.put("communityContent", inputText);
			req.setAttribute("boards", communityDAO.searchTitleContent(pageMap));
			break;
			
		case "nm": // 작성자
			pageMap.put("memberId", inputText);
			req.setAttribute("boards", communityDAO.searchWriter(pageMap));
			break;

		default:
			break;
		}
		
		req.setAttribute("total", total);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
		
		result.setPath("/app/community/comm_list.jsp");
		return result;
	}
}
