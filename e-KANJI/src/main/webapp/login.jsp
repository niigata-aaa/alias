<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員ログイン画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	
	<div>
		<form action="insert-user.jsp" method="post">
			<input type="submit" value="新規会員登録はこちら">
		</form>
	</div>
	
	<div>
		<h2>会員ログイン</h2>
		<form action="login" method="post">
			ユーザID：
			<input type="text" name="user_id"><br>
			パスワード：
			<input type="password" name="user_pass"><br>
			<input type="submit" value="ログイン">
		</form>
	</div>
	
</body>
</html>