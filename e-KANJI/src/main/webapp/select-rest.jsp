<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店一覧表示</title>
</head>
<body>
<h1>飲食店一覧表示・検索画面</h1>
<br>


<%
	List<RestBean> list = (List<RestBean>)request.getAttribute("restList");
%>

	<table border=1>
		<tr>
			<th>店名</th>
			<th>ジャンル</th>
			<th>カテゴリ</th>
			<th>距離</th>
			<th>予算</th>
			<th>席数</th>
			<th>open</th>
			<th>close</th>
			<th>評価</th>
			<th>TEL</th>
			<th>詳細</th>
			<th>決めたらここ👇</th>
		</tr>

		<%
				if(list != null){
					for (RestBean rest : list) {
				
		%>

		
		<tr>
			<td><%=rest.getRestName()%></td>
			<td><%=rest.getRestGenre()%></td>
			<td><%=rest.getRestCategory() %>
			<td><%=rest.getRestDistance() %></td>
			<td><%=rest.getRestBudget() %></td>
			<td><%=rest.getRestCapacity() %></td>
			<td><%=rest.getRestOpen() %></td>
			<td><%=rest.getRestClose() %></td>
			<td><%=rest.getRestReview() %></td>
			<td><%=rest.getRestTel() %></td>
			
			
			
			<td>
				<form action="select-rest-detail" method="POST">
					<input type="hidden" name="restId" value="<%=rest.getRestId()%>">
					<input type="submit" value="詳細">
				</form>
			</td>
			<td>
				<form action="select-rest-ok" method="POST">
					<input type="hidden" name="restId" value="<%=rest.getRestId()%>">
					<input type="submit" value="ここに決めた！">
				</form>
			</td>
		</tr>
		
		<%
			}}
		%>

	</table>
</body>
</html>