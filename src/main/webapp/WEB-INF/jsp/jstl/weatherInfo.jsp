<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl Core 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- jstl Function 라이브러리 -->    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
	.wrap {
		width: 1200px;
		height: 800px;
	}
	
	header {
		width: 200px;
		height: 100px;
	}
	
	nav {
		width : 200px;
		height: 550px;
	}
	
	section {
		width: 1000px;
		height: 650px;
	}
	
	footer {
		width: 1200px;
		height: 100px;
	}
	
	.footerImg {
		
		opacity: 0.5;
	}
	
</style>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
</head>
<body>

	<div class="wrap bg-warning">
		<div class="d-flex">		
			<div class="head">		
				<header class="bg-primary">
				<img width="200px" src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTxmeD%2FbtqCKArBvPm%2F2tzfJfINwg0WWmCzC4jKW0%2Fimg.jpg">
				</header>		
				<nav class="bg-success">
					<ul class="nav flex-column">
						<li class="nav-item"><a href="#" class="nav-link text-white">날씨</a></li>
						<li class="nav-item"><a href="/jstl/weatherInput" class="nav-link text-white">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-white">관측기후</a></li>
					</ul>
				</nav>
			</div>
			<section class="bg-danger">
				
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="weather" items="${weatherList }">
						<tr>
							<td>${weather.date }</td>
							
							<td>
							${weather. }
							</td>
							
							<td>${weather.temperatures }℃</td>
							<td>${weather.precipitation }</td>
							<td>${weather.microDust }</td>
							<td>${weather.windSpeed }</td>
						</tr>
					
					</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer class="bg-dark d-flex align-items-center">
			<img class="footerImg" width="200px" height="100px" src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTxmeD%2FbtqCKArBvPm%2F2tzfJfINwg0WWmCzC4jKW0%2Fimg.jpg">
			<div class="text-secondary ">
				(07062) 서울시 동작구 여의대방로16길 61 <br>
				Copyright@2022 KMA. All Rights RESERVED.				
			</div>
		</footer>
	
	</div>
	
</body>
</html>