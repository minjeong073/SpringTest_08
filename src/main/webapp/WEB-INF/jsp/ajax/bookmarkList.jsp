<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl Core 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

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

</head>
<body>

	<div class="container">
	
		<h2>즐겨찾기 목록</h2>
		
		<a class="btn btn-secondary float-right" href="/ajax/bookmark/input">추가</a>
		<br>
		
		<table class="table text-center mt-4">
		
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="bookmark" items="${bookmarkList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${bookmark.name }</td>
					<td><a href="${bookmark.url }" target="_blank"> ${bookmark.url } </a></td>
					<td><button type="button" class="btn btn-danger removeBtn" data-bookmark-id="${bookmark.id }">삭제</button></td>
				</tr>
			
			</c:forEach>
			</tbody>
		
		</table>
	
	</div>
	
	<script>
		
		// class 속성을 활용해서 이벤트 등록하기 (여러 버튼에 같은 이벤트 등록하기 위해)
		// 현재 이벤트가 발생한 버튼 객체 가져오기 $(this)
		// 해당 버튼 객체에 삭제 대상 id 가 포함되어 있어야 한다 (data 속성)
		// data-'변수명'="" : 원하는 변수명을 넣어 "" 안의 값 저장해서 사용
		
		// el, jstl : server 에서
		// js : 다 만들어진 html (client) 에서 
	
		$(document).ready(function() {
			
			<%-- 삭제 버튼 --%>
			$(".removeBtn").on("click", function() {
				// data 속성의 변수명에 해당하는 tag 의 data 값 가져옴
				let bookmarkId = $(this).data("bookmark-id");
				
				$.ajax({
					type:"get"
					, url:"/ajax/bookmark/remove"
					, data:{"id":bookmarkId}
					, success:function(data) {
						// {"result":true} or {"result":false}
						if (data.result) {
							alert("삭제되었습니다");
							// 현재 페이지 새로고침
							location.reload();
							// location.href = "/ajax/bookmark/list";
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 오류 발생");
					}
					
				});
				
			});
		});
	
	</script>
	
</body>
</html>