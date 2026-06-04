<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店削除失敗</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="adm-header-logo.jsp" %>
	<h2>飲食店削除失敗</h2>
	削除に失敗しました。<br>
	
	<form action="adm-select-rest" method="post">
		<input type="submit" value="飲食店一覧画面に戻る">
	</form>
</body>
</html>