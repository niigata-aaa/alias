<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>幹事確認</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>

	<%
	String userId = (String) request.getAttribute("user_id");
	String userName = (String) request.getAttribute("user_name");
	%>


	<%@ include file="header-logo.jsp"%>
	
	
	<h2>
		あなたの幹事は<%=userName %>さんですか？
	</h2>
	<br>
	<form action="part-insert-form" method="POST">
		<input type="hidden" name="user_id" value="<%=userId %>">
		<input type="hidden" name="user_name" value="<%=userName %>">
		<input type="submit" value="はい">
	</form>
	<br>
	<form action="part-login.jsp" method="POST">
		<input type="submit" value="いいえ">
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>