<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規参加者登録</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
	String userName = (String) session.getAttribute("user_name");
	%>


		
	<%@ include file="header-logo.jsp"%>
	
	<div>
		<h2>新規参加者登録</h2>
		<a><%=userName %>さんの参加者</a><br>
		<a class="required">参加者登録できませんでした。</a>
	</div>
	
	<div>
		<form action="part-login.jsp" method="post">
			<input type="submit" value="参加者ログイン画面に戻る">
		</form>
	</div>

</body>
</html>