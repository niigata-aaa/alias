<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%	
	UserBean user = (UserBean)request.getAttribute("user");
	String user_id = user.getUserId();
	String user_name = user.getUserName();
	String user_pass = user.getUserPass();
%>

	<%@ include file="header-logo.jsp"%>
	<div>
		<h2>新規会員登録</h2>
		以下の内容で会員登録しました。
	</div>
	
	<div>
		<table>
			<tr>
				<th>会員ID</th>
				<td><%=user_id %></td>
			</tr>
			<tr>
				<th>名前</th>
				<td><%=user_name %></td>
			</tr>
		</table>
	</div>
	
	<div>
		<a href="login.jsp">ログイン画面に戻る</a>
	</div>

</body>
</html>