
$(".test-start").on("click", function() {
        $("#next-list1").hide();
        $("#next-list2").show();
});

let count = 1;
$(".next-arrow").on("click", function() {
    if ($("#checkStep" + count + " input[type=radio]:checked").length == 6 ){
        if (count < 5) {
            $("#checkStep" + count).hide();
            count++;
            $("#checkStep" + count).show();
        } else {
            $("#checkStep5").hide();
            $("#checkStep1").show();
            count = 1;
            $("#next-list2").hide();
            $("#next-list3").show();
        }
    } else {
        alert('모든 문항에 응답해 주세요.');
    }
});

$(".re-test").on("click", function() {
    $("#next-list3").hide();
    $("#next-list1").show();
    $(".radios-btn").prop("checked", false);
});