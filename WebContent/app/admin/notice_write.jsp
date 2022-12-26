<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/font.css"/>
   <!-- 글 작성 폼 -->
   <!-- 썸머노트 API -->
	<script type="text/javascript" src="/assets/js/summernote-lite.min.js"></script>
   <link rel="stylesheet" type="text/css" href="/assets/css/summernote-lite.min.css" />
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/notice_write.css"/>
   <title>관리자-공지 글 작성</title>
</head>

<body style="background-color: rgba(253, 223, 223, 0.23);">

   <div id="wrapper">
		<!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

      <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
      <div id="container">
         <!-- 헤더 -->
         <header>
            <span id="admin-header-title">공지 글 작성</span>
            <span id="admin-mode">관리자 모드</span>
         </header>

         <!-- 메인화면 컨텐츠 -->
         <div id="write">
            <form action="${pageContext.request.contextPath}/admin/NoticeWriteOk.ad" name="writeForm" method="post" enctype="multipart/form-data">
               <table>
                  <colgroup>
                     <col width="20%;">
                     <col width="80%">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>제목</th>
                        <td>
                           <div class="title">
                              <input type="text" name="nttSj" class="notice_title" placeholder="제목을 입력하세요" autocomplete="off">
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td>
                           <div id="editor">
                              <textarea id="summernote" name="summernote"></textarea>
                              <div id="letter-count">
                                 <p id="letter-length" style="display: inline;">0</p> / 100
                              </div>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>첨부파일</th>
                        <td>
                           <div class="file">
                              <input type="file" name="file">
                           </div>
                           <div id="file-content"></div>
                           <span class="file-limit"> 첨부파일은 총 1개까지 가능합니다.</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <div class="btns-group">
                  <input type="button" onclick="saveCheck(); location.href='${pageContext.request.contextPath}/admin/NoticeListOk.ad'" class="g-btn list" value="공지 목록">
                  <input type="button" onclick="doInsert()" class="g-btn submit" value="저장">
               </div>
            </form>
         </div>

      </div>

   </div>

</body>
<!-- 삭제 버튼 클릭 시 확인 알림창 -->
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/check.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/notice.js"></script>
<!-- 썸머노트 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/summerNote.js"></script>
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