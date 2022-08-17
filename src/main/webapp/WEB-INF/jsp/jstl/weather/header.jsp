<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<style>
		
	.main-header {
		width: 200px;
		background-color: rgb(102,102,204);
		margin-right: 3;
	}
	
	header {
		width: 200px;
		height: 100px;
	}
	
	nav {
		width : 200px;	
	}
	
</style>

<div class="main-header">		
	<header>
		<a href="/jstl/weather/info" class="text-decoration-none">
			<div class="d-flex ml-3 mt-4">
				<img width="60px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/2048px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png">
				<div class="text-white ml-2"><h2>기상청</h2></div>
			</div>
		</a>
	</header>				
	<nav>
		<ul class="nav flex-column">
			<li class="nav-item"><a href="/jstl/weather/info" class="nav-link text-white">날씨</a></li>
			<li class="nav-item"><a href="/jstl/weather/input" class="nav-link text-white">날씨입력</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">관측기후</a></li>
		</ul>
	</nav>
</div>