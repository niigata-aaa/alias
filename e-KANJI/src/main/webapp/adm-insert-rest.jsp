<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店追加画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<%@ include file="header-logo.jsp"%>
	飲食店情報追加画面
	<br>
	
<%--飲食店一覧表示・検索画面へ戻るボタン --%>
	<form action="adm-select-rest.jsp" method="post">
		<input type="submit" class="submit-top-right" value="飲食店一覧表示・検索画面へ戻る">
	</form>

<span class="required">*は必須入力です</span><br>

<%--飲食店情報入力＆確認画面へボタン --%>
<div class="tableArea">
<table>
	<form action="adm-insert-rest-check" method="post">
	<tr>	<th>飲食店名：<span class="required"> *</span> </th>
		 <td><input type="text" name="rest_name" required></td><br> 
	</tr>	
	<tr>	<th>店ジャンル：</th><td> <select name="rest_genre">
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
		</select></td><br>
	</tr>	
	<tr>	 <th>食材カテゴリ：</th> <td><select name="rest_category">
			<option value="0">特になし</option>
			<option value="1">肉</option>
			<option value="2">海鮮</option>
			<option value="3">野菜</option>
			<option value="4">麺</option>
			<option value="5">米</option>
			<option value="6">揚げ物</option>
			<option value="7">酒</option>
		</select> </td><br>
	</tr>	
	<tr>	<th>オープン：<span class="required"> *</span></th> 
		<td><input type="time" name="rest_open" required></td><br>
	</tr>	  
	<tr>	<th>クローズ：<span class="required"> *</span></th> 
		<td><input type="time" name="rest_close" required></td><br>
	</tr>	
	<tr>	<th>日跨ぎ営業：</th>
		<td><select name="rest_nextday">
			<option value="0">している</option>
			<option value="1">していない</option>
		</select></td>
		<br>  
	</tr>	
	<tr>	<th>距離：<span class="required"> *</span></th> 
		<td><input type="number" name="rest_distance" min="0" required>ｍ<td><br>  
	</tr>	
	<tr>	<th>予算：<span class="required"> *</span></th> 
		<td><input type="number" name="rest_budget" min="0" required>円</td><br>  
	</tr>
		
	<tr>	<th>最大収容数：<span class="required"> *</span></th> 
		<td><input type="number" name="rest_capacity" min="0" required>人</td><br>  
	</tr>	
	<tr>	<th>電話番号(-あり)：</th><td><input type="text" name="rest_tel"></td><br>  
	</tr>	
	<tr>	<th>住所：</th><td><input type="text" name="rest_address"></td><br>  
	</tr>	
	<tr>	<th>詳細URL：</th><td><input type="text" name="rest_url"></td><br>  
	</tr>	
	<tr>	<th>口コミ：<span class="required"> *</span> 
		☆</th><td><input type="number" name="rest_review"
				 min="0.0" max="5.0" step="0.1" required></td><br>  
	</tr>	
	<tr>	<th>ビールの種類：</th>
		<td><select name="rest_beer">
			<option value="0">特になし</option>
			<option value="1">アサヒ</option>
			<option value="2">キリン</option>
			<option value="3">サッポロ</option>
			<option value="4">サントリー</option>
			<option value="5">エビス</option>
			<option value="6">クラフトビール</option>
		</select></td><br>
	</tr>

	<tr>	<th>喫煙席の有無：</th>
		<td><select name="rest_smoke">
			<option value="0">あり</option>
			<option value="1">なし</option>
		</select></td><br>
	</tr>	
	<tr>	<th>店内に喫煙所：</th>
		<td><select name="rest_smokeroom">
			<option value="0">あり</option>
			<option value="1">なし</option>
		</select></td><br>
	</tr>	
</table></div>
		<input type="submit" value="確認画面へ">
	
	</form>


</body>
</html>