<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報削除エラー画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>参加者情報削除エラー</h2><br>

削除に失敗しました。<br>
もう一度やり直してください。

<form action="select-part-servlet" method="post">
<input type="submit" value="参加者一覧表示・検索画面へ戻る"><br>
</form>
</body>
</html>