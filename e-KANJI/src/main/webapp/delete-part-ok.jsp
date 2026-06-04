<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報削除完了画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
<style>
table {
	border: 2px solid #000;
	text-align: center;
	margin: 0 auto;
	/* ← これを追加：上下マージン0、左右マージンを自動調整して中央配置 */
	background-color: rgb(255, 255, 255);
}
</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
<%
PartBean bean = (PartBean) request.getAttribute("bean");
%>

以下の参加者情報を削除が完了しました。<br>

<form action="select-part-servlet" method="post">
<table>
	<tr><th>会員ID</th><td><%=bean.getPartID() %></td></tr>
    <tr><th>参加者ID</th><td><%=bean.getUserID() %></td></tr>
    <tr><th>氏名（漢字）</th><td><%=bean.getPartName() %></td></tr>
    <tr><th>氏名（かな）</th><td><%=bean.getPartRuby() %></td></tr>
    <tr><th>性別</th><td><%=bean.getPartGender() %></td></tr>
    <tr><th>年齢</th><td><%=bean.getPartAge() %></td></tr>
    <tr><th>役職</th><td><%=bean.getPartPost() %></td></tr>
    <tr><th>入社年度</th><td><%=bean.getPartEmpyear() %></td></tr>
    <tr><th>アレルギー</th><td><%=bean.getPartAllergy() %></td></tr>
    <tr><th>食べ物の好み</th><td><%=bean.getPartGenre() %></td></tr>
    <tr><th>好きな料理のカテゴリ</th><td><%=bean.getPartCategory() %></td></tr>
    <tr><th>好きなビールの種類</th><td><%=bean.getPartBeer() %></td></tr>
    <tr><th>予算</th><td><%=bean.getPartBudget() %></td></tr>
    <tr><th>タバコ</th><td><%=bean.getPartSmoke() %></td></tr>
</table>
<input type="submit" value="参加者一覧表示・検索画面へ戻る"><br>
</form>
</body>
</html>