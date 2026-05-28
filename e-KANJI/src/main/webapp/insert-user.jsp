<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="header-logo.jsp"%>
	<div>
		<h2>新規会員登録</h2>
		<form action="insert-user" method="post">
			<table>
				<tr>
					<th>会員ID</th>
					<td><input type="text" name="user_id"></td>
				</tr>
				<tr>
					<th>名前</th>
					<td><input type="text" name="user_name"></td>
				</tr>
				<tr>
					<th>パスワード</th>
					<td><input type="password" name="user_pass"></td>
				</tr>
			</table>

			<input type="submit" value="登録">
		</form>	
	</div>
	
	<div>
		<a href="login.jsp">ログイン画面に戻る</a>
	</div>

</body>
</html>