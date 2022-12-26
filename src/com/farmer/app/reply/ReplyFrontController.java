package com.farmer.app.reply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class ReplyFrontController extends HttpServlet {

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

		if (target.equals("/reply/listOk.re")) { // 댓글목록 보여주기(SELECT)
			result = new ListOkController().execute(req, resp);
			
		} else if (target.equals("/reply/writeOk.re")) { // 댓글 입력하기(INSERT)
			result = new WriteOkController().execute(req, resp);
			
		} else if (target.equals("/reply/deleteOk.re")) { // 댓글 삭제하기(DELETE)
			result = new DeleteOkController().execute(req, resp);
			
		} else if (target.equals("/reply/modifyOk.re")) { // 댓글 수정하기(UPDATE)
			result = new ModifyOkController().execute(req, resp);
			
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