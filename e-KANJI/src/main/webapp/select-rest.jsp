<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店一覧表示</title>

<style>
  .choice{
  table {
    border: 3px solid black; /* 外枠の太さと色 */
    border-collapse: collapse; /* 枠線を重ねて1本にする */
  }
  th, td {
    border: none; /* 内側の枠線を消す */
    text-align: left; /* 横方向は左寄せ */
    vertical-align: top; /* 縦方向は上揃え */
</style>

</head>

<body>
<h1>飲食店一覧表示・検索画面</h1>
<br>
    <form action="select-rest-servlet" method="post">
	    キーワード検索<input type="text" name="keyword" value="店舗名で検索してください">
	    <input type="submit" value="検索"><br>
        <br>
        <table>
        <tr><td>

	        <table class="choice" border=0>
                <tr><th>料理ジャンル</th></tr>
                <tr>
                    <td><input type="checkbox" name="rest_genre" value="">和食</td>
                    <td><input type="checkbox" name="rest_genre" value="">洋食</td>
                    <td> <input type="checkbox" name="rest_genre" value="">中華</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_genre" value="">フレンチ</td>
                    <td><input type="checkbox" name="rest_genre" value="">韓国</td>
                    <td><input type="checkbox" name="rest_genre" value="">アジア・エスニック</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_genre" value="">カレー</td>
                    <td><input type="checkbox" name="rest_genre" value="">居酒屋</td>
                    <td><input type="checkbox" name="rest_genre" value="">焼肉</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_genre" value="">鍋</td>
                </tr>
            </table>
            </td>
            <td>
            <table class="choice" border=0>
                <th>食材カテゴリ</th>
                <tr>
                    <td><input type="checkbox" name="rest_category" value="">肉</td>
                    <td><input type="checkbox" name="rest_category" value="">海鮮</td>
                    <td><input type="checkbox" name="rest_category" value="">野菜</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_category" value="">麺</td>
                    <td><input type="checkbox" name="rest_category" value="">米</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_category" value="">揚げ物</td>
                    <td><input type="checkbox" name="rest_category" value="">酒</td>
                </tr>
            </table>
            </td>
            <td>
            <table class="choice" border=0>
                <tr><th>ビールの種類</th></tr>
                <tr>
                    <td><input type="checkbox" name="rest_beer" value="">アサヒ</td>
                    <td><input type="checkbox" name="rest_beer" value="">キリン</td>
                    <td><input type="checkbox" name="rest_beer" value="">サッポロ</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_beer" value="">サントリー</td>
                    <td><input type="checkbox" name="rest_beer" value="">エビス</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rest_beer" value="">クラフトビール</td>
                    <td><input type="checkbox" name="rest_beer" value="">特になし</td>
                </tr>
            </table>
        </td></tr>
        </table>
	    
	    <table border=0>
                <tr><th>評価</th>
                    <td><select name="rest_review">
                            <option value=""></option>
                            <option value="">☆１～２</option>
                            <option value="">☆２～３</option>
                            <option value="">☆３～４</option>
                            <option value="">☆４～５</option>
                        </select>
                    </td>
                    <th>最大収容数</th>
                    <td><select name="rest_capacity">
                            <option value=""></option>
                            <option value="">1～5人</option>
                            <option value="">5～10人</option>
                            <option value="">10～15人</option>
                            <option value="">15～人</option>
                        </select>
                    </td>
                  
       
                </tr>
            </table>
	
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