/**
 * 
 */

//유효성 검사
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
   }


//programNumber	
	function getParameterByName(name) {
		  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		  results = regex.exec(location.search);
		  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
			var patId = getParameterByName('programNumber'); // 1060192
			applyForm.programNumber.value = patId;