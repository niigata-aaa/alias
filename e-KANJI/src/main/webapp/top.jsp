<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員メニュー</title>
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	<%@ include file="header-user-id.jsp" %>
	<h2>会員メニュー</h2><%--select-part  --%>
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
	<%@ include file="footer.jsp" %>
</body>
</html>