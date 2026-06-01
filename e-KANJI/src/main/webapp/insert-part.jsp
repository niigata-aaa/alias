<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録画面</title>
</head>
<body>
参加者情報登録画面<br>
    <form action="select-part.jsp" method="POST">
		<input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
	</form>

	<form action="insert-part-check-servlet" method="POST">
	    氏名（漢字）：<input type="text" name="part_name"><br>
		氏名（かな）：<input type="text" name="part_ruby"><br>
		性別：<input type="radio" name="part_gender" value="男">男
		      <input type="radio" name="part_gender" value="女">女<br>
		年齢：<input type="number" name="part_age" value="正の整数のみ入力"><br>
		入社年度：<input type="date" name="part_empyear"><br>
		役職：<select name="part_post">
		        <option value="1">一般社員</option>
		        <option value="2">主任・主査</option>
		        <option value="3">係長</option>
		        <option value="4">課長代理</option>
		        <option value="5">課長</option>
		        <option value="6">副部長</option>
		        <option value="7">部長・支社長・所長</option>
		        <option value="8">執行役員</option>
		        <option value="9">常務取締役</option>
		        <option value="10">専務取締役</option>
		        <option value="11">社長</option>
		        <option value="12">会長</option>
		    </select><br>
		予算：<input type="text" name="part_budget" value="正の整数のみ入力"><br>
		アレルギー：<input type="text" name="part_allergy"><br>
		好きな食べ物のジャンル：<select name="part_genre">
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
		    </select><br>
		好きな食べ物のカテゴリ：<select name="part_category">
		        <option value="0">特になし</option>
		        <option value="1">肉</option>
		        <option value="2">魚</option>
		        <option value="3">野菜</option>
		        <option value="4">麺類</option>
		        <option value="5">米料理</option>
		        <option value="6">揚げ物</option>
		        <option value="7">お酒</option>
		    </select><br>
		好きなビールの種類：<select name="part_beer">
		        <option value="0">特になし</option>
		        <option value="1">アサヒ</option>
		        <option value="2">キリン</option>
		        <option value="3">サントリー</option>
		        <option value="4">サッポロ</option>
		        <option value="5">エビス</option>
		        <option value="6">クラフトビール</option>
		    </select><br>
		タバコ：<input type="radio" name="part_smoke" value="1">吸う
		      <input type="radio" name="part_smoke" value="0">吸わない<br>
	
		<input type="submit" value="確認画面へ">
		
	</form>

</body>
</html>