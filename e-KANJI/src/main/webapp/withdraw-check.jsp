<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退会確認画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>退会確認</h2>
<div class="d5">
<form action="withdraw-check-servlet" method="POST">
退会してよろしいですか？<p>
<input type="submit" value="確認">
</form>
<form action="top" method="POST">
<input type="submit" value="トップ画面へ戻る">
</form>
</div>
</body>
</html>