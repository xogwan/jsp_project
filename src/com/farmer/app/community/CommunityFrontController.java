package com.farmer.app.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class CommunityFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String target = requestURI.substring(contextPath.length());
		Result result = null;

		if (target.equals("/community/listOk.cm")) {// 소통공간 전체 글목록 조회(SELECT)
			result = new ListOkController().execute(req, resp);
			
		} else if (target.equals("/community/searchOk.cm")) {// 소통공간 검색 실행(SELECT)
			result = new SearchOkController().execute(req, resp);
			
		} else if (target.equals("/community/detailOk.cm")) {// 소통공간 상세내용 보여주기(SELECT)
			result = new DetailOkController().execute(req, resp);
			
		} else if (target.equals("/community/writeOk.cm")) {// 소통공간 글 작성(INSERT)
			result = new WriteOkController().execute(req, resp);
			
		} else if (target.equals("/community/write.cm")) {// 소통공간 글 작성 페이지로 이동
			result = new Result();
			result.setPath("/app/community/comm_write.jsp");
			
		} else if (target.equals("/community/deleteOk.cm")) {// 소통공간 글 삭제(DELETE)
			result = new DeleteOkController().execute(req, resp);
			
		} else if (target.equals("/community/update.cm")) {// 소통공간 글 수정 페이지로 이동(controller 필요)
			result = new UpdateController().execute(req, resp);
			
		} else if (target.equals("/community/updateOk.cm")) {// 소통공간 글 수정(UPDATE)
			result = new UpdateOkController().execute(req, resp);
		}

		if (result != null) {
			if (result.isRedirect()) {
				resp.sendRedirect(result.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(result.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}