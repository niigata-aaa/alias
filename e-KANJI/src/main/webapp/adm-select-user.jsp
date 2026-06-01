<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員一覧表示</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>


	<%
		String userId = (String)request.getAttribute("user_id");
		String userName = (String)request.getAttribute("user_name");
		String userStop = (String)request.getAttribute("user_stop");
		
		if (userId == null) userId = "";
		if (userName == null) userName = "";
	%>

	<%@ include file="adm-header-logo.jsp" %>
	<%@ include file="adm-header-user-id.jsp" %>

	<h1>会員一覧表示・検索画面</h1>
	<br>
	
	
	
	
	
	<%--検索機能 --%>
	<form action="adm-select-user" method="post">
		<table>
			<tr>
				<th>会員ID検索</th>
				<td><input type="text" name="user_id" value="<%=userId %>"></td>
			</tr>
			<tr>
				<th>名前検索</th>
				<td><input type="text" name="user_name" value="<%=userName %>"></td>
			</tr>
			<tr>
				<th>退会済会員のみ表示</th>
				<td><input type="checkbox" name="user_stop" value="1"
					<%= "1".equals(userStop) ? "checked" : "" %>></td>
			</tr>
		</table>
		<input type="submit" value="絞り込む">
	</form>
	
	
	
	<%--参加者一覧表示 --%>
	<%
		List<UserBean> userList= (List<UserBean>) request.getAttribute("userList");	
	%>
	
	<br><br>
	
	<table border=1>
		<tr>
			<th>会員ID</th>
			<th>名前</th>
			<th>状態</th>
			<th>削除</th>
		</tr>

		<%
			for (UserBean user : userList) {
		%>

		<tr>
			<td><%=user.getUserId()%></td>
			<td><%=user.getUserName()%></td>
			<td><%=user.getUserStop() == 1 ? "退会済" : "利用中" %></td>
			
			
			<td>
				<form action="adm-delete-user-check" method="POST">
					<input type="hidden" name="user_id" value="<%=user.getUserId()%>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		
		<%
			}
		%>

	</table>
</body>
</html>