<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl Core 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jstl Format 라이브러리 -->    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>

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
				
				<form method="post" action="/jstl/weather/add" class="form-group">
				
					<div class="d-flex justify-content-between m-3">
						<div>
							<label>날짜</label>
							<input type="date" class="form-control" name="date" value="<fmt:formatDate value="${date }" pattern="yyyyMMdd"/>">
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

	

</body>
</html>