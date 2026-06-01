<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.UserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員削除確認</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h2>会員情報削除</h2><br>
	以下の会員情報を削除してもよろしいですか？<br>
	
	<%
	UserBean user = (UserBean) request.getAttribute("user");
	String userId = user.getUserId();
	%>
	
	<form action="adm-delete-user" method="post">

		<table>
			<tr>
				<th>会員ID</th>
				<td><%=user.getUserId()%></td>
			</tr>
			<tr>
				<th>名前</th>
				<td><%=user.getUserName()%></td>
			</tr>
			<tr>
				<th>状態</th>
				<td><%=user.getUserStop() == 1 ? "退会済" : "利用中" %></td>
			</tr>
		</table>
		
		<input type="hidden" name="user_id" value="<%=user.getUserId()%>">

	<input type="submit" value="削除"><br>
	</form>
	
	<form action="select-part-servlet" method="post">
	<input type="submit" value="戻る">
	</form>
</body>
</html>
