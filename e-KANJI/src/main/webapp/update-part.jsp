<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更画面</title>
<style>
.submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
</style>
</head>
<body>
    <form action="top" method="post">
        <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
    </form>
参加者情報変更画面<br>

	<jsp:useBean id="part" class="model.entity.PartBean" scope="session"/>
	<form action="update-part-check-servlet" method="post">
		コード：<jsp:getProperty name="part" property="code" /><br>
		氏名：<input type="text" name="name"
			value="<jsp:getProperty name="part" property="name" />"><br>
		年齢：<input type="text" name="age"
			value="<jsp:getProperty name="part" property="age" />"><br>
		部署：<input type="text" name="section"
			value="<jsp:getProperty name="part" property="section" />"><br>
		<input type="submit" value="変更する">
	</form>

	<form action="employee-detail-servlet" method="POST">
		<input type="hidden" name="code" value="<%=part.getCode()%>">
		<input type="submit" value="詳細表示画面に戻る">
	</form>

</body>
</html>