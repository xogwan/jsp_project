<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="../css/comm_write.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/comm_write.css"/>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp" />
	<!-- subheader -->
	<div class="sub_title">
		<div class="sub_title_container">
			<div class="inner">
				<div class="title_left_box">
					<div class="snb_wrap">
						<nav class="snb">
							<div class="top" style="display: inline-block">커뮤니티</div>
							<div class="lgr_snb"
								style="display: inline-block; margin-left: 20px;">
								<ul class="lgr_ul" data-level="1">
									<li><a href="/young/board/board04.do" class="active">
											<span>공지사항</span>
									</a></li>
									<li><a href="/young/board/board07.do" class="active">
											<span>멘토 홍보 게시판</span>
									</a></li>
									<li class="nowMenu"><a href="${pageContent.request.contetPath}/community/listOk.cm"
										class="active"> <span>소통공간</span>
									</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
				<div class="title_right_box">
					<img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9RfoLYoam0TsoWU0M9CunXVDpRV%2BMYjz%2Fwx9V8vcTVN9PUStsh042e3NWGD7IukskEQAGJfLet60yqWGs%2Bedtw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
				</div>
			</div>
		</div>
	</div>
	<!-- subheader -->
	<div class="contentfullwrap">
		<div class="contentwrap">
			<h2 class="pagetitle" id="contentBox" tabindex="0"></h2>
			<div class="base_boardwrap">
				<div class="printboard">
					<div class="base_boardwrite02">
						<form action="${pageContext.request.contextPath}/community/updateOk.cm" name="writeForm" method="post" enctype="multipart/form-data">
							<input type = "hidden" name="communityNumber" value="${param.communityNumber}">
							<table class="brdTline02 tblspace01">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td>
											<div class="iron-input-note">
												<span class="content">
													<input type="text" name="nttSj" id="nttSj" class="val" title="제목" maxlength="1900" value="${community.getCommunityTitle()}">
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea id="summernote" name="summernote">${community.getCommunityContent()}</textarea>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td>
											<div class="fileInfo">
												<input type="file" id="egovComFileUploader" title="첨부파일" name="file_0">
											</div>
											<div id="egovComFileList"></div> <span class="attchtext">
												첨부파일은 총 1개까지 가능합니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
							<span class="tbl_lineb"></span>
							<div class="te_right mt25">
								<button type="button" class="iron-iconized iron-action primary featured save" onclick="doInsert()">
									<span class="val">수정</span>
								</button>
								<button type="button" class="iron-iconized iron-action primary featured save" onclick="history.back()">
									<span class="val">취소</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$(document).ready( function() {
			$('#summernote').summernote(
				{
					height : 400,
					resize : false,
					callbacks : { // 글자수 체크하는 코드
						onChange : function(contents, $editable) {
							editorText = f_SkipTags_html(contents);
							editorText = editorText.replace(/\s/gi, ""); //줄바꿈 제거
							editorText = editorText.replace(/&nbsp;/gi,""); //공백제거
							/* console.log(editorText);
							console.log(editorText.length); */
							$("#letter-length").text(editorText.length);
						},
						onImageUpload : function(files,editor) {
							console.log(files);
						}
					}
				});
			
			function f_SkipTags_html(input, allowed) {
				// 허용할 태그는 다음과 같이 소문자로 넘겨받습니다. (<a><b><c>)
				allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
				var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi, commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
				return input.replace(commentsAndPhpTags, '').replace(tags,
								function($0, $1) {return allowed.indexOf('<'+ $1.toLowerCase()+ '>') > -1 ? $0 : '';});
			}
		}
);
			
	/* 글작성 submit */
	function doInsert() {
		var text = $("#summernote").val();
		text = text.replace(/<br\/>/ig, "\n");
		text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
		
		if(!writeForm.nttSj.value) {
			alert("제목을 입력해주세요.");
			writeForm.nttSj.focus();
			return;
		}
		if(!text) {
			alert("내용을 입력해주세요.");
			text.focus();
			return;
		}
		writeForm.submit(); // 위 조건에서 걸리지 않으면 커밋
	}
</script>

<script type="text/javascript">
var checkUnload = true;
$("#write").on("click", function () {
    checkUnload = false;
    $("submit").submit();
});
</script>
</html>