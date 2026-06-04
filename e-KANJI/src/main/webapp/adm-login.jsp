<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="adm-header-logo.jsp" %>
	
	<h2>管理者ログイン</h2>
	<div class="formArea">
		
		<form action="adm-login" method="post">
			<table>
			<tr>
			<th>ユーザID：</th>
			<td><input type="text" name="adm_id"><td>
			</tr>
			<tr>
			<th>パスワード：</th>
			<td><input type="password" name="adm_pass"></td>
			</tr>
			</table>
			<input type="submit" value="ログイン">
		</form>
	</div>
	
</body>
</html>