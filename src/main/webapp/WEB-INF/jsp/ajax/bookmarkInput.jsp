<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>

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

<style>
	.hidden {
		display:none;
	}
</style>
</head>
<body>

	<div class="container">
	
		<h2>즐겨찾기 추가하기</h2>	
		<a class="btn btn-secondary float-right" href="/ajax/bookmark/list">목록</a>
		<br>
		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control" id="nameInput" name="name" >
			<label>주소</label>
			<div class="d-flex">
				<input type="text" class="form-control" id="urlInput" name="url">
				<button type="button" id="checkBtn" class="btn btn-info ml-3">중복확인</button>
			</div>
			<span class="text-sm-left text-danger hidden" id="duplicateStr">중복된 url 입니다</span>
			<span class="text-sm-left text-info hidden" id="possibleStr">저장 가능한 url 입니다</span>
			<button type="submit" id="addBtn" class="btn btn-success form-control mt-3">추가</button>
		</div>
		
	</div>
	
	
	<script>
		
		$(document).ready(function() {
			
			$("#checkBtn").on("click", function() {
				
				let url = $("#urlInput").val();
				
				if (url == "") {
					alert("주소를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/ajax/bookmark/is_duplicate"
					, data:{"url":url}
					// resp 결과 처리
					, success:function(data) {
						// {"is_duplicate":true} or {"is_duplicate":false} 
						if (data.is_duplicate) {
							$("#duplicateStr").removeClass("hidden");
							$("#possibleStr").addClass("hidden");
						}
						else {
							$("#duplicateStr").addClass("hidden");
							$("#possibleStr").removeClass("hidden");
						}
					}
					, error:function() {
						alert("중복 확인 에러 발생");
					}
				});
				
			});
			
			
			$("#addBtn").on("click", function() {
				
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				<%-- 유효성 검사 --%>
				
				if (name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if (url == "") {
					alert("주소를 입력하세요");
					return ;
				}
				
				if (!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소값이 유효하지 않습니다");
					return ;
				}
				
				// url 이 중복될 경우 추가 되지 않도록
				if ($("#duplicateStr").is(":visible")) {
					alert("중복된 url 입니다");
					return;
				}
				
				<%-- form --%>
				$.ajax({
					type:"get"
					, url:"/ajax/bookmark/add"
					, data:{"name":name, "url":url}
					, success:function(data) {
						
						if (data.result == "success") {
							location.href = "/ajax/bookmark/list";
						}
						else {
							alert("저장 실패");
						}
					}
					, error:function() {
						alert("저장 에러");
					}
					
				});
				
			});
			
		});
		
	
	</script>

</body>
</html>