<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 신청 상세페이지1</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/alba/albaDetailPage_1.css" />
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/app/fix/header.jsp" />
	<div class="wrap">
		<div class="sub_title">
			<div class="container">
				<div class="inner">
					<div class="title_left_box">
						<div class="snb_wrap">
							<nav class="snb">
								<div class="top" style="display: inline-block">아르바이트 신청</div>
								<div class="lgr_snb"
									style="display: inline-block; margin-left: 20px;">
									<ul class="lgr_ul">
										<li><a class=a_tag
											href="${pageContext.request.contextPath}/program/applyListOk.pg"><span
												class="checkText">농촌 체험 프로그램</span></a></li>
										<li class="nowMenu"><a class=a_tag
											href="${pageContext.request.contextPath}/alba/applyListOk.ab"><span
												class="secondMenu">농촌 아르바이트</span></a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
					<div class="title_right_box">
						<img
							src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=8nFVTgUIDUlBiYgKluFrhBdHVni9G2K67o64OtO8tD1DEXBRoHgiiIK%2BvPxFADkbugGa28PnSO6qNVxcSqtCKg%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
					</div>
				</div>
			</div>
		</div>
		<div class="main_wrap">
			<div class="main_guide">
				<p class="tit">아르바이트 신청</p>
				<p class="desc">
					<strong>전문가와 함께 프로그램 체험 및 아르바이트를 해보세요!</strong> <br> 너와농부싶어!
					에서는 피곤한 일상생활으로부터 벗어나고 싶으신 도시민들의 안정적인 농촌 정착 및 체험을 돕기위해 <br>
					전문가와 함께하는 체험 프로그램이 있으며, 소소한 일거리가 필요하신 분들께는 아르바이트도 준비되어 있습니다
				</p>
			</div>
			<div class="conwrap">
				<p class="contit">아르바이트 신청 절차</p>
				<div class="process">
					<ul class="clearfix">
						<li>
							<p class="stepnum" id="firstStep">
								Step<br> <strong>1</strong>
							</p>
							<p class="conarea">
								<strong>아르바이트 상세 내용 안내</strong> <br> 상세 내역 확인 후 <br>
								아르바이트 신청 클릭 <br> (지원신청서 작성으로 이동)
							</p>
						</li>
						<li>
							<p class="stepnum" id="secondStep">
								Step<br> <strong>2</strong>
							</p>
							<p class="conarea">
								<strong>지원신청서 작성</strong> <br> 신청서 내역 작성 후 <br> 프로그램
								지원 버튼 클릭 <br> (관리자 승인 후 신청 완료)
							</p>
						</li>
						<li style="float: right;">
							<p class="stepnum" id="lastStep">
								Step<br> <strong>3</strong>
							</p>
							<p class="conarea">
								<strong>신청 완료</strong> <br> 마이페이지에서 <br> 관리자 승인 여부 확인
								<br> (부득이한 사정으로 취소될 수 있음)
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sub_guide">
			<form action="">
				<h3 class="view_tit">${alba.getAlbaName()}</h3>
				<div class="view_main">
					<img src="${pageContext.request.contextPath}/upload/alba/${alba.getAlbaImage()}" class="albaBanner">
					<div class="detail_info">
						<div class="info_apply">
							<c:choose>
								<c:when test="${isApply == 0}">
									<c:if test="${1 eq memberGrade}">
										<a href="${pageContext.request.contextPath}/alba/apply02.ab?albaNumber=${param.albaNumber}" id="alba_apply" class="apply_on"> <span>아르바이트 신청</span></a>
									</c:if>
								</c:when>
								<c:when test="${isApply == 1}">
									<a onclick="javascript:alertCancel();" href="javascript:void(0);" class="apply_on" id="alba_apply"> <span>신청 취소</span></a>
								</c:when>
							</c:choose>

							<a href="${pageContext.request.contextPath}/alba/applyListOk.ab" class="apply_on backList">
								<span>목록</span></a>
						</div>
						<table class="info_table">
							<colgroup>
								<col style="width: 160px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td><span class="list_icon">지역</span></td>
									<td><span>${alba.albaLocation}</span></td>
								</tr>
								<tr>
									<td><span class="list_icon">아르바이트 날짜</span></td>
									<td><span> <c:choose>
												<c:when
													test="${alba.getAlbaStartDate() == alba.getAlbaEndDate()}">
													<c:out value="${alba.getAlbaStartDate()}" />
												</c:when>
												<c:otherwise>
													<c:out
														value="${alba.getAlbaStartDate()} ~ ${alba.getAlbaEndDate()}" />
												</c:otherwise>
											</c:choose>
									</span></td>
								</tr>
								<tr>
									<td><span class="list_icon">아르바이트 시간</span></td>
									<td><span> ${fn:substring(alba.getAlbaStartTime(), 0, 5)}
											~ ${fn:substring(alba.getAlbaEndTime(), 0, 5)} </span></td>
								</tr>
								<tr>
									<td><span class="list_icon">시급</span></td>
									<td><span><c:out value="${alba.getAlbaFee()}" /> 원</span></td>
								</tr>
								<tr>
									<td><span class="list_icon">신청 기간</span></td>
									<td><span id="startDate">${alba.getAlbaApplyStartDate()}</span>
										~ <span id="endDate">${alba.getAlbaApplyEndDate()}</span></td>
								</tr>
								<tr>
									<td><span class="list_icon">모집 인원</span></td>
									<td><span id="countPerson">${countPerson}</span> / <span
										id="countTotal">${alba.getAlbaRecruitedTotalCount()}</span> 명
									</td>
								</tr>
								<tr>
									<td><span class="list_icon">문의 전화</span></td>
									<td><span><c:out value="${alba.getAlbaPhoneNumber()}" /></span></td>
								</tr>
							</tbody>
						</table>
						<c:if test="${memberNumber eq alba.getMemberNumber() || 0 eq memberGrade}">
							<div class="btns">
								<input type="button" class="btn" value="수정"
									onclick="location.href = '${pageContext.request.contextPath}/alba/update.ab?albaNumber=${alba.getAlbaNumber()}'" />
								<input type="button" class="btn" value="삭제"
									onclick="javascript:alert();" />
							</div>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/alba/alba_days.js"></script>
<script>
/* 삭제 알람 */
function alert(){

        var result = confirm("정말 삭제하시겠습니까?");

        if(result) {
           //yes
            location.href = '/alba/deleteOk.ab?albaNumber=${param.albaNumber}';
        } else {
            //no
        }

}
/* 신청 삭제 알람 */
function alertCancel(){

        var result = confirm("정말 신청 취소하시겠습니까?");

        if(result) {
           //yes
            location.href = '/alba/applyDeleteOk.ma?albaNumber=${alba.getAlbaNumber()}';
        } else {
            //no
        }

}
</script>

</html>