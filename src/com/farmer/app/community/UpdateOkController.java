package com.farmer.app.community;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.community.dao.CommunityDAO;
import com.farmer.app.community.vo.CommunityDTO;
import com.farmer.app.communityFile.dao.CommunityFileDAO;
import com.farmer.app.communityFile.vo.CommunityFileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		CommunityDAO communityDAO = new CommunityDAO();
		CommunityDTO communityDTO = new CommunityDTO();
		CommunityFileVO communityFileVO = new CommunityFileVO();
		CommunityFileDAO communityFileDAO = new CommunityFileDAO();
		int currentSequence = 0;
		Result result = new Result();
		
		
		
		/* 파일 부분 */
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/community/";
		int fileSize = 1024 * 1024 * 5; // 파일의 사이즈 제한은 5mb
		
		MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
				
		int communityNumber = Integer.valueOf(multipartRequest.getParameter("communityNumber"));
		String title = multipartRequest.getParameter("nttSj");
		String content = multipartRequest.getParameter("summernote");
		
		
		communityFileDAO.delete(communityNumber); // 기존에 있던 파일 모두 삭제
		
		Enumeration<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();
			String fileOriginalName = multipartRequest.getOriginalFileName(fileName); // 파일 이름
			String fileSystemName = multipartRequest.getFilesystemName(fileName); // 시스템 상의 파일 이름(중복x)
			
			if(fileOriginalName == null)  {continue;}
			
			communityFileVO.setCommunityFileName(fileSystemName);
			communityFileVO.setCommunityFileRealname(fileOriginalName);
			communityFileVO.setCommunityNumber(communityNumber);
			
			communityFileDAO.insert(communityFileVO);
		}
				
		communityDTO.setCommunityNumber(communityNumber);
		communityDTO.setCommunityTitle(title);
		communityDTO.setCommunityContent(content);
		communityDAO.update(communityDTO);
		
		result.setPath("/community/detailOk.cm?communityNumber=" + communityNumber);
		
		return result;
	}
}