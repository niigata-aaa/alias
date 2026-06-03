<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<%@ include file="header-logo.jsp"%>
	
	<%	
	String userId = (String)request.getAttribute("user_id");
	String userName = (String)request.getAttribute("user_name");
	String userPass = (String)request.getAttribute("user_pass");
	
	if (userId == null) userId = "";
	if (userName == null) userName = "";
	if (userPass == null) userPass = "";
	%>
	
	
	<div>
		<h2>新規会員登録</h2>
		<span class="required">*は必須入力です</span><br><br>
		<form action="insert-user-check" method="post" class="insert-user"s>
			<table>
				<tr>
					<th>会員ID <span class="required">*</span></th>
					<td><input type="text" name="user_id" value="<%=userId %>" 
						maxlength="16" required></td>
				</tr>
				<tr>
					<th>名前 <span class="required">*</span></th>
					<td><input type="text" name="user_name" value="<%=userName %>" 
						maxlength="32" required></td>
				</tr>
				<tr>
					<th>パスワード <span class="required">*</span></th>
					<td><input type="password" name="user_pass" value="<%=userPass %>"
						 minlength="8" maxlength="255" required></td>
				</tr>
			</table>

			<input type="submit" value="登録">
		</form>	
	</div>
	
	<div>
		<form action="login.jsp" method="post">
			<input type="submit" value="ログイン画面に戻る">
		</form>
	</div>
</body>
</html>