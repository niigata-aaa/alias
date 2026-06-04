<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店情報追加エラー画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<h2>飲食店情報追加エラー</h2><br>

入力された情報に誤りがあります。<br>
もう一度入力してください。

	<form action="adm-top" method="post">
		<input type="submit" class="submit-top-right" value="管理者トップ画面へ戻る"><br>
		<input type="hidden" name="" >
	</form>
	
	<form action="adm-select-rest" method="post">
		<input type="submit" value="飲食店一覧表示・検索画面へ戻る">
		
	</form>
</body>
</html>