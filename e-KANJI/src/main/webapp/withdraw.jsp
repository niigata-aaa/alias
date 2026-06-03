<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退会画面</title>2
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>退会画面</h2><br>
退会するには、パスワードを入力してください。
<form action="withdraw-check-servlet" method="post">
パスワード：
			<input type="password" name="user_pass"><br>
			<input type="submit" value="退会">
</form>
<form action="top" method="POST">
			<input type="submit" value="トップ画面へ戻る">
</form>
</body>
</html>