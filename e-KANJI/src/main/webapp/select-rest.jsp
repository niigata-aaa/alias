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

<form action="narrow-rest-servlet" method="post">

<input type="submit" value="検索">
料理ジャンル>
<select name="genre">
<option value="0">特になし</option>
<option value="1">和食</option>
<option value="2">洋食</option>
<option value="3">中華</option>
<option value="4">フレンチ</option>
<option value="5">韓国料理</option>
<option value="6">アジア</option>
<option value="7">カレー</option>
<option value="8">居酒屋</option>
<option value="9">焼肉</option>
<option value="10">鍋</option>
</select>

食材カテゴリ
<select name="category">
<option value="0">特になし</option>
<option value="1">肉</option>
<option value="2">海鮮</option>
<option value="3">野菜</option>
<option value="4">麺</option>
<option value="5">米</option>
<option value="6">揚げ物</option>
<option value="7">酒</option>
</select>

ビールの種類
<select name="beer">
<option value="1">アサヒ</option>
<option value="2">キリン</option>
<option value="4">サッポロ</option>
<option value="3">サントリー</option>
<option value="5">エビス</option>
<option value="6">クラフトビール</option>
<option value="0">特になし</option>
</select>

評価
<select name="review">
<option value="1">☆１～２</option>
<option value="2">☆２～３</option>
<option value="3">☆３～４</option>
<option value="4">☆４～５</option>
<option value="5">☆５</option>
</select>

最大収容数
<select name="capacity">
<option value="5">１～５</option>
<option value="10">５～１０</option>
<option value="15">１０～１５</option>
<option value="100">１５～</option>
</select>

訪問履歴
<select name="log">
<option value="1">あり</option>
<option value="0">なし</option>
</select>

新潟駅からの距離
<select name="distance">
<option value="500">～５００m</option>
<option value="1000">～１ｋｍ</option>
<option value="3000">～３ｋｍ</option>
<option value="5000">～５ｋｍ</option>
<option value="40000">５ｋｍ～</option>
</select>

価格
<select name="price">
<option value="3000">3000円以下</option>
<option value="5000">3000～5000円</option>
<option value="10000">5000～10000円</option>
<option value="1000000">10000円～</option>
</select>

喫煙席の有無
<select name="smoke">
<option value="1">あり</option>
<option value="0">なし</option>
</select>
</form>

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
			<td><%=rest.getRestCategory() %></td>
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