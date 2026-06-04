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
<%@ include file="header-logo.jsp" %>
<%	
	String userId = (String)request.getAttribute("user_id");
	String userName = (String)request.getAttribute("user_name");
	String userPass = (String)request.getAttribute("user_pass");
%>

	<div class="center">
		<h2>新規会員登録</h2>
		以下の内容で新規会員登録を行いますか？
	</div>
	
	<div class="formArea">
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
		<form action="insert-user" method="post">
			<input type="hidden" name="user_id" value="<%=userId %>">
			<input type="hidden" name="user_name" value="<%=userName %>">
			<input type="hidden" name="user_pass" value="<%=userPass %>">
			<input type="submit" value="登録">
		</form>
	</div>
	
	<div>
		<form action="insert-user-form" method="post">
			<input type="hidden" name="user_id" value="<%=userId %>">
			<input type="hidden" name="user_name" value="<%=userName %>">
			<input type="hidden" name="user_pass" value="<%=userPass %>">
			<input type="submit" value="戻る">
		</form>
	</div>
	


</body>
</html>