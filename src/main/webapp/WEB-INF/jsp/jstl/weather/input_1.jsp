<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력화면</title>

	<!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
	section {
	margin: 5;
	width: 800px;
	height: 500px;
	}
</style>

</head>
<body>

	<div class="container">
		<div class="d-flex">
		
			<jsp:include page="header.jsp" />

			<section>
				<br>
				
				<h2 class="m-4">날씨 입력</h2>
				
				<form method="get" action="/jstl/weather/add2" class="form-group">
				
					<div class="d-flex justify-content-between m-3">
						<div>
							<label>날짜</label>
							<input type="text" class="form-control" id="date" name="date">
						</div>
						
						<div class="w-25">
							<label>날씨</label> 
							<select name="weather" class="form-control">
								<option value="맑음">맑음</option>
								<option value="구름조금">구름조금</option>
								<option value="흐림">흐림</option>
								<option value="비">비</option>
							</select>
						</div>
						
						<div class="w-25">
							<label>미세먼지</label>
							<select name="microDust" class="form-control">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>			
							</select>
						</div>
						
					</div>
					
					<div class="d-flex justify-content-between m-3">
						<div class="w-25">
							<label>기온</label>
							<div class="input-group">						
								<input type="text" name="temperatures" class="form-control" placeholder="예) 23.5"> 
								<button class="btn btn-secondary input-group-append" disabled>℃</button>
							</div>				
						
						</div>
						
						<div class="w-25">						
							<label>강수량</label> 
							<div class="input-group">
								<input type="text" name="precipitation" class="form-control" placeholder="예) 16.5">
								<button class="btn btn-secondary input-group-append" disabled>mm</button>
							</div>
						</div>
						
						<div class="w-25">						
							<label>풍속</label> 
							<div class="input-group">
								<input type="text" name="windSpeed" class="form-control" placeholder="예) 2.5">
								<button class="btn btn-secondary input-group-append" disabled>km/h</button>
							</div>
						</div>
						
					</div>
					<div class="float-right">
						<button type="submit" class="btn btn-success right">저장</button>					
					</div>
				</form>
			
			</section>
		</div>
		
		<jsp:include page="footer.jsp" />
		
	
	</div>

	<script>
		$(document).ready(function() {			
			$("date").datepicker({
				// dateFormat:"yy-mm-dd" // 형태여야 Weather 객체에 저장됨
				
				// controller의 requestParam 에 (2022-08-16) String 형태로 전달
				// -> dao 통해 mapper 에서 #{date} 에 해당 String 이 전달
				// mysql 에서 연월일을 - 로 구분하기 때문에 이 형식을 맞춘 String 형태면 date 타입으로 전달이 됨
				
				// 다른 형식으로 지정할 경우
				// @RequestParam("date") 위에 @DateTimeFormat(pattern="yyyy년 MM월 dd일") 지정해줘야함
				dateFormat:"yy년 mm월 dd일"
				
			});
		});
		
	</script>
</body>
</html>