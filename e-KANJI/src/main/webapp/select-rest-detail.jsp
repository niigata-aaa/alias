<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean, model.entity.LogBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店詳細</title>
<link rel="stylesheet" href="css/select-rest-table.css">
<link rel="stylesheet" href="css/style.css">

<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">


</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>飲食店詳細</h2>
<%
	RestBean bean = (RestBean) request.getAttribute("bean");
	List<LogBean> logList = (List<LogBean>) request.getAttribute("logList");

	double distance = bean.getRestDistance() / 1000.0;
	int partCount = (Integer)request.getAttribute("partCount");
%>
<%
	if(bean != null){
%>
	
	<table border=1>
			<tr><th>店舗名</th><td><%=bean.getRestName() %></td></tr>
			<tr><th>料理ジャンル</th><td><%=bean.getRestGenre() %></td></tr>
			<tr><th>食材カテゴリ</th><td><%=bean.getRestCategory() %></td></tr>
			<tr><th>新潟駅からの距離</th><td><%=distance %> km</td></tr>
			<tr><th>予算</th><td><%=bean.getRestBudget() %> 円</td></tr>
			<tr><th>最大収容数</th><td class="<%= bean.getRestCapacity() < partCount ? "alert" : ""%>"><%=bean.getRestCapacity() %> 席</td></tr>
			<tr><th>住所</th><td><%=bean.getRestAddress() %></td></tr>
			<tr>
				<th>営業時間</th>
				<td><%=bean.getRestOpen().substring(0, 5) %> ~ <%=bean.getRestClose().substring(0, 5) %></td>
			</tr>
			<tr><th>店のURL</th><td><a href="<%=bean.getRestUrl() %>"><%=bean.getRestUrl() %></a></td></tr>
			<tr><th>電話番号</th><td><%=bean.getRestTel() %></td></tr>
			<tr><th>ビールの種類</th><td><%=bean.getRestBeer() %></td></tr>
			<tr><th>口コミ</th><td>★ <%=bean.getRestReview() %></td></tr>
			<tr><th>喫煙席</th><td><%= bean.getRestSmoke() == 0 ? "なし" : "あり" %></td></tr>
			<tr><th>店内喫煙所</th><td><%= bean.getRestSmokeroom() == 0 ? "なし" : "あり" %></td></tr>
	</table>
	<br>

<%
	}
%>
		
		
	<h3>訪問履歴</h3>
<%
	if(logList != null){
%>

	<table border=1>
		<tr><th>訪問回数</th><td><%= bean.getVisitCount() + "回" %></td></tr>
	</table>
	
	<table border=1>
<%
		int count = 1;
		for (LogBean log : logList) {
%>

			<tr><th><%= count %>.</th><td><%= log.getLogTime() %></td></tr>

<%
			count++;
		}
%>

	</table>

	
<%
	} else {
%>
	訪問履歴はありません。
<%
	}
%>

	<br><br><br>

	<form action="select-rest-ok" method="POST">
		<input type="hidden" name="restId" value="<%=bean.getRestId()%>">
		<input type="submit" value="ここに決めた！"><br>
	</form>
	<br>


	<form class="submit-top-right" action="select-rest" method="POST">
		<input type="submit" value="飲食店一覧表示・検索画面へ戻る">
	</form>

</body>
</html>