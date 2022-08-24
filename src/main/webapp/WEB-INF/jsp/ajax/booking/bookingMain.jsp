<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>통나무 팬션</title>
  
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>  
  
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/ajax/booking/style.css" type="text/css">
  
</head>

<body>
  
  <div id="wrap">
  
    <jsp:include page="header.jsp" />

    <section>
      <article class="img">
        <img id="mainImg" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="메인 사진">
      </article>

      <div class="main-contents d-flex">
        <div class="col-4 d-flex justify-content-center align-items-center">
          <div class="display-4 text-white">
            실시간 <br> 예약하기
          </div>
        </div>

        <div class="reservation col-5">
          <div class="col-4 pt-4 text-white"><h4>예약 확인</h4></div>

          <div id="nonMemberInput">
            <div class="form-group d-flex justify-content-center mt-3">
              <label class="name col-3 text-white">이름 : </label>
              <div class="col-8">
                <input type="text" id="inputName" class="form-control">
              </div>
            </div>
  
            <div class="form-group d-flex justify-content-center">
              <label class="number col-3 text-white">전화번호 : </label>
              <div class="col-8">
                <input type="text" id="inputNumber" class="form-control" placeholder="010-0000-0000">
              </div>
            </div>
          </div>
          
          <button type="button" id="lookupBtn" class="btn bg-success text-white float-right mr-4">
            조회 하기
          </button>
        </div>

        <div class="col-3 d-flex justify-content-center align-items-center">
          <div class="text-white m-5">
            <h3>예약문의 :</h3>
            <h1>010-0000-1111</h1>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp" />

  </div>


  <script>

    $(document).ready(function() {
    	
    	$("#inputNumber").on("propertychange change keyup paste input", function() {
        	if ($(this).val().length > 14) {
        		alert("알맞은 형태의 번호를 입력하세요");
        		return ;
        	}
        });
    	
      // 유효성 검사
      $("#lookupBtn").on('click', function () {
		
        let inputName = $("#inputName").val();
		let inputPhoneNumber = $("#inputNumber").val();
		
        // 유효성 검사
        
        if (inputName == "") {
        	alert("이름 을 입력하세요");
        	return ;
        }
        
        if (inputPhoneNumber == "") {
	        alert("전화번호 를 입력하세요");
			return ;        	
        }
        
        if (!inputPhoneNumber.startsWith("010-")) {
        	alert("알맞은 형태의 번호를 입력하세요");
        	return ;
        }
        	
        $.ajax({
        	type:"post"
        	, url:"/ajax/booking/search"
        	, data:{"inputName":inputName, "inputPhoneNumber":inputPhoneNumber}
        	, dataType:"json"
        	, success:function(data) {
        		// {"result":true} or {"result":false}
        		// {"data":Booking}
        		if (data.result) {
        			var booking = data.data;
        			
        			alert("이름 : " + booking.name + "\n"
        					+ "날짜 : " + booking.date + "\n"
        					+ "일수 : " + booking.day + "\n"
        					+ "인원 : " + booking.headcount + "\n"
        					+ "상태 : " + booking.state);
        			
        		} else {
        			alert("조회 결과가 없습니다");
        		}
        		
        	}
        	, error:function() {
        		alert("조회 에러");
        	}
        	
        }); // ajax
        
    	// 조회 다른 풀이
        $.ajax({
        	type:"post"
        	, url:"/ajax/booking/find"
        	, data:{"inputName":inputName, "inputPhoneNumber":inputPhoneNumber}
        	, success:function(data) {
        		// 조회 안될 경우 = 비워진 경우
        		/*
        		if (data == "") {
        			alert("조회 실패");
        		} else {
        			alert("이름 : " + data.name
            				+ "\n날짜 : " + data.date.slice(0,10)
            				+ "\n숙박일수 : " + data.day
            				+ "\n숙박인원 : " + data.headcount
            				+ "\n상태 : " + data.state);	
        		}
        		*/
        		
        		if (data.result == "success") {
        			alert("이름 : " + data.data.name
            				+ "\n날짜 : " + data.data.date.slice(0,10)
            				+ "\n숙박일수 : " + data.data.day
            				+ "\n숙박인원 : " + data.data.headcount
            				+ "\n상태 : " + data.data.state);	
        		} else {
        			alert("조회 실패");
        		}
        	}
        	, error:function() {
        		alert("조회 에러");
        	}
        }); // ajax
        
      }); // lookupBtn

    }); 
    
  </script>
</body>
</html>

