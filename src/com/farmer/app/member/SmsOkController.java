package com.farmer.app.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.farmer.app.Execute;
import com.farmer.app.Result;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
//		jsp파일 input태그에서 입력받은 값 ajax로 받아오기 
		String phoneNumber = req.getParameter("inputPhoneNumber");
		System.out.println(phoneNumber);
		
		String api_key = "NCS3F5ZY1AHQHACO";
	    String api_secret = "I9IIYDUN1G7N2NTDBHAQQQODLOL884JJ";
	    Message coolsms = new Message(api_key, api_secret);
	    Random r = new Random();
	    String certificationNumber;
	    String resultText = null;

	    //	    랜덤 숫자 4자리
	    certificationNumber = String.valueOf(r.nextInt(9000) + 1000);
	    System.out.println(certificationNumber);
	    
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
//	    회원정보 수정에서 새로 입력한 번호
	    params.put("to", phoneNumber);
//	    내 번호
	    params.put("from", "01024020324");
	    params.put("type", "SMS");
	    params.put("text",certificationNumber);
	    params.put("app_version", "test app 1.2"); // application name and version
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(params.get("text"));
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
//	    resultText : ajax success 값
	    resultText = params.get("text");
	    out.print(resultText);
	    out.close();
	    
	    return null;
	}

}
