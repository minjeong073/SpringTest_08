<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl Core 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jstl Fmt 라이브러리 -->    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>

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

<!-- css -->
<link rel="stylesheet" href="/css/ajax/booking/style.css" type="text/css">

</head>
<body>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		
		<section class="text-center mt-3">
			<h1>예약 목록 보기</h1>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="client" items="${bookingList }">
					<tr>
						<td>${client.name }</td>
						<td><fmt:formatDate value="${client.date }" pattern="yyyy년 M월 d일"/></td>
						<td>${client.day }</td>
						<td>${client.headcount }</td>
						<td>${client.phoneNumber }</td>
						<c:choose>
							<c:when test="${client.state eq '대기중'}">
							<td class="text-info">${client.state }</td>
							</c:when>
							<c:when test="${client.state eq '확정' }">
							<td class="text-success">${client.state }</td>
							</c:when>
						</c:choose>
						<td><button class="btn btn-danger delete-btn" data-client-id="${client.id }">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</section>
	
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		
	$(document).ready(function() {
		
		
		// 삭제 버튼
		$(".delete-btn").on("click", function() {
			
			let clientId = $(this).data("client-id");
			
			$.ajax({
				type:"get"
				, url:"/ajax/booking/delete"
				, data:{"clientId":clientId}
				, success:function(data) {
					if (data.result == "success") {
						alert("삭제 되었습니다");
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
		});
		
	});
	</script>

</body>
</html>