<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録エラー画面</title>
</head>
<body>
<%@ include file="header-logo.jsp"%>
	<div>
		<h2>参加者登録画面</h2>
		参加者情報登録ができませんでした。
	</div>
	<%
String msg = (String)request.getAttribute("errorMessage");
if(msg != null){
%>
    <p>エラー内容：<%= msg %></p>
<%
}
%>

<br>
	<div>
		<a href="insert-part.jsp">参加者登録画面に戻る</a>
	</div>

</body>
</html>