<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>통나무 팬션</title>
  
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>  
  
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/ajax/booking/style.css" type="text/css">
  
</head>

<body>
  
  <div id="wrap">
  
    <jsp:include page="header.jsp" />

    <section>
      <article class="img">
        <img id="mainImg" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="메인 사진">
      </article>

      <div class="main-contents d-flex">
        <div class="col-4 d-flex justify-content-center align-items-center">
          <div class="display-4 text-white">
            실시간 <br> 예약하기
          </div>
        </div>

        <div class="reservation col-5">
          <div class="d-flex pt-4 text-white">
            <div class="col-4"><h4>예약 확인</h4></div>
            <label class="pr-3">회원
              <input type="radio" name="members" value="member" checked>
            </label>
            <label>비회원
              <input type="radio" name="members" value="non-member">
            </label>
          </div>
          <div id="memberInput" class="">
            <div class="form-group d-flex justify-content-center mt-3">
              <label class="id col-3 text-white">아이디 : </label>
              <div class="col-8">
                <input type="text" id="inputId" class="form-control">
              </div>
            </div>
  
            <div class="form-group d-flex justify-content-center">
              <label class="pw col-3 text-white">비밀번호 : </label>
              <div class="col-8">
                <input type="password" id="inputPw" class="form-control">
              </div>
            </div>
          </div>

          <div id="nonMemberInput" class="d-none">
            <div class="form-group d-flex justify-content-center mt-3">
              <label class="name col-3 text-white">이름 : </label>
              <div class="col-8">
                <input type="text" id="inputName" class="form-control">
              </div>
            </div>
  
            <div class="form-group d-flex justify-content-center">
              <label class="number col-3 text-white">전화번호 : </label>
              <div class="col-8">
                <input type="text" id="inputNumber" class="form-control">
              </div>
            </div>
  
            <div class="form-group d-flex justify-content-center">
              <label class="date col-3 text-white">날짜 : </label>
              <div class="col-8">
                <input type="text" id="inputDate" class="form-control" >
              </div>
            </div>
          </div>


          <button type="button" id="lookupBtn" class="btn bg-success text-white float-right mr-4">
            조회 하기
          </button>
        </div>

        <div class="col-3 d-flex justify-content-center align-items-center">
          <div class="text-white m-5">
            <h3>
              예약문의 :
            </h3>
            <h1>
              010-0000-1111
            </h1>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp" />

  </div>


  <script>

    $(document).ready(function() {

      // 회원 비회원
      $("input[name='members']").on('change', function() {

        if ($(this).val() == 'member') {
          $("#memberInput").removeClass('d-none');
          $("#nonMemberInput").addClass('d-none');
        } else {
          $("#memberInput").addClass('d-none');
          $("#nonMemberInput").removeClass('d-none');
        }
      });

      // 날짜
      $("#inputDate").datepicker({
        minDate:0,
        dateFormat:'yy년 mm월 dd일'
      });

      // 유효성 검사
      $("#lookupBtn").on('click', function () {
        // 회원
        if ($("input[name='members']:checked").val() == 'member') {
          let memberInfo = {};
          memberInfo['아이디'] = $("#inputId").val();
          memberInfo['비밀번호'] = $("#inputPw").val();

          // 필드가 비어있는 경우
          for(let key in memberInfo) {
            if (memberInfo[key] == '') {
              alert(key + '를 입력하세요');
              return;
            }
          }
          alert('아이디 ' + memberInfo['아이디'] + ' 회원님'
                  + '\n예약을 조회합니다.');
        }
        // 비회원
        else {
          let nonMemberInfo = {};
          nonMemberInfo['이름'] = $("#inputName").val();
          nonMemberInfo['전화번호'] = $("#inputNumber").val();
          nonMemberInfo['날짜'] = $("#inputDate").val();

          // 필드가 비어있는 경우
          for(let key in nonMemberInfo) {
            if (nonMemberInfo[key] == '') {
              if (key == '이름') {
                alert(key + '을 입력하세요');
                return;
              } else {
                alert(key + '를 입력하세요');
                return;
              }
            }
          }

          // 전화번호 010 으로 시작
          if (!nonMemberInfo['전화번호'].startsWith('010')) {
            alert('010 으로 시작하는 번호만 입력 가능합니다.');
            return;
          }

          alert('비회원 ' + nonMemberInfo['이름'] + ' 님'
                  + '\n예약을 조회합니다.');
        }
      });


    });
  </script>
</body>
</html>

