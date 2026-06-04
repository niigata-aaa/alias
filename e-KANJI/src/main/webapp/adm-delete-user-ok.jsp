<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員削除完了</title>
<link rel="stylesheet" href="css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<h2>会員情報削除完了</h2>
	<br> 以下の会員情報を削除しました。
	<br>

	<%
	UserBean user = (UserBean) request.getAttribute("user");
	%>


	<div class="formArea">
		<form action="adm-select-user" method="post">


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
					<td><%=user.getUserStop() == 1 ? "退会済" : "利用中"%></td>
				</tr>

			</table>


			<input type="submit" value="戻る">
		</form>
	</div>


</body>
</html>
