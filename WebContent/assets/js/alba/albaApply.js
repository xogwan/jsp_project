/**
 * 사용자가 알바 신청
 */
function send(){
      if(!applyForm.userName.value){
    	  applyForm.userName.focus();
         return;
      }
      
      if(!applyForm.userBirth.value){
    	  applyForm.userBirth.focus();
         return;
      }
      
      if(!applyForm.userPhone.value){
    	  applyForm.userPhone.focus();
         return;
      }
      
      if(!applyForm.userEmail.value){
    	  applyForm.userEmail.focus();
         return;
      }
      
	applyForm.submit();
	alert("신청이 완료되었습니다.");
   }

// albaNumber	
	function getParameterByName(name) {
		  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		  results = regex.exec(location.search);
		  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
			var patId = getParameterByName('albaNumber'); // 1060192
			applyForm.albaNumber.value = patId;