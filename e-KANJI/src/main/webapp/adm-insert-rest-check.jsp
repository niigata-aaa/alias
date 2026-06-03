<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店情報登録確認画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="header-logo.jsp"%>
	飲食店情報登録確認画面
	<br>

	<%
	RestBean rest = (RestBean) request.getAttribute("rest");
	if (rest == null) {
		out.println("restがnullです");
		return;
	}
	%>

	<a href="adm-select-rest.jsp">飲食店一覧表示・検索画面へ戻る</a>
	<h2>この飲食店を登録します</h2>

	<form action="adm-insert-rest-ok" method="post">

		<input type="hidden" name="rest_name" value="<%=rest.getRestName()%>">
		<input type="hidden" name="rest_genre"
			value="<%=rest.getRestGenre()%>">
			 <input type="hidden"
			name="rest_category" value="<%=rest.getRestCategory()%>">
			 <input
			type="hidden" name="rest_open" value="<%=rest.getRestOpne()%>">
		<input type="hidden" name="rest_close"
			value="<%=rest.getRestClose()%>">
			 <input type="hidden"
			name="rest_nextday" value="<%=rest.getRestNextday()%>">
			 <input
			type="hidden" name="rest_distance"
			value="<%=rest.getRestDistance()%>">
			 <input type="hidden"
			name="rest_budget" value="<%=rest.getRestBudget()%>">
			 <input type="hidden" name="rest_capacity"
			value="<%=rest.getRestCapacity()%>">
			 <input type="hidden" name="rest_tel" value="<%=rest.getRestTel()%>">
			  <input type="hidden" name="rest_address" value="<%=rest.getRestAddress()%>">
		<input type="hidden" name="rest_url" value="<%=rest.getRestUrl()%>">
		<input type="hidden" name="rest_review"
			value="<%=rest.getRestReview()%>">
			 <input type="hidden" name="rest_beer" value="<%=rest.getRestBeer()%>">
			  <input type="hidden" name="rest_smoke" value="<%=rest.getRestSmoke()%>">
		<input type="hidden" name="rest_smokeroom"
			value="<%=rest.getRestSmokeroom()%>">
		飲食店ID：登録時に自動採番されます<br>
		飲食店名：<%=rest.getRestName()%><br>

		<%
		String genre = rest.getRestGenre();
		if (genre == null) {
			genre = "0";
		} else {
			genre = genre.trim();
		}
		switch (rest) {
		case "0":
			genre = "特になし";
			break;
		case "1":
			genre = "和食";
			break;
		case "2":
			genre = "洋食";
			break;
		case "3":
			genre = "中華料理";
			break;
		case "4":
			genre = "フレンチ";
			break;
		case "5":
			genre = "韓国料理";
			break;
		case "6":
			genre = "アジア・エスニック";
			break;
		case "7":
			genre = "居酒屋";
			break;
		case "8":
			genre = "焼肉";
			break;
		case "9":
			genre = "カレー";
			break;
		case "10":
			genre = "鍋";
			break;
		default:
			genre = "特になし";
			break;
		}
		%>
		店ジャンル：<%=genre%><br>

		<%
		String category = rest.getRestCategory();
		if (category == null) {
			category = "0";
		} else {
			category = category.trim();
		}
		switch (category) {
		case "0":
			category = "特になし";
			break;
		case "1":
			category = "肉";
			break;
		case "2":
			category = "海鮮";
			break;
		case "3":
			category = "野菜";
			break;
		case "4":
			category = "麺";
			break;
		case "5":
			category = "米";
			break;
		case "6":
			category = "揚げ物";
			break;
		case "7":
			category = "酒";
			break;
		default:
			category = "特になし";
			break;
		}
		%>
		食材カテゴリ：<%=category%><br> オープン：<%=rest.getRestOpen()%><br>
		クローズ：<%=rest.getRestClose()%><br>

		<%
		String nextday = rest.getRestNextday();
		if (nextday == null) {
			nextday = "2";
		} else {
			nextday = nextday.trim();
		}
		switch (nextday) {
		case "0":
			nextday = "やっている";
			break;
		case "1":
			nextday = "やっていない";
			break;
		default:
			nextday = "不明";
			break;
		}
		%>
		日跨ぎ営業：<%=nextday%><br> 距離：<%=rest.getRestDistance()%><br>
		予算：<%=rest.getRestBudget()%><br> 最大収容数：<%=rest.getRestCapacity()%><br>
		電話番号：<%=rest.getRestTel()%><br> 住所：<%=rest.getRestAddress()%><br>
		詳細URL：<%=rest.getRestUrl()%><br> 口コミ：<%=rest.getRestReview()%><br>

		<%
		String beer = rest.getRestBeer();
		if (beer == null) {
			beer = "0";
		} else {
			beer = beer.trim();
		}
		switch (beer) {
		case "0":
			beer = "特になし";
			break;
		case "1":
			beer = "アサヒ";
			break;
		case "2":
			beer = "キリン";
			break;
		case "3":
			beer = "サントリー";
			break;
		case "4":
			beer = "サッポロ";
			break;
		case "5":
			beer = "エビス";
			break;
		case "6":
			beer = "クラフトビール";
			break;
		default:
			beer = "特になし";
			break;
		}
		%>
		ビールの種類：<%=beer%><br>

		<%
		String smoke = rest.getRestSmoke();
		if ("0".equals(smoke)) {
			smoke = "あり";
		} else if ("1".equals(smoke)) {
			smoke = "なし";
		}
		%>
		喫煙席の有無：<%=smoke%><br>

		<%
		String smokeroom = rest.getRestSmokeroom();
		if ("0".equals(smokeroom)) {
			smokeroom = "あり";
		} else if ("1".equals(smokeroom)) {
			smokeroom = "なし";
		}
		%>
		店内に喫煙所：<%= smokeroom%><br> 
		<input type="submit" value="この飲食店を登録する">
	</form>
</body>
</html>