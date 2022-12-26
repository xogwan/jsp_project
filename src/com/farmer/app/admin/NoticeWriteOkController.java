package com.farmer.app.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.admin.dao.AdminDAO;
import com.farmer.app.notice.vo.NoticeVO;
import com.farmer.app.noticeFile.dao.NoticeFileDAO;
import com.farmer.app.noticeFile.vo.NoticeFileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeWriteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		AdminDAO adminDAO = new AdminDAO();
		NoticeVO noticeVO = new NoticeVO();
		NoticeFileVO noticeFileVO = new NoticeFileVO();
		NoticeFileDAO noticeFileDAO = new NoticeFileDAO();
		Result result = new Result();
		int currentSequence = 0;
		
////		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber"); // Session 로그인 번호
		
//		--------------------------------------------------------------------------------------------
////		* 파일 기본 세팅 *
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/notice/";
		int fileSize = 1024 * 1024 * 5; // 파일의 사이즈 제한은 5mb		
		
		
//		request 객체, 업로드 할 경로, 파일의 크기, 인코딩 방식, 이름변경정책
		
		
		
		MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());	
		
//		화면에서 구현된 input 타입이 file인 태그 전부 가져옴
//		--------------------------------------------------------------------------------------------
//		
		String changeText = multipartRequest.getParameter("summernote").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		
		noticeVO.setNoticeTitle(multipartRequest.getParameter("nttSj"));
		noticeVO.setNoticeContent(changeText);
//		noticeVO.setMemberNumber(memberNumber); // session은 multipartRequest 필요 x
		noticeVO.setMemberNumber(2); // 이후에 session에 저장된 회원번호로 변경해야함
		
		adminDAO.write(noticeVO);
		currentSequence = adminDAO.selectCurrentSequence();
//		--------------------------------------------------------------------------------------------
//		* 파일부분 *
		Enumeration<String> fileNames = multipartRequest.getFileNames();

		while(fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();
			String fileOriginalName = multipartRequest.getOriginalFileName(fileName); // 파일 이름
			String fileSystemName = multipartRequest.getFilesystemName(fileName); // 시스템 상의 파일 이름(중복x)
			
			if(fileOriginalName == null)  {continue;}
			
			noticeFileVO.setNoticeFileName(fileSystemName);
			noticeFileVO.setNoticeFileRealname(fileOriginalName);
			noticeFileVO.setNoticeNumber(currentSequence);
			
			noticeFileDAO.insert(noticeFileVO);
		}
//		--------------------------------------------------------------------------------------------
		
		result.setPath("/admin/NoticeListOk.ad");
		return result;
	}
}