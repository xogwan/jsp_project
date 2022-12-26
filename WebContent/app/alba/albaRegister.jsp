<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>프로그램 신청 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alba/albaRegister.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>
</head>
<body>
  <jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
  <div class="sub_title">
            <div class="container">
                <div class="inner">
                    <div class="title_left_box">
                        <div class="snb_wrap">
                            <nav class="snb">
                                <div class="top" style="display: inline-block">아르바이트 등록</div>
                                
                            </nav>
                        </div>
                    </div>
                    <div class="title_right_box">
                        <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=8nFVTgUIDUlBiYgKluFrhBdHVni9G2K67o64OtO8tD1DEXBRoHgiiIK%2BvPxFADkbugGa28PnSO6qNVxcSqtCKg%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                    </div>
                </div>
            </div>
        </div>
    <!-- 바디 -->
 	<div id="write">
            <form action="${pageContext.request.contextPath}/alba/albaWriteOk.ab" name="albaForm" method="post" enctype="multipart/form-data">
               <table>
                  <colgroup>
                     <col width="20%;">
                     <col width="80%;">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>제목</th>
                        <td>
                           <input type="text" name="alba_title" class="program_title" placeholder="제목을 입력하세요"
                              autocomplete="off">
                        </td>
                     </tr>
                     <tr>
                        <th>지역</th>
                        <td>
                           <input type="text" name="address" class="infoInput" placeholder="지역을 입력하세요.">
                        </td>
                     </tr>
                     <tr>
                        <th>아르바이트 날짜</th>
                        <td>
                           <label>
                              <input type="radio" name="day" id="day_default" value="aDay"/> 당일
                           </label>
                           <label>
                              <input type="radio" name="day" value="days"/> 기타
                           </label>
                           <!-- 하루 -->
                           <div class="aDay-div">
                              <input type="date" name="aDay_Date">
                           </div>
                           <!-- 기타 -->
                           <div class="days-div">
                              <div class="range-title">
                                 <div>시작일</div>
                                 <input type="date" name="s_startDate">
                              </div>
                              <div class="range-title">
                                 <div>종료일</div>
                                 <input type="date" name="s_endDate">
                              </div>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>아르바이트 시간</th>
                        <td>
                           <div class="range-title">
                              <div>시작 시간</div>
                              <input type="time" name="s_startTime">
                           </div>
                           <div class="range-title">
                              <div>종료 시간</div>
                              <input type="time" name="s_endTime">
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th class="tuition-th">시급</th>
                        <td>
                           <input type="text" name="money_input" class="infoInput" placeholder="시급을 입력하세요." onkeyup="autoComma(this)">
                        </td>
                     </tr>
                     <tr>
                        <th>신청 기간</th>
                        <td>
                           <div class="range-title">
                              <div>시작일</div>
                              <input type="date" name="r_startDate">
                           </div>
                           <div class="range-title">
                              <div>종료일</div>
                              <input type="date" name="r_endDate">
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>모집 인원</th>
                        <td>
                           <input type="text" name="persons" class="infoInput" placeholder="모집인원을 입력하세요.">
                           <span class="write-txt">명</span>
                        </td>
                     </tr>
                     <tr>
                        <th>전화번호</th>
                        <td>
                           <input type="text" name="phone" class="infoInput" placeholder="전화번호를 입력하세요.">
                        </td>
                     </tr>
                     <tr>
                        <th>첨부파일</th>
                        <td>
                           <div class="file">
                              <input type="file" name="file" class="fileName" onchange="fileUpload()">
                           </div>
                           <div id="file-content"></div><img id="deleteBtn" style="display: none;" alt="첨부 삭제" src="${pageContext.request.contextPath}/assets/images/login/close.png" onclick="cancelFile()">
                           <span class="file-limit"> 첨부파일은 총 1개까지 가능합니다.</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <div class="btns-group">
                  <input type="button" onclick="saveCheck()" class="g-btn list" value="취소">
                  <input type="button" onclick="save()" class="g-btn submit" value="등록">
               </div>
            </form>
         </div>

      <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/alba/alba.js"></script>
</html>