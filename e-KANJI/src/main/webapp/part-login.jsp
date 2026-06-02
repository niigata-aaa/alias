<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者ログイン画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	
	<div>
		<form action="login.jsp" method="post">
			<input type="submit" value="幹事の方はこちら">
		</form>
	</div>
	
	<div>
		<h2>参加者ログイン</h2>
		<a>幹事から伝えられたIDを入力してください</a>
		<form action="part-login" method="post">
			<table>
				<tr>
				<th>ID：</th>
				<td><input type="text" name="user_id"></td>
				</tr>
			</table>
			<input type="submit" value="確認">
		</form>
	</div>
	
</body>
</html>