package com.farmer.app.program;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.program.dao.ProgramDAO;
import com.farmer.app.program.vo.ProgramVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ProgramDAO programDAO = new ProgramDAO();
		ProgramVO programVO = new ProgramVO();
		Result result = new Result();
		
		
		int programNumber = Integer.valueOf(req.getParameter("programNumber"));
		
		//파일 삭제
		programVO = programDAO.select(programNumber);
		String imageName = programVO.getProgramImage();
		
		String fpath = req.getSession().getServletContext().getRealPath("/") + "upload/program/" + imageName;

		File fileObj = new File(fpath); 

		if( fileObj.exists() ) {
		    fileObj.delete();             
		}
		
		
		//파일 첨부
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/program/";
		int fileSize = 1024 * 1024 * 5; //5mb
		
		//request 객체, 업로드할 경로, 파일의 크기, 인코딩 방식, 이름변경정책
		MultipartRequest mr = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());//업로드됨.
		
		Enumeration<String> fileNames = mr.getFileNames(); //Form태그의 input태그의 네임값 //리턴타입 enumeration :순서가 있는 set

		String fileSystemName = null;
		while(fileNames.hasMoreElements()) {
	    	String fileName = fileNames.nextElement();
	    	String fileOriginalName = mr.getOriginalFileName(fileName);
	    	fileSystemName = mr.getFilesystemName(fileName);
	    	
	    	if(fileOriginalName == null) {continue;}
	    }
		
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		String title = mr.getParameter("pro_title");
		String address = mr.getParameter("address");
		String startProgramDate = mr.getParameter("s_startDate");
		String endProgramDate = mr.getParameter("s_endDate");
		String startTime = mr.getParameter("s_startTime");
		String endTime = mr.getParameter("s_endTime");
		String moneySelect = mr.getParameter("money");
		String money = mr.getParameter("money_input");
		String applyStartDate = mr.getParameter("r_startDate");
		String applyEndDate = mr.getParameter("r_endDate");
		String persons = mr.getParameter("persons");
		String phone = mr.getParameter("phone");
		

		if (moneySelect.equals("free")) {
			programVO.setProgramFee("무료");
		} else {
			programVO.setProgramFee(money);
		}
		System.out.println(money);
		
		programVO.setProgramName(title);
		programVO.setProgramLocation(address);
		programVO.setProgramStartDate(startProgramDate);
		programVO.setProgramEndDate(endProgramDate);
		programVO.setProgramStartTime(startTime);
		programVO.setProgramEndTime(endTime);
		programVO.setProgramApplyStartDate(applyStartDate);
		programVO.setProgramApplyEndDate(applyEndDate);
		programVO.setProgramRecruitedTotalCount(persons);
		programVO.setProgramPhoneNumber(phone);
		programVO.setProgramImage(fileSystemName);
		
		
		programDAO.update(programVO);
		  
	    result.setPath("/program/applyListOk.pg");
	      
	    return result;
		
	}

}
