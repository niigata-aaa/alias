<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員ログイン画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Hachi+Maru+Pop&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	
	<div class="d1">
		<h2>会員ログイン</h2>
		<form action="login" method="post">
		<span class="form-row">
			<label>ユーザID：</label>
			<input type="text" name="user_id">
		</span><br>
		<span class="form-row">
			<label>パスワード：</label>
			<input type="password" name="user_pass">
		</span>
			<p>
			<input type="submit" value="ログイン">
		</div>
		<div class="d2">
		<form action="insert-user.jsp" method="post">
			<input type="submit" value="新規会員登録はこちら">
		</form>
		</div>
		</form>

	
</body>
</html>