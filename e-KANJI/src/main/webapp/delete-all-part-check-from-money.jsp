<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一括削除画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="header-logo.jsp" %>
<h1>参加者情報一括削除</h1><br>

<form action="delete-all-part-ok-servlet" method="POST">
登録されている参加者情報をすべて削除します。<br>
よろしいですか？<br><br>

<input type="submit" value="すべて削除する"><br>
</form>
<br>
<form action="money-check-box" method="POST">
	<input type="submit" value="割り勘・集金管理画面へ戻る">
</form>

</body>
</html>