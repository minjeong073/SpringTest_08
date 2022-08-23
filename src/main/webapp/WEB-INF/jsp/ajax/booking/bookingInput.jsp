<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>

<!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
<!-- jQuery cdn -->
	<script 
		src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
	</script>
	
<!-- jQuery ui css -->	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery ui js -->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<!-- css -->
<link rel="stylesheet" href="/css/ajax/booking/style.css" type="text/css">
  
</head>
<body>
	
	<div class="wrap">
		
		<jsp:include page="header.jsp" />
		
		<section class="container">
			<h2 class="text-center">예약하기</h2>
			
			<div class="form-group">
				<label>이름</label> 
				<input type="text" class="form-control" id="nameInput">
				<label>예약날짜</label> 
				<input type="text" class="form-control" id="dateInput" placeholder="yyyy-MM-dd">
				<label>숙박일수</label> 
				<input type="text" class="form-control" id="dayInput">
				<label>숙박인원</label>
				<input type="text" class="form-control" id="headcountInput">
				<label>전화번호</label> 
				<input type="text" class="form-control" id="phoneNumberInput">
				<button class="btn btn-warning form-control mt-3" id="bookingBtn">예약하기</button>			
			</div>
		
		</section>
		
		<jsp:include page="footer.jsp" />
	
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#bookingBtn").on("click", function() {
				
				let nameInput = $("#nameInput").val();
				let dateInput = $("#dateInput").val();
				let dayInput = $("#dayInput").val();
				let headcountInput = $("#headcountInput").val();
				let phoneNumberInput = $("#phoneNumberInput").val();
				
				// 유효성 검사
				if (nameInput == "") {
					alert("이름 을 입력하세요");
					return ;
				}
				
				if (dateInput == "") {
					alert("예약날짜 를 입력하세요");
					return ;
				}
				
				if (dayInput == "") {
					alert("숙박일수 를 입력하세요");
					return ;
				}
				
				if (headcountInput == "") {
					alert("숙박인원 을 입력하세요");
				}
				
				if (phoneNumberInput == "") {
					alert("전화번호 를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/ajax/booking/add"
					, data:{"name":nameInput, "date":dateInput, "day":dayInput
						, "headcount":headcountInput, "phoneNumber":phoneNumberInput}
					, success:function(data) {
						if (data.result) {
							alert("예약 성공");
							location.href = "/ajax/booking/list";							
						} else {
							alert("예약 실패");
						}
					}
					, error:function() {
						alert("예약 에러");
					}
				});
			});
			
			$("#dateInput").datepicker({
				dateFormat:"yyyy-MM-dd"
			});
			
		});
		
	</script>

</body>
</html>