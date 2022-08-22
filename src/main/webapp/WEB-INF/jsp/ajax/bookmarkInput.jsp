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
			<span class="text-sm-left text-danger d-none" id="duplicateStr">중복된 url 입니다</span>
			<span class="text-sm-left text-info d-none" id="possibleStr">저장 가능한 url 입니다</span>
			<button type="submit" id="addBtn" class="btn btn-success form-control mt-3">추가</button>
		</div>
		
	</div>
	
	
	<script>
		
		$(document).ready(function() {
			// 전역변수 : 어떤 함수든 사용할 수 있도록
			// 최소화하는 것이 좋음 (유지보수 어려움)
			
			// 중복 체크 확인 상태 저장 변수
			var isCheck = false;
			
			// 중복 상태 저장 변수
			var isDuplicateUrl = true;
			
			<%-- 주소 값 변경 시 중복 확인 초기화 --%>
			$("input").on("propertychange change keyup paste input", function() {
				
				isCheck = false;
				isDuplicateUrl = true;

				$("#duplicateStr").addClass("d-none");
				$("#possibleStr").addClass("d-none");
				
			});
			
			<%-- 중복확인 버튼 --%>
			$("#checkBtn").on("click", function() {
				
				let url = $("#urlInput").val();
				
				<%-- 유효성 검사 --%>
				
				if (url == "") {
					alert("주소를 입력하세요");
					return ;
				}
				
				if (!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소값이 유효하지 않습니다");
					return ;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/ajax/bookmark/is_duplicate"
					, data:{"url":url}
					// resp 결과 처리
					, success:function(data) {
						
						// 중복 체크 한 이후(true)에 추가 버튼을 누르면 다음 코드 실행되도록
						isCheck = true;
						
						// {"is_duplicate":true} or {"is_duplicate":false} 
						if (data.is_duplicate) {
							isDuplicateUrl = true;
							$("#duplicateStr").removeClass("d-none");
							$("#possibleStr").addClass("d-none");
						}
						else {
							isDuplicateUrl = false;
							$("#duplicateStr").addClass("d-none");
							$("#possibleStr").removeClass("d-none");
						}
					}
					, error:function() {
						alert("중복 확인 에러 발생");
					}
				});
				
			});
			
			
			<%-- 추가하기 버튼 --%>
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
				
				<%-- 중복 체크 여부 확인 --%>
				if (!isCheck) {
					alert("중복 확인 해주세요");
					return ;
				}
				
				<%-- 중복 상태 여부 확인 --%>
				if (isDuplicateUrl) {
					alert("중복된 url 입니다");
					return ;
				}
				

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