<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者メニュー</title>
</head>
<body>
	<%@ include file="adm-header-logo.jsp" %>
	<%@ include file="adm-header-user-id.jsp" %>
	<h2>メニュー</h2>
	
	<form action="adm-select-rest" method="POST">
		<input type="submit" value="飲食店管理画面">
	</form>
	
	<form action="adm-select-user" method="POST">
		<input type="submit" value="会員管理画面">
	</form>
	
	<form action="adm-logout" method="POST">
		<input type="submit" value="ログアウト">
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>