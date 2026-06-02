<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更エラー画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>参加者情報変更エラー</h2><br>

入力された情報に誤りがあります。<br>
もう一度入力してください。


<form action="update-part-servlet" method="post">
<input type="submit" value="参加者情報変更画面へ戻る"><br>
</form>

</body>
</html>