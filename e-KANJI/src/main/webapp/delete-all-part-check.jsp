<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一括削除画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>参加者情報一括削除</h1><br>

<form action="delete-all-part-ok-servlet" method="POST">
登録されている参加者情報をすべて削除します。<br>
よろしいですか？<br><br>

<input type="submit" value="すべて削除する"><br>
</form>
<br>
<form action="select-part-servlet" method="POST">
<input type="submit" value="参加者一覧表示・検索画面へ戻る">
</form>

</body>
</html>