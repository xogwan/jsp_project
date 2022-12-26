package com.farmer.app.community;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.community.dao.CommunityDAO;
import com.farmer.app.community.vo.CommunityVO;
import com.farmer.app.communityFile.dao.CommunityFileDAO;
import com.farmer.app.communityFile.vo.CommunityFileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		CommunityDAO communityDAO = new CommunityDAO();
		CommunityVO communityVO = new CommunityVO();
		CommunityFileVO communityFileVO = new CommunityFileVO();
		CommunityFileDAO communityFileDAO = new CommunityFileDAO();
		Result result = new Result();
		int currentSequence = 0;
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber"); // Session 로그인 번호
		
//		--------------------------------------------------------------------------------------------
//		* 파일 기본 세팅 *
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/community/";
		int fileSize = 1024 * 1024 * 5; // 파일의 사이즈 제한은 5mb		
		
//		request 객체, 업로드 할 경로, 파일의 크기, 인코딩 방식, 이름변경정책
		MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());		
//		화면에서 구현된 input 타입이 file인 태그 전부 가져옴
				
//		--------------------------------------------------------------------------------------------
		
		communityVO.setCommunityTitle(multipartRequest.getParameter("nttSj"));
		communityVO.setCommunityContent(multipartRequest.getParameter("summernote"));
		communityVO.setMemberNumber(memberNumber); // session은 multipartRequest 필요 x
		communityDAO.write(communityVO);
		
//		--------------------------------------------------------------------------------------------
//		* 파일부분 *
		currentSequence = communityDAO.selectCurrentSequence();
		Enumeration<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();
			String fileOriginalName = multipartRequest.getOriginalFileName(fileName); // 파일 이름
			String fileSystemName = multipartRequest.getFilesystemName(fileName); // 시스템 상의 파일 이름(중복x)
			
			if(fileOriginalName == null)  {continue;}
			
			communityFileVO.setCommunityFileName(fileSystemName);
			communityFileVO.setCommunityFileRealname(fileOriginalName);
			communityFileVO.setCommunityNumber(currentSequence);
			communityFileDAO.insert(communityFileVO);
		}
		
//		--------------------------------------------------------------------------------------------
		result.setPath("/community/listOk.cm");
		return result;
	}
}