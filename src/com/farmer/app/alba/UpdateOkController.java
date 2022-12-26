package com.farmer.app.alba;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmer.app.Execute;
import com.farmer.app.Result;
import com.farmer.app.alba.dao.AlbaDAO;
import com.farmer.app.alba.vo.AlbaVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("들어옴");
		
		AlbaDAO albaDAO = new AlbaDAO();
		AlbaVO albaVO = new AlbaVO();
		Result result = new Result();

		int albaNumber = Integer.valueOf(req.getParameter("albaNumber"));

		//파일 삭제
		albaVO = albaDAO.select(albaNumber);
		String imageName = albaVO.getAlbaImage();
		
		String fpath = req.getSession().getServletContext().getRealPath("/") + "upload/alba/" + imageName;

		File fileObj = new File(fpath); 

		if( fileObj.exists() ) {
		    fileObj.delete();             
		}

		
		//파일 첨부
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/alba/";
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
		
		String title = mr.getParameter("alba_title");
		String address = mr.getParameter("address");
		String daySelect = mr.getParameter("day");
		String albaDay = mr.getParameter("aDay_Date");
		String startAlbaDays = mr.getParameter("s_startDate");
		String endAlbaDays= mr.getParameter("s_endDate");
		String startTime = mr.getParameter("s_startTime");
		String endTime = mr.getParameter("s_endTime");
		String money = mr.getParameter("money_input");
		String applyStartDate = mr.getParameter("r_startDate");
		String applyEndDate = mr.getParameter("r_endDate");
		String persons = mr.getParameter("persons");
		String phone = mr.getParameter("phone");
		
		albaVO.setAlbaName(title);
		albaVO.setAlbaLocation(address);
		if (daySelect.equals("aDay")) {
			albaVO.setAlbaStartDate(albaDay);
			albaVO.setAlbaEndDate(albaDay);
		} else {
			albaVO.setAlbaStartDate(startAlbaDays);
			albaVO.setAlbaEndDate(endAlbaDays);
		}
		System.out.println(daySelect);
		
		albaVO.setAlbaStartTime(startTime);
		albaVO.setAlbaEndTime(endTime);
		albaVO.setAlbaFee(money);
		albaVO.setAlbaApplyStartDate(applyStartDate);
		albaVO.setAlbaApplyEndDate(applyEndDate);
		albaVO.setAlbaRecruitedTotalCount(persons);
		albaVO.setAlbaPhoneNumber(phone);
		albaVO.setAlbaImage(fileSystemName);
		albaVO.setMemberNumber(1); // 세션 memberNumer로 변경 필요
		
		albaDAO.update(albaVO);

		result.setPath("/alba/applyListOk.ab");
		
		return result;
	}

}
