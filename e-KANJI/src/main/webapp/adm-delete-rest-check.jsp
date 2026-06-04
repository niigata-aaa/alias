<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店削除画面</title>
<link rel="stylesheet" href="css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<h2>飲食店情報削除</h2>
	以下の飲食店情報を削除してもよろしいですか？<br>
	
	<%
	RestBean rest=(RestBean) request.getAttribute("rest");
	int restId=rest.getRestId();
	%>
	
	<div class="formArea">
	<form action="adm-delete-rest" method="post">
		
		<table>
			<tr>
				<th>飲食店ID：</th>
				<td><%=rest.getRestId()%></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>飲食店名：</th>
				<td><%=rest.getRestName() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>店ジャンル：</th>
				<td><%=rest.getRestGenre()%></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>食材カテゴリ：</th>
				<td><%=rest.getRestCategory()%></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>オープン：</th>
				<td><%=rest.getRestOpen() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>クローズ：</th>
				<td><%=rest.getRestClose() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>日跨ぎ営業：</th>
				<td><%=rest.getRestNextday() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>距離：</th>
				<td><%=rest.getRestDistance()%></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>予算：</th>
				<td><%=rest.getRestBudget() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>最大収容数：</th>
				<td><%=rest.getRestCapacity() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>電話番号：</th>
				<td><%=rest.getRestTel() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>住所：</th>
				<td><%=rest.getRestAddress() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>詳細URL：</th>
				<td><%=rest.getRestUrl() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>口コミ：</th>
				<td><%=rest.getRestReview() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>ビールの種類：</th>
				<td><%=rest.getRestBeer() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>喫煙席の有無：</th>
				<td><%=rest.getRestSmoke() %></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<th>店内に喫煙所：</th>
				<td><%=rest.getRestSmokeroom() %></td>
			</tr>
		</table>
	
	<input type="hidden" name="rest_id" value="<%=rest.getRestId()%>">

	<input type="submit" value="削除"><br>
	</form>
	</div>
	
	<form action="adm-select-rest" method="post">
	<input type="submit" value="戻る">
	</form>
</body>
</html>