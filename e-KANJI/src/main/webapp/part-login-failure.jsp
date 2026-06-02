<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者ログイン失敗</title>
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	<h2>参加者ログイン</h2>
	入力されたIDの幹事が見つかりませんでした。<br>
	<form action="part-login.jsp" method="post">
		<input type="submit" value="参加者ログイン画面に戻る">
	</form>
</body>
</html>