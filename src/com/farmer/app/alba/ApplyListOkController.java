package com.farmer.app.alba;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.dao.AlbaDAO;

public class ApplyListOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		AlbaDAO albaDAO = new AlbaDAO();
		Result result = new Result();
		String temp = req.getParameter("page"); 

		int total = albaDAO.selectCount();

		if (req.getSession().getAttribute("memberNumber") != null) {
			int memberGrade = (Integer)req.getSession().getAttribute("memberGrade");
			
			req.setAttribute("memberGrade", memberGrade);
		}
		
		int page = temp == null ? 1 : Integer.parseInt(temp); // 디폴트는 1페이지
//		한 페이지에 출력되는 게시글의 개수
		int rowCount = 12;
//		한 페이지에서 나오는 페이지 버튼의 개수
		int pageCount = 10;
		int startRow = (page - 1) * rowCount;
		int sort = 0;
		
		int endPage = (int)(Math.ceil(page / (double)pageCount) * pageCount); //단위에서 마지막 페이지
		int startPage = endPage - (pageCount - 1); //단위에서 첫번째 페이지
		int realEndPage = (int)Math.ceil(total / (double)rowCount);
		
		boolean prev = startPage > 1; //이전페이지 보이기
		endPage = endPage > realEndPage ? realEndPage : endPage;
		boolean next = endPage != realEndPage; //다음페이지 보이기

		pageMap.put("startRow", startRow);
		pageMap.put("rowCount", rowCount);	
		
        // 현재 날짜/시간
        Date today = Calendar.getInstance().getTime();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        // 포맷팅 적용
        String fToday = f.format(today);
		
        req.setAttribute("albaLists", albaDAO.selectRegistration(pageMap));
		req.setAttribute("processCount", albaDAO.selectProcess(fToday));
		req.setAttribute("total", total);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
	
		result.setPath("/app/alba/albaApply.jsp");

		return result;
	}
}
