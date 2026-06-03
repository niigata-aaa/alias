<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店登録完了画面</title>
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

<%
RestBean rest = (RestBean) request.getAttribute("rest");
if(rest== null){
    out.println("restがnullです（データが渡っていません）");
    return;
}
%>

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
		
	<form action="adm-top.jsp" method="post">
		<input type="submit" class="submit-top-right" value="管理者トップ画面へ戻る"><br>
	</form>
	
	<form action="adm-select-rest.jsp" method="post">
		<input type="submit" value="飲食店一覧表示・検索画面へ戻る"
	</form>
</body>
</html>