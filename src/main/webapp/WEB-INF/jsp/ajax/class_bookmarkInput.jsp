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

</head>
<body>
	
	<%-- form tag 일 경우 입력 과정에서 문제 발생 시 확인하기 어렵고
	문제가 발생해도 설정해둔 페이지로 넘어가기 때문에 사용자 입장에서 자연스럽지 못하기 때문에
	ajax 를 사용해서 문제 발생 시 다음 페이지로 넘어가지 않고 멈추도록 함 --%>
	
	<div class="container">
	
		<h2>즐겨찾기 추가하기</h2>	
		<a class="btn btn-secondary float-right" href="/ajax/class/bookmark/list">목록</a>
		<br>
		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control" id="titleInput" name="name" >
			<label>주소</label> <input type="text" class="form-control" id="urlInput" name="url">
			<button class="btn btn-success form-control mt-3" type="button" id="addBtn">추가</button>
		</div>
		
	</div>
	
	
	<script>
		
		$(document).ready(function() {
			
			$("#addBtn").on("click", function() {
				
				let title = $("#titleInput").val();
				let url = $("#urlInput").val();
				
				// api 로 데이터 전달 받기 전에 유효성 검사 먼저
				// http , https 로 시작하지 않는 것 체크
				
				
				if (title == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if (url == "") {
					alert("주소를 입력하세요");
					return ;
				}
				
				if (!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소 형식이 잘못되었습니다");
					return ;
				}
				
				// api 호출 - ajax 사용
				$.ajax({
					
					type:"post"
					, url:"/ajax/class/bookmark/add"
					, data:{"name":title, "url":url}
					, success:function(data) {
						// resp 로 전달된 데이터를 받아와 
						// 해당 param 의 데이터에 전달됨
						// js 기반 ajax : 문자열로 받아옴
						// jquery 가 json 문자열 형태를 인식하고 json 객체로 변환
						// {"result":"success"} or {"result":"fail"}
						
						if (data.result == "success") {
							location.href = "/ajax/class/bookmark/list";
						} else {
							alert("저장 실패");
						}
					}
					, error:function() {
						alert("에러 발생");
					}
				});
				
				
			});
		});
	
	</script>

</body>
</html>