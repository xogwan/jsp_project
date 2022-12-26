package com.farmer.app.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Result;

public class MypageFrontController extends HttpServlet {

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

		if (target.equals("/mypage/mypageOk.my")) {// 마이페이지로 이동
			result = new MyPageOkController().execute(req, resp);
			result.setPath("/app/myPage/myProfile.jsp");

		} else if (target.equals("/mypage/LogOut.my")) {// 로그아웃 클릭 시 메인페이지로 이동
			result = new Result();
			result.setPath("/index/main.ix");
			
		} else if (target.equals("/mypage/Update.my")) { // 마이페이지에서 수정페이지로 이동
			result = new Result();
			result.setPath("/app/myPage/updatePage.jsp");

		} else if (target.equals("/mypage/send.my")) {
			result = new SendOkController().execute(req, resp);
			
		} else if (target.equals("/mypage/UpdateOk.my")) { // 마이페이지에서 수정하기(UPDATE)
			result = new UpdateOkController().execute(req, resp);
			result.setPath("/mypage/mypageOk.my");
			
		} else if (target.equals("/mypage/Delete.my")) { // 마이페이지에서 탈퇴페이지로 이동
			result = new Result();
			result.setPath("/app/myPage/deletePage.jsp");

		} else if (target.equals("/mypage/DeleteOk.my")) { // 마이페이지에서 탈퇴하기(DELETE)
			result = new DeleteOkController().execute(req, resp);

		} else if (target.equals("/mypage/Write.my")) { // 마이페이지에서 내가 쓴 글 페이지로 이동
			result = new Result();
			result.setPath("/mypage/WriteOk.my");
			
		} else if (target.equals("/mypage/WriteOk.my")) { // 마이페이지에서 내가 쓴 글 리스트 보여주기(SELECT)
			result = new WriteOkController().execute(req, resp);
			
		} else if (target.equals("/mypage/Apply.my")) { // 마이페이지에서 내가 신청한 프로그램/알바 페이지로 이동
			result = new ApplyOkController().execute(req, resp);
			result.setPath("/mypage/ProgramOk.my");

		} else if (target.equals("/mypage/searchOk.my")) {
			result = new SearchOkController().execute(req, resp);
			
		} else if (target.equals("/mypage/AlbaOk.my")) { // 마이페이지에서 내가 신청한 알바 리스트 보여주기(SELECT)
			result = new AlbaOkController().execute(req, resp);
			
		} else if (target.equals("/mypage/ProgramOk.my")) { // 마이페이지에서 내가 신청한 프로그램 리스트 보여주기(SELECT)
			result = new ProgramOkController().execute(req, resp);
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
