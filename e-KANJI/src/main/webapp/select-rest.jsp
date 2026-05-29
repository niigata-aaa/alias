<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店一覧表示</title>
<style>
.searchArea{
display:flex;
gap:50;
}

</style>
</head>

<body>
<h1>飲食店一覧表示・検索画面</h1>
<br>
    <form action="select-rest-servlet" method="post">
	    キーワード検索<input type="text" name="keyword" value="店舗名で検索してください">
	    <input type="submit" value="検索">


	    <table border=0>
            <tr>
                <td><input type="checkbox" name="rest_genre" value="">和食</td>
                <td><input type="checkbox" name="rest_genre" value="">洋食</td>
                <td> <input type="checkbox" name="rest_genre" value="">中華</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="rest_genre" value="">フレンチ</td>
                <td><input type="checkbox" name="rest_genre" value="">韓国</td>
                <td></td>
            </tr>
            <tr>
                <td>カレー</td>
                <td>居酒屋</td>
                <td>焼肉</td>
            </tr>
            <tr>
                <td>鍋</td>
            </tr>
            
        </table><br>
           <div class="searchArea">
	    <h3>料理ジャンル</h3>

	    <input type="checkbox" name="rest_genre" value="">和食
	    <input type="checkbox" name="rest_genre" value="">洋食
	    <input type="checkbox" name="rest_genre" value="">中華<br>

	    <input type="checkbox" name="rest_genre" value="">フレンチ
	    <input type="checkbox" name="rest_genre" value="">韓国<br>

	    <input type="checkbox" name="rest_genre" value="">アジア・エスニック
	    <input type="checkbox" name="rest_genre" value="">カレー<br>

	    <input type="checkbox" name="rest_genre" value="">居酒屋
	    <input type="checkbox" name="rest_genre" value="">焼肉
	    <input type="checkbox" name="rest_genre" value="">鍋<br>

	    <h3>食材カテゴリ</h3>
	    <input type="checkbox" name="rest_category" value="">肉
	    <input type="checkbox" name="rest_category" value="">海鮮
	    <input type="checkbox" name="rest_category" value="">野菜<br>
	    <input type="checkbox" name="rest_category" value="">麺
	    <input type="checkbox" name="rest_category" value="">米
	    <input type="checkbox" name="rest_category" value="">揚げ物<br>
	    <input type="checkbox" name="rest_category" value="">酒<br>
	    <h3>ビールの種類</h3>
	    <input type="checkbox" name="rest_beer" value="">アサヒ
	    <input type="checkbox" name="rest_beer" value="">キリン<br>
	    <input type="checkbox" name="rest_beer" value="">サッポロ
	    <input type="checkbox" name="rest_beer" value="">サントリー<br>
	    <input type="checkbox" name="rest_beer" value="">エビス
	    <input type="checkbox" name="rest_beer" value="">クラフトビール<br>
	    <input type="checkbox" name="rest_beer" value="">特になし<br>
	    </div>
	    
	    <h3>評価</h3>
	    <select name="rest_review">
	    <option value=""></option>
	    <option value="">☆１～２</option>
	    <option value="">☆２～３</option>
	    <option value="">☆３～４</option>
	    <option value="">☆４～５</option>
	    </select>
	    <h3>最大収容数</h3>
	    <select name="rest_capacity">
	    <option value=""></option>
	    <option value="">1～5</option>
	    <option value="">5～10</option>
	    <option value="">10～15</option>
	    <option value="">15～</option>
	    </select><br>
	    <h3>訪問履歴</h3>
	    <select name="log>
	    <option value=""></option>
	    <option value="">あり</option>
	    <option value="">なし</option>
	    </select>
	    <h3>新潟駅からの距離</h3>
	    <select name="rest_distance">
	    <option value=""></option>
	    <option value="">3,000円以下</option>
	    <option value="">3,000～5,000円</option>
	    <option value="">5,000～10,000円</option>
	    <option value="">3km～5km</option>
	    <option value="">5km～</option>
	    </select><br>
	    <h3>予算</h3>
	    <select name="rest_budget">
	    <option value=""></option>
	    <option value="">3,000円以下</option>
	    <option value="">3,000～5,000円</option>
	    <option value="">5,000～10,000円</option>
	    <option value="">10,000円～</option>
	    </select><br>
	    <h3>喫煙席の有無</h3>
	    <select name="rest_smoke">
	    <option value=""></option>
	    <option value="">あり</option>
	    <option value="">なし</option>
	    </select><br>
	    
	    
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
				<form action="select-rest-ok-servlet" method="POST">
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