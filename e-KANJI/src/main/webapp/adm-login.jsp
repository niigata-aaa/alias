<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="adm-header-logo.jsp" %>
	
	<div>
		<h2>管理者ログイン</h2>
		<form action="adm-login" method="post">
			ユーザID：
			<input type="text" name="adm_id"><br>
			パスワード：
			<input type="password" name="adm_pass"><br>
			<input type="submit" value="ログイン">
		</form>
	</div>
	
</body>
</html>