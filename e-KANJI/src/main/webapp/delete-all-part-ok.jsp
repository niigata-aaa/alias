<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報一括削除完了画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>参加者情報一括削除完了</h2>
<form action="select-part-servlet" method="POST">
登録していた参加者情報をすべて削除しました。<br>
<input type="submit" value="参加者一覧表示・検索画面へ戻る">
</form>
</body>
</html>