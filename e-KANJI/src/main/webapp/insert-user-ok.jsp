<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<%	
	UserBean user = (UserBean)request.getAttribute("user");
	String userId = user.getUserId();
	String userName = user.getUserName();
	String userPass = user.getUserPass();
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
				<td><%=userId %></td>
			</tr>
			<tr>
				<th>名前</th>
				<td><%=userName %></td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td>
		        <%
					for(int i = 0; i < userPass.length(); i++){
		        %>
					*
				<%
		        	}
		        %>
    			</td>
			</tr>
		</table>
	</div>
	
	<div>
		<a href="login.jsp">ログイン画面に戻る</a>
	</div>

</body>
</html>