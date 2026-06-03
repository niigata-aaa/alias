<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員メニュー</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	<%@ include file="header-user-id.jsp" %>
	
	<div class="background">
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

</div>
	<h2>会員メニュー</h2><%--select-part  --%>
	<div class="d3">
	<form action="select-part-servlet" method="POST">
		<input type="submit" value="参加者管理画面">
	</form>
	<form action="select-rest" method="POST">
		<input type="submit" value="飲食店検索画面">
	</form>
	<form action="seating-chart" method="POST">
		<input type="submit" value="配席画面">
	</form>
	<form action="money-check-box" method="POST">
		<input type="submit" value="割り勘・勘定管理画面">
	</form>
	<form action="logout" method="POST">
		<input type="submit" value="ログアウト">
	</form>
	<br>	
	<form action="withdraw-servlet" method="POST">
		<input type="submit" value="退会">
	</form>

	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>