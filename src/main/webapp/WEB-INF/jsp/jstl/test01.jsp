<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl Core 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 1</title>
</head>
<body>

	<h2> 1. JSTL core 변수 </h2>
	
	<c:set var="num1" value="36" />
	<c:set var="num2" value="3" />
	
	<h4>첫번째 숫자 : ${num1 }</h4>
	<h4>두번째 숫자 : ${num2 }</h4>
	
	
	<br>
	
	<h2> 2. JSTL core 연산</h2>
	 
	<h4>더하기 : ${num1 + num2 }</h4>
	<h4>빼기 : ${num1 - num2}</h4>
	<h4>곱하기 : ${num1 * num2 }</h4>
	<h4>나누기 : ${num1 / num2 }</h4>
	 
	<!-- 
	 <c:set var="sum" value="${num1 + num2 }" />
	 <h4>더하기 : ${sum }</h4>
	 -->
	
	
	<br>
	
	<h2>3. JSTL core out</h2>
	
	<c:out value="<title>core out</title>" />
	
	
	<br>
	
	<h2>4. JSTL core if </h2>
	<c:set var="avg" value="${(num1 + num2) / 2 }" />
	
	<c:if test="${avg >= 10}">
		<h1>${avg }</h1>
	</c:if>
	
	<c:if test="${avg < 10}">
		<h3>${avg }</h3>
	</c:if>
	
	
	<br>
	
	<h2>5. core if </h2>
	
	<c:if test="${num1 * num2 > 100 }">	
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
		
		<%-- c:out 쓰는 이유 --%>
		<%-- <script>alert('너무 큰 수 입니다.')</script> 로 해도 되지만
		html, script 가 실행되면 위험하고,
		개행문자 파싱의 차이,
		엄격한 태그 규칙,
		보안성
		등의 이유로 <c:out> 을 사용  --%>
		
	</c:if>
		
	
</body>
</html>