<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店一覧表示</title>
<link rel="stylesheet" href="css/select-rest.css">
<link rel="stylesheet" href="css/scroll.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
<style>
.searchTable {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: left;
}

table table {
	vertical-align: top;
}

.explain_text{
    text-align:left;
    margin-top:18px;
    margin-bottom:4px;
}

.title{
    margin-left:35px;
    font-size: 1.2em;
    font-weight: bold;
}

</style>

</head>

<body>


<div id="table_title"><h2>飲食店一覧表示・検索画面</h2></div>        
<div class="exampleSearch">

<%--<form action="narrow-rest-servlet" method="post">--%>
    <form action="top" method="post">
		<input type="submit" id="submit-top-right" value="トップ画面へ戻る">
	</form>
	<form action="narrow-rest-servlet" method="post">
		店舗名キーワード検索：<input type="text" name="keyword" value="">　<input type="submit" id="sub-btn" value="検索">
		<%--<input type="submit" value="検索"><br> <br>--%>
		<br>
		<div class="explain_text"><span class="title">◆条件検索</span><br>　　　：以下の項目により条件検索が可能です。ビール銘柄による店舗検索もできます！</div>
		<table class="searchTable">
			<tr>
				<td>
					<%--<form action="narrow-rest-servlet" method="post"> 
					<input type="submit" value="検索">--%>
					<table border=0>
						<%--
                <tr><th>料理ジャンル</th></tr>
              
                <tr>
                    <td><input type="checkbox" name="genre" value="">和食</td>
                    <td><input type="checkbox" name="genre" value="">洋食</td>
                    <td> <input type="checkbox" name="genre" value="">中華</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="genre" value="">フレンチ</td>
                    <td><input type="checkbox" name="genre" value="">韓国</td>
                    <td><input type="checkbox" name="genre" value="">アジア・エスニック</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="genre" value="">カレー</td>
                    <td><input type="checkbox" name="genre" value="">居酒屋</td>
                    <td><input type="checkbox" name="genre" value="">焼肉</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="genre" value="">鍋</td>
                </tr>
                --%>

						<h4>料理ジャンル　
						<select name="genre">
							<option value="0">特になし</option>
							<option value="1">和食</option>
							<option value="2">洋食</option>
							<option value="3">中華料理</option>
							<option value="4">フレンチ</option>
							<option value="5">韓国料理</option>
							<option value="6">アジア・エスニック</option>
							<option value="7">居酒屋</option>
							<option value="8">焼肉</option>
							<option value="9">カレー</option>
							<option value="10">鍋</option>
						</select>
                        </h4>
						
					</table>
				</td>
				<td>
					<table border=0>
				
						<h4>食材カテゴリ　
						
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
						
						</h4>
						
						
						
					</table>
				</td>
				<td>
					<table border=0>
						
						<h4>ビールの種類　
						
						<select name="beer">
							<option value="0">特になし</option>
							<option value="1">アサヒ</option>
							<option value="2">キリン</option>
							<option value="4">サッポロ</option>
							<option value="3">サントリー</option>
							<option value="5">エビス</option>
							<option value="6">クラフトビール</option>

						</select>
						
						</h4>
						
					</table>
				</td>
			</tr>
		</table>

		<table class="searchTable" border=0>
			<tr>
				<th>　　評価</th>
				<td><select name="review">
						<option value="0.0">指定なし</option>
						<option value="1.0">☆～１</option>
						<option value="2.0">☆～２</option>
						<option value="3.0">☆～３</option>
						<option value="4.0">☆～４</option>
						<option value="5.0">☆～５</option>
				</select></td>
				<th>　　最大収容数</th>
				<td><select name="capacity">
						<option value="0">指定なし</option>
						<option value="5">1～5人</option>
						<option value="10">～10人</option>
						<option value="15">～15人</option>
						<option value="1000">15人～</option>
				</select></td>
			</tr>
			<tr>
				<th>　　訪問履歴</th>
				<td><select name="log">
						<option value="0">指定なし</option>
						<option value="1">あり</option>
						<option value="2">なし</option>
				</select></td>
				<th>　　新潟駅からの距離</th>
				<td><select name="distance">
						<option value="0">指定なし</option>
						<option value="500">～５００ｍ</option>
						<option value="1000">～１ｋｍ</option>
						<option value="3000">～３ｋｍ</option>
						<option value="5000">～５ｋｍ</option>
						<%--<option value="40000000">５ｋｍ～</option>--%>
				</select></td>
			</tr>
			<tr>
				<th>　　予算</th>
				<td><select name="budget">
						<option value="0">指定なし</option>
						<option value="3000">3,000円以下</option>
						<option value="5000">～5,000円</option>
						<option value="10000">～10,000円</option>
						<%--<option value="1000000">10,000円～</option>--%>
				</select></td>
				<th>　　喫煙席の有無</th>
				<td><select name="smoke">
						<option value="0">指定なし</option>
						<option value="1">あり</option>
						<option value="2">なし</option>
				</select></td>

			</tr>
		</table>
	</form>
</div>
	<%
	List<RestBean> list = (List<RestBean>) request.getAttribute("restList");
	double distance = 0;
	int count = (Integer)request.getAttribute("partCount");
	%>
<div class="explain_text"><span class="title">　　◆店舗検索結果</span><br>　　　　　：条件指定なしで検索をした場合はすべての店舗が表示されます。
	　参加者数：<%=count %>名</div>
<div class="exampleResult">
<br>
	<table border=1>
	<thead>
		<tr>
			<th>店名</th>
			<th>ジャンル</th>
			<th>カテゴリ</th>
			<th>距離</th>
			<th>予算</th>
			<th>席数</th>
			<th>営業時間</th>
			<th>評価</th>
			<th>TEL</th>
			<th>訪問履歴</th>
			<th>詳細</th>
			<th>決めたらここ👇</th>
		</tr>
		</thead>

		<%
		if (list != null) {
			for (RestBean rest : list) {
				distance = rest.getRestDistance() / 1000.0;
		%>

		<tr>
			<td><%=rest.getRestName()%></td>
			<td><%=rest.getRestGenre()%></td>
			<td><%=rest.getRestCategory()%></td>
			<td><%=distance%> km</td>
			<td><%=rest.getRestBudget()%> 円</td>
			<td class="<%= rest.getRestCapacity() < count ? "required" : ""%>"><%=rest.getRestCapacity()%> 席</td>
			<td><%=rest.getRestOpen().substring(0, 5)%> ~ <%=rest.getRestClose().substring(0, 5)%></td>
			<td>★ <%=rest.getRestReview()%></td>
			<td><%=rest.getRestTel()%></td>
			<td><%= rest.getVisitCount() == 0 ? "未訪問" : rest.getVisitCount() + "件" %></td>
			
			
			<td>
				<form action="select-rest-detail" method="POST">
					<input type="hidden" name="restId" value="<%=rest.getRestId()%>">
					<input type="submit" class="decide-btn" value="詳細">
				</form>
			</td>
			<td>
				<form action="select-rest-ok" method="POST">
					<input type="hidden" name="restId" value="<%=rest.getRestId()%>">
					<input type="submit" class="decide-btn" value="ここに決めた!!">
				</form>
			</td>
		</tr>

		<%
			}
		}
		%>


	</table>
</div>
</body>
</html>