<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.RestBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店詳細</title>
</head>
<body>
<h2>飲食店詳細</h2>
<%
	RestBean bean = (RestBean) request.getAttribute("bean");
%>
<%
				if(bean != null){
				
		%>
	<form action="select-rest-ok-servlet" method="POST">
	<table>
			<tr><th>店舗名</th><td><%=bean.getRestName() %></td></tr>
			<tr><th>料理ジャンル</th><td><%=bean.getRestGenre() %></td></tr>
			<tr><th>食材カテゴリ</th><td><%=bean.getRestCategory() %></td></tr>
			<tr><th>新潟駅からの距離</th><td><%=bean.getRestDistance() %></td></tr>
			<tr><th>予算</th><td><%=bean.getRestBudget() %></td></tr>
			<tr><th>最大収容数</th><td><%=bean.getRestCapacity() %></td></tr>
			<tr><th>住所</th><td><%=bean.getRestAddress() %></td></tr>
			<tr><th>営業時間（オープン）</th><td><%=bean.getRestOpen() %></td></tr>
			<tr><th>営業時間（クローズ）</th><td><%=bean.getRestClose() %></td></tr>
			<tr><th>店のURL</th><td><%=bean.getRestUrl() %></td></tr>
			<tr><th>電話番号</th><td><%=bean.getRestTel() %></td></tr>
			<tr><th>ビールの種類</th><td><%=bean.getRestBeer() %></td></tr>
			<tr><th>口コミ</th><td><%=bean.getRestReview() %></td></tr>
	</table>
		<input type="submit" value="ここに決めた！"><br>
	</form>
	<%
			}
		%>

	<form action="select-rest" method="POST">
		<input type="submit" value="飲食店一覧表示・検索画面へ戻る">
	</form>

</body>
</html>