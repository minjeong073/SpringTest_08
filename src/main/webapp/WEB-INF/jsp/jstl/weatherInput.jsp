<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
</head>
<body>

	<div>
		
		<h2>날씨 입력</h2>
		
		<form method="post" action="/jstl/weather/add">
		
			<div>
				<label>날짜</label> <input type="text">
				<label>날씨</label> 
				<select>
					<option>맑음</option>
					<option>구름조금</option>
					<option>흐림</option>
					<option>비</option>
				</select>
				<label>미세먼지</label>
				<select>
					<option>좋음</option>
					<option>보통</option>
					<option>나쁨</option>
					<option>최악</option>			
				</select>
			</div>
			
			<div>
				<label>날짜</label> <input>
				<label>날짜</label> <input>
				<label>날짜</label> <input>
			</div>
		
		</form>
		
	
	</div>

	

</body>
</html>