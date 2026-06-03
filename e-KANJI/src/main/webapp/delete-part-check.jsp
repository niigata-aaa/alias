<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者削除画面</title>
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

table th{
    padding-left:8px;
    padding-right:8px;
}

#delete-btn{
    margin:2px;
}

.text{
    color:red;
}
</style>
</head>
<body>
<h2>参加者情報削除</h2>
<p class="text">以下の参加者情報を削除してもよろしいですか？</p>

<form action="delete-part-ok-servlet" method="post">
<%
PartBean bean = (PartBean) request.getAttribute("bean");
%>

<table border=1>
<tr><th>会員ID<td><%=bean.getUserID() %></td></th></tr>
<tr><th>参加者ID<td><%=bean.getPartID() %></td></th></tr>
<tr><th>氏名（漢字）<td><%=bean.getPartName() %></td></th></tr>
<tr><th>氏名（かな）<td><%=bean.getPartRuby() %></td></th></tr>
<tr><th>性別<td><%=bean.getPartGender() %></td></th></tr>
<tr><th>年齢<td><%=bean.getPartAge() %></td></th></tr>
<tr><th>役職<td><%=bean.getPartPost() %></td></th></tr>
<tr><th>入社年度<td><%=bean.getPartEmpyear() %></td></th></tr>
<tr><th>アレルギー<td><%=bean.getPartAllergy() %></td></th></tr>
<tr><th>食べ物の好み<td><%=bean.getPartGenre() %></td></th></tr>
<tr><th>好きな料理のカテゴリ<td><%=bean.getPartCategory() %></td></th></tr>
<tr><th>好きなビールの種類<td><%=bean.getPartBeer() %></td></th></tr>
<tr><th>予算<td><%=bean.getPartBudget() %></td></th></tr>
<tr><th>タバコ<td><%=bean.getPartSmoke() %></td></th></tr>

<%session.setAttribute("bean", bean); %>
</table>
<input type="submit" id="delete-btn" value="この情報を削除する"><br>
</form>

<form action="select-part-servlet" method="post">
<input type="submit" value="参加者一覧表示・検索画面へ戻る">
</form>
</body>
</html>
