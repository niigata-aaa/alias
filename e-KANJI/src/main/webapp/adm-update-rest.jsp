<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店情報変更画面</title>
<style>
.submit-top-right {
	position: fixed;
	top: 10px;
	right: 10px;
	padding: 10px 20px;
	cursor: pointer;
}

.submit-under-right {
	position: fixed;
	bottom: 10px;
	right: 10px;
	padding: 10px 20px;
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

	<form action="adm-select-rest" method="post">
		<input type="submit" class="submit-top-right" value="管理者飲食店一覧表示・検索画面へ戻る">
	</form>

	飲食店情報変更画面
	<br>
	<%
        RestBean bean = (RestBean) request.getAttribute("bean");
 
    %>
<span class="required">*は必須入力です</span><br>
<div class="tableArea">
<table>
	<form action="adm-update-rest-check-servlet" method="post">
	
		<tr>
		<th>飲食店ID：</th>
		<td><%=bean.getRestId() %></td><br> 
		</tr>
		<tr>
		<th>飲食店名：<span class="required"> *</span></th>
		<td><input type="text" name="restName" value=<%=bean.getRestName() %> required></td><br> 
		</tr>
		
		<tr>
		<th>店ジャンル：</th><td> <select name="restGenre">
			<option value="0"
				<%= bean.getRestGenre() == "特になし" ? "selected" : "" %>>特になし</option>
			<option value="1"
				<%= bean.getRestGenre() == "和食" ? "selected" : "" %>>和食</option>
			<option value="2"
				<%= bean.getRestGenre() == "洋食" ? "selected" : "" %>>洋食</option>
			<option value="3"
				<%= bean.getRestGenre() == "中華料理" ? "selected" : "" %>>中華料理</option>
			<option value="4"
				<%= bean.getRestGenre() == "フレンチ" ? "selected" : "" %>>フレンチ</option>
			<option value="5"
				<%= bean.getRestGenre() == "韓国料理" ? "selected" : "" %>>韓国料理</option>
			<option value="6"
				<%= bean.getRestGenre() == "アジア・エスニック" ? "selected" : "" %>>アジア・エスニック</option>
			<option value="7"
				<%= bean.getRestGenre() == "居酒屋" ? "selected" : "" %>>居酒屋</option>
			<option value="8"
				<%= bean.getRestGenre() == "焼肉" ? "selected" : "" %>>焼肉</option>
			<option value="9"
				<%= bean.getRestGenre() == "カレー" ? "selected" : "" %>>カレー</option>
			<option value="10"
				<%= bean.getRestGenre() == "鍋" ? "selected" : "" %>>鍋</option>
		</select></td><br> 
		</tr>
		<tr>
		<th>食材カテゴリ：</th><td> <select name="restCategory">
			<option value="0"
				<%= bean.getRestCategory() == "特になし" ? "selected" : "" %>>特になし</option>
			<option value="1"
				<%= bean.getRestCategory() == "肉" ? "selected" : "" %>>肉</option>
			<option value="2"
				<%= bean.getRestCategory() == "海鮮" ? "selected" : "" %>>海鮮</option>
			<option value="3"
				<%= bean.getRestCategory() == "野菜" ? "selected" : "" %>>野菜</option>
			<option value="4"
				<%= bean.getRestCategory() == "麺" ? "selected" : "" %>>麺</option>
			<option value="5"
				<%= bean.getRestCategory() == "米" ? "selected" : "" %>>米</option>
			<option value="6"
				<%= bean.getRestCategory() == "揚げ物" ? "selected" : "" %>>揚げ物</option>
			<option value="7"
				<%= bean.getRestCategory() == "酒" ? "selected" : "" %>>酒</option>
		</select></td><br> 
		</tr>
		<tr>
		<th>ビールの種類：</th>
		<td><select name="restBeer">
			<option value="0"<%= bean.getRestBeer() == "特になし" ? "selected" : "" %>>特になし</option>
			<option value="1"<%= bean.getRestBeer() == "アサヒ" ? "selected" : "" %>>アサヒ</option>
			<option value="2"<%= bean.getRestBeer() == "キリン" ? "selected" : "" %>>キリン</option>
			<option value="3"<%= bean.getRestBeer() == "サッポロ" ? "selected" : "" %>>サッポロ</option>
			<option value="4"<%= bean.getRestBeer() == "サントリー" ? "selected" : "" %>>サントリー</option>
			<option value="5"<%= bean.getRestBeer() == "エビス" ? "selected" : "" %>>エビス</option>
			<option value="6"<%= bean.getRestBeer() == "クラフトビール" ? "selected" : "" %>>クラフトビール</option>
		</select></td><br>
		</tr>
		<tr>
		<th>オープン時間：</th> <td><input type="time" name="restOpen" value=<%=bean.getRestOpen() %>></td><br> 
		</tr>	
		<tr>
		<th>クローズ時間： </th><td><input type="time" name="restClose" value=<%=bean.getRestClose() %>></td><br>
		</tr>
		<tr>
		<th>日跨ぎ営業：</th>
		
		<td><input type="radio" name="restNextday" value="1" <%= bean.getRestNextday() == 1 ? "checked" : "" %>>してる
        <input type="radio" name="restNextday" value="0" <%= bean.getRestNextday() == 0 ? "checked" : "" %>>してない
        </td><br>
		</tr>	
		<tr>
		<th>距離： <span class="required"> *</span></th>
		<td><input type="number" name="restDistance" value=<%=bean.getRestDistance() %> min="0" required></td><br>
		</tr>
		<tr>
		<th>予算：<span class="required"> *</span></th> 
		<td><input type="number" name="restBudget"
			value=<%=bean.getRestBudget() %> min="0" required></td><br> 
		</tr>
		<tr>	
		<th>最大収容数：
		<span class="required"> *</span></th>
		 <td><input type="number" name="restCapacity" value=<%=bean.getRestCapacity() %> min="0" required></td><br>
		</tr>
		<tr>
		<th>電話番号： </th><td><input type="text" name="restTel" value=<%=bean.getRestTel() %>></td><br>
		</tr>
		
		<tr>
		<th>住所：</th> <td><input type="text" name="restAddress"
			value=<%=bean.getRestAddress() %>></td><br> 
		</tr>	
		<tr><th>詳細URL：</th><td> <input
			type="text" name="restUrl" value=<%=bean.getRestUrl() %>></td><br>
		</tr>
		<tr>
		<th>口コミ：<span class="required"> *</span></th>
		 <td><input type="number" name="restReview" min="0.0" max="5.0" step="0.1" required
			value=<%=bean.getRestReview() %>></td><br> 
		</tr>
		<tr>	
		<th>喫煙席の有無：</th>
		<td><input type="radio" name="restSmoke" value="1" <%= bean.getRestSmoke() == 1 ? "checked" : "" %>>ある
        <input type="radio" name="restSmoke" value="0" <%= bean.getRestSmoke() == 0 ? "checked" : "" %>>ない
		</td><br>
		</tr>
		<tr>
		<th>店内に喫煙所：</th>	
		<td><input type="radio" name="restSmokeRoom" value="1" <%= bean.getRestSmokeroom() == 1 ? "checked" : "" %>>ある
        <input type="radio" name="restSmokeRoom" value="0" <%= bean.getRestSmokeroom() == 0 ? "checked" : "" %>>ない
		</td><br>
		</tr>
	</table>
</div>

		<%-- 
		店ジャンル：<input type="text" name="partRuby"
			value=<%=bean.getPartRuby() %>><br> 食材カテゴリ： <input
			type="radio" name="partGender" value="男"
			<%= "男".equals(bean.getPartGender()) ? "checked" : "" %>>男 <input
			type="radio" name="partGender" value="女"
			<%= "女".equals(bean.getPartGender()) ? "checked" : "" %>>女<br>

		年齢：<input type="text" name="partAge" value=<%=bean.getPartAge() %>><br>
		入社年度：<input type="text" name="partEmpyear"
			value=<%=bean.getPartEmpyear() %>><br> 役職： <select
			name="partPostId">
			<option value="1"
				<%= bean.getPartPost() == "一般社員" ? "selected" : "" %>>一般社員</option>
			<option value="2"
				<%= bean.getPartPost() == "主任・主査" ? "selected" : "" %>>主任・主査</option>
			<option value="3" <%= bean.getPartPost() == "係長" ? "selected" : "" %>>係長</option>
			<option value="4"
				<%= bean.getPartPost() == "課長代理" ? "selected" : "" %>>課長代理</option>
			<option value="5" <%= bean.getPartPost() == "課長" ? "selected" : "" %>>課長</option>
			<option value="6"
				<%= bean.getPartPost() == "副部長" ? "selected" : "" %>>副部長</option>
			<option value="7"
				<%= bean.getPartPost() == "部長・支社長・所長" ? "selected" : "" %>>部長・支社長・所長</option>
			<option value="8"
				<%= bean.getPartPost() == "執行役員" ? "selected" : "" %>>執行役員</option>
			<option value="9"
				<%= bean.getPartPost() == "常務取締役" ? "selected" : "" %>>常務取締役</option>
			<option value="10"
				<%= bean.getPartPost() == "専務取締役" ? "selected" : "" %>>専務取締役</option>
			<option value="11"
				<%= bean.getPartPost() == "社長" ? "selected" : "" %>>社長</option>
			<option value="12"
				<%= bean.getPartPost() == "会長" ? "selected" : "" %>>会長</option>
		</select> <br> 予算：<input type="text" name="partBudget"
			value=<%=bean.getPartBudget() %>><br> アレルギー：<input
			type="text" name="partAllergy" value=<%=bean.getPartAllergy() %>><br>

		好きな食べ物のジャンル： <select name="partGenre">
			<option value="0"
				<%= "0".equals(bean.getPartGenre()) ? "selected" : "" %>>特になし</option>
			<option value="1"
				<%= "1".equals(bean.getPartGenre()) ? "selected" : "" %>>和食</option>
			<option value="2"
				<%= "2".equals(bean.getPartGenre()) ? "selected" : "" %>>洋食</option>
			<option value="3"
				<%= "3".equals(bean.getPartGenre()) ? "selected" : "" %>>中華料理</option>
			<option value="4"
				<%= "4".equals(bean.getPartGenre()) ? "selected" : "" %>>フレンチ</option>
			<option value="5"
				<%= "5".equals(bean.getPartGenre()) ? "selected" : "" %>>韓国料理</option>
			<option value="6"
				<%= "6".equals(bean.getPartGenre()) ? "selected" : "" %>>アジア・エスニック</option>
			<option value="7"
				<%= "7".equals(bean.getPartGenre()) ? "selected" : "" %>>居酒屋</option>
			<option value="8"
				<%= "8".equals(bean.getPartGenre()) ? "selected" : "" %>>焼肉</option>
			<option value="9"
				<%= "9".equals(bean.getPartGenre()) ? "selected" : "" %>>カレー</option>
			<option value="10"
				<%= "10".equals(bean.getPartGenre()) ? "selected" : "" %>>鍋</option>
		</select><br> 好きな食べ物のカテゴリ： <select name="partCategory">
			<option value="0"
				<%= "0".equals(bean.getPartCategory()) ? "selected" : "" %>>特になし</option>
			<option value="1"
				<%= "1".equals(bean.getPartCategory()) ? "selected" : "" %>>肉</option>
			<option value="2"
				<%= "2".equals(bean.getPartCategory()) ? "selected" : "" %>>魚</option>
			<option value="3"
				<%= "3".equals(bean.getPartCategory()) ? "selected" : "" %>>野菜</option>
			<option value="4"
				<%= "4".equals(bean.getPartCategory()) ? "selected" : "" %>>麺類</option>
			<option value="5"
				<%= "5".equals(bean.getPartCategory()) ? "selected" : "" %>>米料理</option>
			<option value="6"
				<%= "6".equals(bean.getPartCategory()) ? "selected" : "" %>>揚げ物</option>
			<option value="7"
				<%= "7".equals(bean.getPartCategory()) ? "selected" : "" %>>お酒</option>
		</select><br> 好きなビールの種類： <select name="partBeer">
			<option value="0"
				<%= "0".equals(bean.getPartBeer()) ? "selected" : "" %>>特になし</option>
			<option value="1"
				<%= "1".equals(bean.getPartBeer()) ? "selected" : "" %>>アサヒ</option>
			<option value="2"
				<%= "2".equals(bean.getPartBeer()) ? "selected" : "" %>>キリン</option>
			<option value="3"
				<%= "3".equals(bean.getPartBeer()) ? "selected" : "" %>>サントリー</option>
			<option value="4"
				<%= "4".equals(bean.getPartBeer()) ? "selected" : "" %>>サッポロ</option>
			<option value="5"
				<%= "5".equals(bean.getPartBeer()) ? "selected" : "" %>>エビス</option>
			<option value="6"
				<%= "6".equals(bean.getPartBeer()) ? "selected" : "" %>>クラフトビール</option>
		</select><br> タバコ： <input type="radio" name="partSmoke" value="1"
			<%= bean.getPartSmoke() == 1 ? "checked" : "" %>>吸う <input
			type="radio" name="partSmoke" value="0"
			<%= bean.getPartSmoke() == 0 ? "checked" : "" %>><br>--%>
			
			
		<input type="submit" class="submit-under-right" value="確認画面へ">
		<input type="hidden" name="restId" value="<%=bean.getRestId()%>">

<br>
	</form>

</body>
</html>