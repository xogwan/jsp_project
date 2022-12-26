/**
 * 
 */

//홈페이지 내용 그대로 복붙한 거라 참고해서 수정하시면 됩니다!!

//검색
function fn_search(){
    var searchFrm = document.boardSearchForm;
    //document.getElementById("_search_so_").value = searchFrm.so.value;
    document.getElementById("_search_sv_").value = searchFrm.sv.value;
    gf_movePage(1);
}

$("#sort").change(function(){
    document.listForm.search_sort.value = $("#sort").val();
    fn_movePage(1);
})

$(".sort_btn").click(function(){
    if(!$(this).hasClass("active")) {
        $(".sort_btn").removeClass("active");
        $(this).addClass("active");
        document.listForm.search_sort.value = $(this).attr("data-id");
    } else {
        $(this).removeClass("active");
        document.listForm.search_sort.value = "";
    }
    fn_movePage(1);
})

//페이지 이동
function fn_movePage(cp) {
    document.listForm.cp.value = cp;
    var frm = $("#listForm")[0];
    frm.action = gf_getPathName();
    frm.submit();
}


//등록
function fn_registerView() {
    document.listForm.action = "/young/board/board02/register.do";
    document.listForm.submit();
}

//수정
function fn_modifyView() {
    document.listForm.action = "/young/board/board02/modify.do";
    document.listForm.submit();
}



//청년사례 - 게시글 더보기
function fn_selectList02(){
    var ab = 8;
    var startNum = parseInt($("#_search_cp_").val())+1;
    console.log(startNum);
    $.ajax({
          type : "GET"
        , url : "/young/board/board02/selectList.do"
        , data : {cp : startNum}
        , success : function(response) {
            //gf_movePage(1);
            console.log(response);
            if(!gf_isNull(response)){
                $.each(response.list, function(i, item){
                    //console.log(item);
                    var li = '';
                    li += '<li>';
                    
                    li += '<div class="item_photo">';
                        
                                li += '<a class="link" href="javascript:fn_detailView('+ "'" + item.bbsId + "'" +')" title="상세보기">';
                                li += '<img src="' + item.thumbnail + '" alt="' + item.title +'" />';
                                li += '</a>';
                            
                    li += '</div>';
                    li += '<div class="item_tech">';
                    li += '<ul>';
                    li += '<li>';
                    li += '<p><span>' + gf_nvl(item.area1Nm, '') + gf_nvl(item.area2Nm, '') + '</span></p>';
                    li += '</li>';
                    li += '<li>';
                    li += '<p><span>' + item.bbsInfo04.substring(0,6) + '</span></p>';
                    li += '</li>';
                    li += '</ul>';
                    li += '</div>';
                    li += '<div class="item_cont">';
                    li += '<div class="tit" data-depth="'+ item.bbsDepth + '">';
                        
                                li += '<a class="link" href="javascript:fn_detailView('+ "'" +  item.bbsId + "'" +');" title="상세보기">';
                                    
                                    li += item.title;
                                    
                                    li += '</a>';
                            
                    li += '</div>';
                    li += '<div class="writer_info">';
                    //li += '[' + item.bbsInfo03 + '<span>|</span>'+ item.bbsInfo04 +']';
                    li += item.bbsInfo03;
                    li += '</div>';
                    li += '</div>';
                    li += '<div class="item_use_box">';
                    li += '<div class="go">'+ '<a href="javascript:fn_detailView(\''+gf_nvl(item.bbsId, '')+'\')">바로가기</a>' +'</div>';
                    li += '<div class="previewo"><a href="#">미리보기</a></div>'
                    li += '</div>';
                    li += '</li>';
                    $(".hn_photo_list>ul").append(li);	
                })
                //console.log(response.paging.lastPage);
                $('input[name="cp"]').attr('value', response.paging.currentPage);
                if(startNum === ab){
                    $('.hn_photo_list > .more_btn > a').hide();
                }
            }
        }
        , error : function(response) {
            //alert("권한이 없습니다.");
        }
    });
}



//청년사례:유튜브 - 게시글 더보기
function fn_selectList05(){
    var ab = 8;
        var startNum = parseInt($("#_search_cp_").val())+1;
        console.log(startNum);
        $.ajax({
              type : "GET"
            , url : "/young/board/board02/selectList.do"
            , data : {cp : startNum}
            , success : function(response) {
                //gf_movePage(1);
                console.log(response);
                if(!gf_isNull(response)){
                    $.each(response.list, function(i, item){
                        //console.log(item);
                        var li = '';
                        li += '<li>';
                        
                        li += '<div class="item_photo">';
                            
                                    li += '<a class="link" href="javascript:fn_detailView('+ "'" + item.bbsId + "'" +')" title="상세보기">';
                                    li += '<img src="' + item.thumbnail + '" alt="' + item.title +'" />';
                                    li += '</a>';
                                
                        li += '</div>';
                        li += '<div class="item_tech">';
                        li += '<ul>';
                        li += '<li>';
                        li += '<p><span>' + gf_nvl(item.area1Nm, '') + gf_nvl(item.area2Nm, '') + '</span></p>';
                        li += '</li>';
                        li += '<li>';
                        li += '<p><span>' + item.bbsInfo04.substring(0,6) + '</span></p>';
                        li += '</li>';
                        li += '</ul>';
                        li += '</div>';
                        li += '<div class="item_cont">';
                        li += '<div class="tit" data-depth="'+ item.bbsDepth + '">';
                            
                                    li += '<a class="link" href="javascript:fn_detailView('+ "'" + item.bbsId + "'" +');" title="상세보기">';
                                        
                                        li += item.title;
                                        
                                        li += '</a>';
                                
                        li += '</div>';
                        li += '<div class="writer_info">';
                        //li += '[' + item.bbsInfo03 + '<span>|</span>'+ item.bbsInfo04 +']';
                        li += item.bbsInfo03;
                        li += '</div>';
                        li += '</div>';
                        li += '<div class="item_use_box">';
                        li += '<div class="go">'+ '<a href="javascript:fn_detailView(\''+gf_nvl(item.bbsId, '')+'\')">유튜부바로가기</a>' +'</div>';
                        //li += '<div class="previewo"><a href="#">미리보기</a></div>'
                        li += '</div>';
                        li += '</li>';
                        $(".hn_photo_list>ul").append(li);	
                    })
                    //console.log(response.paging.lastPage);
                    $('input[name="cp"]').attr('value', response.paging.currentPage);
                    if(startNum === ab){
                        $('.hn_photo_list > .more_btn > a').hide();
                    }
                }
            }
            , error : function(response) {
                //alert("권한이 없습니다.");
            }
        });
}


